<?php
/*
function loader($class)
{
$file = $class . '.php';
if (file_exists($file)) {
require $file;
}
}
spl_autoload_register('loader');
*/

if(is_readable('vendor/autoload.php')){
  // Use composer autoloader
  require 'vendor/autoload.php';
}

#require_once 'includes/class.database.php';

?>
