<?php
class FlysprayTest extends PHPUnit_Framework_TestCase{
  private $db;

  public function setUp(){
    if($_ENV['DB']=='mysql'){
      $this->db = new Database('localhost', 'root', '', 'flyspray', 'mysqli', 'flyspray_');
    } elseif($_ENV['DB']=='pgsql'){
      $this->db = new Database('localhost', 'postgres', '', 'flyspray', 'pgsql', 'flyspray_');
    } else{
      # unsupported
      die('not test for this '.$_ENV['DB']);
    }
    $this->db->Query("CREATE TABLE {projects} (what VARCHAR(50) NOT NULL)");
  }
  
  public function tearDown(){
    $this->db->Query("DROP TABLE {hello}");
  }
  
  public function testHelloWorld(){
    $helloWorld = 'Hello World';
    $this->assertEquals('Hello World', $helloWorld);
  }
  
  public function testTranslationSyntax(){
    if ($handle = opendir('lang')) {
      $languages=array();
      while (false !== ($file = readdir($handle))) {
        # exclude temporary files from onsite translations
        if ($file != "." && $file != ".." && !(substr($file,-4)=='.bak') && !(substr($file,-5)=='.safe') ) {
          $langfiles[]=$file;
        }
      }
    }

    foreach($langfiles as $lang){
      $this->assertStringStartsWith('No syntax errors', shell_exec("php -l lang/$lang"));
    }
  }
}
?>
