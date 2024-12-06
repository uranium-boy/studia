<?php

class UserManager {
    function loginForm() {
        ?>
        <h3>Formularz logowania</h3><p>
        <form action="processLogin.php" method="post">
            <label for="username">Nazwa użytkownika:</label>
            <input id="username" name="username"><br>

            <label for="passwd">Hasło:</label>
            <input id="passwd" name="passwd"><br>

            <input type="submit" value="Zaloguj" name="login">
        </form></p><?php
    }

    function login($db) {
        $args = [
            'username' => FILTER_SANITIZE_ADD_SLASHES,
            'passwd' => FILTER_SANITIZE_ADD_SLASHES
        ];

        $data = filter_input_array(INPUT_POST, $args);
        $username = $data["username"];
        $passwd = $data["passwd"];
        $userId = $db->selectUser($username, $passwd, "users");

        if ($userId >= 0) {
            session_start();
            $dt = new DateTime("now", new DateTimeZone("UTC"));
            $now = $dt->format('Y-m-d');
            $session = session_id();
            $db->delete("DELETE FROM logged_in_users WHERE userId = '$userId'");
            $db->insert("INSERT INTO logged_in_users VALUES ('$session', '$userId', '$now')");
        }
        return $userId;
    }

    function logout($db) {
        session_start();
        $sessionId = session_id();
        $db->delete("DELETE FROM logged_in_users WHERE sessionId = '$sessionId'");
//        $_SESSION = [];
        setcookie(session_name(), '', time() - 42000, '/');
        session_destroy();
        echo "Wh,oglwa o]]";
    }

    function getLoggedInUsers($db, $sessionId) {
        $userId = -1;
        if ($result = $db->mysqli->query("SELECT userId FROM logged_in_users WHERE sessionId = $sessionId")) {
            $row = $result->fetch_object();
            $userId = $row->userId;
        }
        return $userId;
    }
}

?>
