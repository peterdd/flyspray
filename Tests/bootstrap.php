<?php
function loader($class)
{
$file = $class . '.php';
if (file_exists($file)) {
require $file;
}
}
spl_autoload_register('loader');
require_once dirname(__FILE__) . '/includes/class.flyspray.php';

?>
