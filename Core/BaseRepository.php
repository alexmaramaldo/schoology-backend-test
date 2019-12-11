<?php

namespace Core;

use function array_merge;
use Config\Database;
use function implode;

class BaseRepository
{

    var $table_name = "";

    /**
     * @return array
     */
    public function all()
    {
        $sql = "SELECT * FROM " . $this->table_name . " ORDER BY created_at DESC";
        $req = Database::getBdd()->prepare($sql);
        $req->execute();
        return $req->fetchAll();
    }

    /**
     * @return array
     */
    public function query($query)
    {
        $sql = $query;
        $req = Database::getBdd()->prepare($sql);
        $req->execute();
        return $req->fetchAll();
    }

    public function insert($data)
    {
        $fields = [];
        foreach ($data as $key => $value) {
            $fields[] = $key;
        }
        $sql = "INSERT INTO " . $this->table_name . " (" . implode(',', $fields) . ", created_at, updated_at) VALUES (:" . implode(',:', $fields) . ", :created_at, :updated_at)";

        $req = Database::getBdd()->prepare($sql);

        $dates_fields = [
            'created_at' => date('Y-m-d H:i:s'),
            'updated_at' => date('Y-m-d H:i:s')
        ];
        $data_insert = array_merge($data, $dates_fields);

        $req->execute($data_insert);

        return Database::getBdd()->lastInsertId();
    }

    public function update($id, $data)
    {
        $fields = [];
        foreach ($data as $key => $value) {
            $fields[] = $key . " = :" . $key;
        }

        $sql = "UPDATE " . $this->table_name . " SET " . implode(',', $fields) . ", updated_at = :updated_at WHERE id = :id";

        $req = Database::getBdd()->prepare($sql);

        $dates_fields = [
            'updated_at' => date('Y-m-d H:i:s'),
            'id' => $id
        ];
        $data_update = array_merge($data, $dates_fields);

        return $req->execute($data_update);
    }

    /**
     * @param $id
     * @return bool
     */
    public function delete($id)
    {
        $sql = "DELETE FROM " . $this->table_name . " WHERE id = ?";
        $req = Database::getBdd()->prepare($sql);
        return $req->execute([$id]);
    }

    public function findById($id)
    {
        $sql = "SELECT * FROM " . $this->table_name . " WHERE id =" . $id;
        $req = Database::getBdd()->prepare($sql);
        $req->execute();
        return $req->fetch();
    }
}
