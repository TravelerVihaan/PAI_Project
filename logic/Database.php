<?php

class Database {
    static $db;

    function __construct(){}

    function connect(){
        $db = mysqli_connect(self::$host, self::$user, self::$password, self::$database);

        if($db){
            return $db;
        }else{
            return die('Connection error!');
        }

    }

    function query($q=""){
        return mysqli_query($this->connect(), $q);
    }
}

?>
