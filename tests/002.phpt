--TEST--
php_yield_test1() Basic test
--SKIPIF--
<?php
if (!extension_loaded('php_yield')) {
	echo 'skip';
}
?>
--FILE--
<?php
$ret = php_yield_test1();

var_dump($ret);
?>
--EXPECT--
The extension php_yield is loaded and working!
NULL
