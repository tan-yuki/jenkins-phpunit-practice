
## phpdoc

### setup

**Require packages**
- [GraphViz](http://www.graphviz.org/Download_macos.php)

### Reference
see: [http://www.phpdoc.org/docs/latest/index.html](http://www.phpdoc.org/docs/latest/index.html).

### variable types

|type             |Description                          |
|:----------------|:------------------------------------|
|integer          |整数値                               |
|string           |文字列                               |
|bool             |真偽値                               |
|array            |配列 or 連想配列                     |
|Some\My\HogeClass|Some\My\HogeClassクラスのインスタンス|
|string&#124;bool |文字列または真偽値                   |

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
descriptionは書いてあるべき。

```

```php

    /**
     * Set age property.
     * 
     * @param int $age User's age
     */
     public function setAge($age) {
         $this->age = $age;
     }
     
    /**
     * Set optional data.
     * 
     * @param mixed[string] $options Optional data
     */
     public function setOptions($options = array()) {
         $this->options = $options;
     }
     
```

#### @return

```
@return [type] ([description])

関数の戻り値を表す。
descriptionは書いてあることが望ましい。

```

```php

    /**
     * Get user's age
     * 
     * @return int User's age
     */
     public function getAge() {
         return $this->age;
     }
     
```


#### @var

```
@var [type] ([description])

変数の説明。
メンバ変数には必ず付けること。
descriptionは書いてあることが望ましい。
```

```php

    /**
     * @var int User's age.
     */
    protected $age;
     
```




