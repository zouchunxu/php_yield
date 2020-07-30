--TEST--
php_yield_test2() Basic test
--SKIPIF--
<?php
if (!extension_loaded('php_yield')) {
	echo 'skip';
}
?>
--FILE--
<?php
var_dump(php_yield_test2());
var_dump(php_yield_test2('PHP'));
?>
--EXPECT--
string(11) "Hello World"
string(9) "Hello PHP"
