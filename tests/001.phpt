--TEST--
Check if php_yield is loaded
--SKIPIF--
<?php
if (!extension_loaded('php_yield')) {
	echo 'skip';
}
?>
--FILE--
<?php
echo 'The extension "php_yield" is available';
?>
--EXPECT--
The extension "php_yield" is available
