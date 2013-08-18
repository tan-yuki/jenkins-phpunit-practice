

## phpdoc

### Reference
see: [http://www.phpdoc.org/docs/latest/index.html](http://www.phpdoc.org/docs/latest/index.html).

### variable types

|type   |Description|
|:------|:----------|
|integer|整数値|
|string |文字列|
|bool   |真偽値|
|string[]|stringタイプの配列|
|int[string]| key:string, value:int の連想配列|
|mixed[]|複数タイプが混在する配列|
|int[][]| 2次元多重配列|
|Some\My\HogeClass|Some\My\HogeClassクラスのインスタンス|
|string&#124;bool|文字列または真偽値|

### annotations

#### summary

phpdocに関するアノテーションは以下のもののみ使用。
他に使用したいアノテーションがある場合は説明とともに下記に追記すること。

- [@param](#param)
- [@return](#return)
- [@var](#var)
- [@property](property)
- [@property-read](property-read)
- [@property-write](property-write)
- [@throws](throws)
- [@see](see)
- [@package](package)
- [@deprecated](deprecated)
- [@link](link)


#### @param

```
@param [type] [name] ([description])

関数のパラメータを表す。

```

```php

    /**
     * Set age property
     * 
     * @param int $age User's age
     */
     public function setAge($age) {
         $this->age = $age;
     }
     
    /**
     * Set optional data
     * 
     * @param mixed[string] $options Optional data
     */
     public function setOptions($options = array()) {
         $this->options = $options;
     }
     
```








