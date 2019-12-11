<?php

namespace Repositories;

use Core\BaseRepository;
use Models\Suggestion;

class SuggestionRepository extends BaseRepository
{
    var $table_name = "suggestions";

    /**
     * Here, i'm use Heritage
     */
    public function allByName($name)
    {
        $query = "SELECT * FROM " . $this->table_name . " WHERE name like '%" . $name . "%' ORDER BY name ASC";
        $results = parent::query($query);

        $suggestions = [];
        foreach ($results as $tmp) {
            $suggestion = new Suggestion();
            $suggestion->id = $tmp['id'];
            $suggestion->name = $tmp['name'];
            $suggestion->created_at = $tmp['created_at'];
            $suggestion->updated_at = $tmp['updated_at'];

            $suggestions[] = $suggestion;
        }
        return $suggestions;
    }
}
