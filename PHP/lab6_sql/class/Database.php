<?php

class Database {
    private $mysqli;

    public function __construct($server, $user, $pass, $base) {
        $this->mysqli = new mysqli($server, $user, $pass, $base);

        if ($this->mysqli->connect_errno) {
            printf("Nie udało się połączyć z serwerem: %s\n", $this->mysqli->connect_error);
            exit();
        }
        if ($this->mysqli->set_charset("utf8")) {
            echo "Kodowanie: UTF-8";
        }
    }

    function __destruct()
    {
        $this->mysqli->close();
    }

    public function select($sql, $fields) {
        // $sql - query
        // $fields - database columns

        $content = "";

        if ($result = $this->mysqli->query($sql)) {
            $colnumber = count($fields);

            $content .= "<table><tbody><tr>";
            foreach ($fields as $field) {
                $content .= "<th>$field</th>";
            }
            $content .= "</tr>";
            while ($row = $result->fetch_object()) {
                $content .= "<tr>";
                for ($i = 0; $i < $colnumber; $i++) {
                    $field = $fields[$i];
                    $content .= "<td>" . $row->$field . "</td>";
                }
                $content .= "</tr>";
            }
            $content .= "</tbody></table>";
            $result->close();
        }
        return $content;
    }

    public function insert($sql) {
        if ($this->mysqli->query($sql))
            return true;
        else
            return false;
    }

    public function delete($sql) {
        if ($this->mysqli->query($sql))
            return true;
        else
            return false;
    }

    public function getMysqli() {
        return $this->mysqli;
    }
}

?>
