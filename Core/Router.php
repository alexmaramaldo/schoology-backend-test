<?php

namespace Core;

use function explode;

class Router
{

    static public function parse($url, $request)
    {
        $url = trim($url);

        if ($url == "/") {
            $request->controller = ucfirst("suggestions");
            $request->action = "index";
            $request->params = [];
        } else {
            $explode_url = explode('/', $url);
            $explode_url = array_slice($explode_url, 1);

            $request->controller = ucfirst($explode_url[0]);
            $request->action = $explode_url[1];
            if (array_slice($explode_url, 2)) {
                $param = explode("?", $explode_url[2]);
                $request->params = array_slice($param, 0);
            } else {
                $request->params = array_slice($explode_url, 2);
            }
        }
    }
}
