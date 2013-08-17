<?php
require __DIR__ . '/../src/MyUtil.php';

class MyUtilTest extends PHPUnit_Framework_TestCase {
    public function testAdd() {
        $this->assertEquals(3, MyUtil::add(1, 2));
    }
}
