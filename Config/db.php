<?php

namespace Config;

use function getenv;

class Database
{
    private static $bdd = null;

    private function __construct() {
    }

    public static function getBdd() {
        if(is_null(self::$bdd)) {
            self::$bdd = new \PDO("mysql:host=".getenv("DB_HOST").";dbname=".getenv("DB_DATABASE")."", getenv("DB_USERNAME"), getenv("DB_PASSWORD"));
        }
        return self::$bdd;
    }
}
?>