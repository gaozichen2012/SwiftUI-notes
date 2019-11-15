# Swift-notes
 苹果开发学习笔记

## Swift简介
* Swift，苹果于2014年WWDC（苹果开发者大会）发布的新开发语言，可与Objective-C共同运行于Mac OS和iOS平台，用于搭建基于苹果平台的应用程序。Swift吸收了众多现代编程语言的优点，尽力的提供简洁的编程语言和强大的功能。

## Swift语法
* Swift源文件的第一行可执行的代码就是Swift的程序的入口
* Swift把每行代码作为了一个语句，无须任何符号作为结束。但是如果2句代码写在同一行需要以' ; '分隔。
* Swift要求所有的变量和常量必须先声明后使用，声明变量需要使用var，声明常量则需要使用let；形如：var 变量名[:类型] =初始值
* Swift 用字符串print打印，使用`\()`的方式打印变量，如tom=88，print("the value=\(tom)")，输出值为the value=88
* 变量申明尽可能使用Int，可以提高代码复用性，不同数据类型转换使用Int(tom)，和C类似
* 编译：新建源程序hello.swift，在终端使用`swiftc -o hello.out hello.swift`生成hello.out，执行`./hello.out`
* 只有可选类型的变量和常量才能接收nil，非可选类型的变量和常量不能接收nil。

### 元组类型（tuples）（等同于C的结构体）
元组（tuples）把多个值组合成一个复合值
``
/* 第一种：定义元组变量并指定初始值，但不声明类型，系统推断该元组类型为(Int, Int, String) */
var game = (1, 2 , "tom")

/* 第二种：定义元组变量，并声明类型，再调用时赋值 */
var score : (Int , Int , String , Double)
score = (98 , 89 , "及格" , 20.4)

/* 元组内包含元组 */
var test : (Int , (Int , String))
test = (20 , (15 , "tom"))

/* 访问元组的单个元素，元组的下标从0开始 */
print("game元组的排名元素为：\(game.0)")
print("game元组的名称元素为：\(game.2)")
print("test元组的第2个元素的第2个元素为：\(test.1.2)")

/* 第三种：使用key:value的形式来定义元组元素的名称和类型（最常用） */
var score : (java:Int , swift:Int , oc:String , ruby:Double)
score = (99 , 60 , "及格" , 20.1) //简单为每个元素指定值，此时必须按顺序为每个元素指定值
score = (oc:"及格" , swift:60 , java:99 , ruby:20.1) //通过key为元组的元素指定值，在这种方式下，元组内各元素的顺序可以调换
``

### 值缺失
比如一个字符串"11"转换为Int类型为0x11，转换成功；但是一个字符串"abc"强行转换为Int类型，则会转化失败，无法返回Int值，这就是值缺失

### 可选类型
任何数据类型跟?就是可选类型，比如`var num1:Int? = 3`，可选类型的变量可用于处理“值缺失”
``
var str = "tom"
var num :Int = str.toInt()//会报错
var num1: Int? = str.toInt()//正确的代码
``
上面代码第二行会报错，因为字符串"tom"无法转换为Int类型，转换失败，此时就会出现值缺失
第三行num1是可选类型，出现值缺失，num1会储存转换结果nil，nil表示值缺失
#### 强制解析
Int?类型与Int类型不是相同的类型，直接=赋值会报错，赋值时需要在可选类型的值后面加`!`，这个叹号表示已知该可选变量有值，请提取其中的值，这种添加叹号进行解析的方法称之为强制解析。
``
/* str是String?类型的，不能赋值给String类型的s变量 */
var str : String? = "tom"
var s : String = str//会报错

/* 正确写法见下 */
var s : String = str!
print(s)
``
强制解析必须是可选类型的变量或者常量确实有值时才能够解析成功，否则会报错。为了去报强制解析不会导致运行是错误，Swift提供了if语句来判断可选类型是否有值，因此可选类型和强制解析的正确格式如下：
``
var str : String? = "tom"
if str != nil
{
    var s : String = str!
    print(s)
}else{
    print("str为nil，不能强制解析")
}
``
#### 隐式可选类型
隐式可选就是在任意的已有类型后面添加`!`，拿Int类型举例，Int?和Int!的区别就是：当程序获取Int?类型的值时，程序必须在变量名后添加`!`后缀来进行强制解析，而Int!则不需要，Swift会自动的执行隐式解析
``
/* 对于String?可选类型，必须使用感叹号执行强制解析 */
var s1: String? = "tom1"
var tmp : String = s1!

/* 对于String!隐式可选类型，无需使用感叹号执行强制解析 */
var s2 : String! = "tom2"
var tmp2 : String = s2
``
需要注意的是隐式可选类型的值如果没有值的情况下，如果程序尝试获取该值同样会导致运行时错误，和强制解析一样，我们用if语句来判断隐式可选类型是否有值，则隐式可选类型的标准格式如下：
``
var str : String! = "tom"
if str != nil {
var s : String = str
print(s)
}else{
   print("s为nil，不能强制解析")
}
``
#### 可选绑定
可选绑定用来判断可选是否包含值，如果包含就把值赋给一个临时常量或者变量。可选绑定一般用在 if 和 while 语句中，对可选的值进行判断并把值赋给一个常量或者变量。
``
var str : String! = "tom"

if var tmp = str // 如果可选变量str有值，将值赋值给tmp变量。
{
    print("str的值为：\(tmp)")
}else{
    print("str的值为nil，不能解析！")
}

``

# 明天研究Swift的字符和字符串
https://www.kancloud.cn/digest/iosdeveloper/124926

## Playground工具介绍
![Xcode截图](https://github.com/gaozichen2012/Swift-notes/blob/master/img/1-Xcode%E6%88%AA%E5%9B%BE.jpg)
Playground是Xcode的一个简单的测试环境，主要是用于快速测试Swift语法功能和验证API功能，并不是用来进行实际开发应用。如果开发者对Swift语法功能不太确定，则可以用Playground来测试代码，其次Playground也可以用来验证某个函数，类的功能。