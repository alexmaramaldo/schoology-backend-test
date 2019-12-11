<?php

declare(strict_types=1);

require_once './vendor/autoload.php';

use PHPUnit\Framework\TestCase;
use Repositories\SuggestionRepository;

final class SuggestionTest extends TestCase
{
    private $id;
    private $name;
    private $suggestionRepository;

    protected function setUp()
    {
        $dotenv = Dotenv\Dotenv::create(__DIR__ . "/../");
        $dotenv->load();

        $this->suggestionRepository = new SuggestionRepository();
        $this->name = 'NameTester-' . md5("fake" . rand(10000, 99999));
        $data = [
            "name" => $this->name
        ];

        $this->id = $this->suggestionRepository->insert($data);
    }

    public function testIfNameExists()
    {
        $this->assertEquals(
            $this->name,
            $this->suggestionRepository->findById($this->id)["name"]
        );
    }

    protected function tearDown()
    {
        $this->suggestionRepository->delete($this->id);
    }
}
