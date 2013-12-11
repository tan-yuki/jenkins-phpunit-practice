<?php
require __DIR__ . '/../src/MyUtil.php';

class MyUtilTest extends PHPUnit_Framework_TestCase {
    public function testAdd() {
        $this->assertEquals(3, MyUtil::add(1, 2));
    }
    public function testAdd_2() {
        $this->assertEquals(4, MyUtil::add(2, 2));
    }
}
