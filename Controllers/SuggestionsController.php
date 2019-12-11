<?php

namespace Controllers;

use Core\ApiBaseController;
use Core\Notifications;
use Repositories\SuggestionRepository;

class SuggestionsController extends ApiBaseController
{
    var $suggestionRepository;

    public function __construct()
    {
        $this->suggestionRepository = new SuggestionRepository();
    }

    /**
     * index function
     *
     * @return JSON
     */
    function index($name)
    {
        $suggestions = $this->suggestionRepository->allByName($name);

        header('Content-type: application/json');
        echo $this->sendResponse($suggestions, "Retrivied with success");
        exit;
    }

    public function create()
    {
        if (empty($_POST)) {
            $_POST = json_decode(file_get_contents("php://input"), true) ?: [];
        }

        $input = $_POST;
        $data = [
            "name" => $input['name']
        ];

        header('Content-type: application/json');
        if ($id = $this->suggestionRepository->insert($data)) {
            echo $this->sendResponse($id, "Save with success");
        } else {
            echo $this->sendError("Error on save", 500);
        }
        exit;
    }
}
