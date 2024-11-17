<?php

class User {
    const STATUS_USER = 1;
    const STATUS_ADMIN = 2;

    protected $userName;
    protected $passwd;
    protected $fullName;
    protected $email;
    protected $date;
    protected $status;

    function __construct($userName, $fullName, $email, $passwd) {
        $this->status = User::STATUS_USER;
        $this->userName = $userName;
        $this->fullName = $fullName;
        $this->email = $email;
        $this->passwd = password_hash($passwd, PASSWORD_BCRYPT);
        $this->date = new DateTime("now", new DateTimeZone("UTC"));
    }

    public function show() {
        echo "<p>Username: $this->userName</p>";
        echo "<p>Fullname: $this->fullName</p>";
        echo "<p>Email: $this->email</p>";
        echo "<p>Date:" . $this->date->format('Y-m-d') . "</p>";
        echo "<p>Status: $this->status</p>";
        echo "<p>Hashed password: $this->passwd</p>";
    }

    public function setUserName($userName) {
        $this->userName = $userName;
    }

    public function getUserName() {
        return $this->userName;
    }

    // passwd
    public function setPasswd($passwd) {
        $this->passwd = password_hash($passwd, PASSWORD_BCRYPT);
    }

    public function getPasswd() {
        return $this->passwd;
    }

    // fullName
    public function setFullName($fullName) {
        $this->fullName = $fullName;
    }

    public function getFullName() {
        return $this->fullName;
    }

    // email
    public function setEmail($email) {
        $this->email = $email;
    }

    public function getEmail() {
        return $this->email;
    }

    // date
    public function setDate($date) {
        if ($date instanceof DateTime) {
            $this->date = $date;
        } else {
            $this->date = new DateTime($date, new DateTimeZone('UTC'));
        }
    }

    public function getDate() {
        return $this->date;
    }

    // status
    public function setStatus($status) {
        $this->status = $status;
    }

    public function getStatus() {
        return $this->status;
    }}

?>
