<?php
class FlysprayTest extends PHPUnit_Framework_TestCase{
  private $db;

  public function setUp(){
    this->db = new Database;
    this->db->dbOpen($GLOBALS['dbhost'], $GLOBALS['dbuser'], $GLOBALS['dbpass'], $GLOBALS['dbname'], $GLOBALS['dbtype'], $GLOBALS['dbprefix']);
    this->db->Query("CREATE TABLE {projects} (what VARCHAR(50) NOT NULL)");
  }
  
  public function tearDown(){
    #this->db->Query("DROP TABLE {hello}");
  }

  public function testFail(){
    $this->assertEquals(1,0);
  }
  public function testDbTableInfo(){
    # just testing/experimenting for travis-ci
    #$this->db->Query('SHOW cREATE TABLE {project}'); # should pass on mysql, fail on postgres
    
    $this->assertEquals('mysql',$GLOBALS['dbtype']); # test if we come this far mysql/mysqli
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
