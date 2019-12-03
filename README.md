# Swift简介
* Swift，苹果于2014年WWDC（苹果开发者大会）发布的新开发语言，可与Objective-C共同运行于Mac OS和iOS平台，用于搭建基于苹果平台的应用程序。Swift吸收了众多现代编程语言的优点，尽力的提供简洁的编程语言和强大的功能。

# 相关资源
## Swift官网
https://Swift.org/
## Xcode官方介绍（英文）
https://help.apple.com/xcode/mac/current/#/devc8c2a6be1
## Swift编程语言文档（英文，官方参考文档）
https://swift.org/documentation/#the-swift-programming-language
## Swift编程语言文档（中文，官方中文参考文档）
https://github.com/SwiftGGTeam/the-swift-programming-language-in-chinese
## Swift教程（不了解Swift语法概念可查阅此文档）
https://swiftgg.gitbook.io/swift/swift-jiao-cheng
## SwiftUI官网首页（英文原版）
https://developer.apple.com/documentation/swiftui/
## SwiftUI官方开发教程（英文原版）
https://developer.apple.com/tutorials/swiftui/creating-and-combining-views
## SwiftUI官方开发教程（中文）
https://github.com/WillieWangWei/SwiftUI-Tutorials
## 哔哩视频1：用SwiftUI构建完整应用
https://www.bilibili.com/video/av64681507/
## 哔哩视频2：从零开发苹果手机App
https://www.bilibili.com/video/av61957676/
## 博客1：SwiftUI 的一些初步探索 (一)
https://onevcat.com/2019/06/swift-ui-firstlook/

# 记忆点
* `ctrl+i` 自动格式化代码（先选中一段代码）
* `shift+command+L` 调出库Library

# 需求点
* Mac Windows多终端同步助手
* 微博朋友圈qq空间insFacebook同步助手
* 照片滤镜，摄影模板助手
* 单词本助手
* gif转换助手
* 看iPhone MAC app store付费榜以半价策略攻击

# Swift语法
* Swift源文件的第一行可执行的代码就是Swift的程序的入口
* Swift把每行代码作为了一个语句，无须任何符号作为结束。但是如果2句代码写在同一行需要以`;`分隔。
* Swift要求所有的变量和常量必须先声明后使用，声明变量需要使用var，声明常量则需要使用let；形如：var 变量名[:类型] =初始值
* Swift 用字符串print打印，使用`\()`的方式打印变量，如`tom=88，print("the value=\(tom)")`，输出值为`the value=88`
* 变量申明尽可能使用Int，可以提高代码复用性，不同数据类型转换使用`Int(tom)`，和C类似
* 编译：新建源程序hello.swift，在终端使用`swiftc -o hello.out hello.swift`生成hello.out，执行`./hello.out`
* 只有可选类型的变量和常量才能接收nil，非可选类型的变量和常量不能接收nil。
* 使用if和switch没有括号，比如`if a==true`
* 刷新 preview 的快捷键：Option + Command + P


## 元组类型（tuples）（等同于C的结构体）
元组（tuples）把多个值组合成一个复合值
```
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
```

## 值缺失
比如一个字符串"11"转换为Int类型为0x11，转换成功；但是一个字符串"abc"强行转换为Int类型，则会转化失败，无法返回Int值，这就是值缺失

## 可选类型
任何数据类型跟?就是可选类型，比如`var num1:Int? = 3`，可选类型的变量可用于处理“值缺失”
```
var str = "tom"
var num :Int = str.toInt()//会报错
var num1: Int? = str.toInt()//正确的代码
```
上面代码第二行会报错，因为字符串"tom"无法转换为Int类型，转换失败，此时就会出现值缺失
第三行num1是可选类型，出现值缺失，num1会储存转换结果nil，nil表示值缺失
### 强制解析
Int?类型与Int类型不是相同的类型，直接=赋值会报错，赋值时需要在可选类型的值后面加`!`，这个叹号表示已知该可选变量有值，请提取其中的值，这种添加叹号进行解析的方法称之为强制解析。
```
/* str是String?类型的，不能赋值给String类型的s变量 */
var str : String? = "tom"
var s : String = str//会报错

/* 正确写法见下 */
var s : String = str!
print(s)
```
强制解析必须是可选类型的变量或者常量确实有值时才能够解析成功，否则会报错。为了去报强制解析不会导致运行是错误，Swift提供了if语句来判断可选类型是否有值，因此可选类型和强制解析的正确格式如下：
```
var str : String? = "tom"
if str != nil
{
    var s : String = str!
    print(s)
}else{
    print("str为nil，不能强制解析")
}
```
### 隐式可选类型
隐式可选就是在任意的已有类型后面添加`!`，拿Int类型举例，Int?和Int!的区别就是：当程序获取Int?类型的值时，程序必须在变量名后添加`!`后缀来进行强制解析，而Int!则不需要，Swift会自动的执行隐式解析
```
/* 对于String?可选类型，必须使用感叹号执行强制解析 */
var s1: String? = "tom1"
var tmp : String = s1!

/* 对于String!隐式可选类型，无需使用感叹号执行强制解析 */
var s2 : String! = "tom2"
var tmp2 : String = s2
```
需要注意的是隐式可选类型的值如果没有值的情况下，如果程序尝试获取该值同样会导致运行时错误，和强制解析一样，我们用if语句来判断隐式可选类型是否有值，则隐式可选类型的标准格式如下：
```
var str : String! = "tom"
if str != nil {
var s : String = str
print(s)
}else{
   print("s为nil，不能强制解析")
}
```
#### 可选绑定
可选绑定用来判断可选是否包含值，如果包含就把值赋给一个临时常量或者变量。可选绑定一般用在 if 和 while 语句中，对可选的值进行判断并把值赋给一个常量或者变量。
```
var str : String! = "tom"

if var tmp = str // 如果可选变量str有值，将值赋值给tmp变量。
{
    print("str的值为：\(tmp)")
}else{
    print("str的值为nil，不能解析！")
}
```
##字符串
* 单个字符用`"A"`,而不是单引号
* 创建字符串可以用`var str1:String="tom1"`，也可以使用结构体创建`var str1=String("tom")`
* 区分可变与不可变字符串使用var和let，比如：`var str1="可变字符串"`和`let str1="不可变字符串"`
### 字符串比较(常用)
Swift提供了3种方式来比较字符串：
1.字符串相等`==`
2.前缀相等`hasPrefix()`
3.后缀相等`hasSuffix()`
```
var str1="tomisdog"
var hasPrefix:Bool=str1.hasPrefix("tomi")
print(hasPrefix)//结果为true
```

## 运算符
Swift的赋值运算符`=`、算数运算符`+ - * /`、位运算符`& | ^ ~ << >>`、比较运算符`== != > < >= <=`、逻辑运算符`! && ||`和C语言的使用保持一致，下面这些是有区别的地方：
## 溢出运算符
Swift不允许整型变量或者常量溢出，所以提供以&开头的5个溢出运算符
* 溢出加法 &+
* 溢出减法 &-
* 溢出乘法 &*
* 溢出除法 &/
* 溢出求余 &%

比如下面例子使用了溢出加法&+来处理无符号整数的上溢出：
```
var max1 = UInt8.max // max1等于UInt8的最大整数 255

max1= max1&+ 1 // 这时候max1等于0
```
max用UInt8最大值255(二进制11111111)，然后用&+加1，数据溢出为二进制100000000，取后取后8位（UInt8），即0。见下图解释：
![溢出运算符](https://github.com/gaozichen2012/Swift-notes/blob/master/img/2-%E6%BA%A2%E5%87%BA%E8%BF%90%E7%AE%97%E7%AC%A6.jpg)
同理还有下溢出，所以上溢=0，下溢=最大值
## 范围运算符
Swift包括两个范围的运算符，用于表达值的范围。第一个是闭范围运算符，第二个是半开范围运算符
### 闭范围运算符
闭范围运算符`a…b`定义一个包含从a到b(包括ab)的所有值的范围，其中a不能大于b。
闭范围运算符在迭代一个范围的所有值时是非常有用的，如在for-in循环中
```
for num in 1...5 {
    print(num) //打印1-5
}
```
### 半开范围运算符
半开范围运算符`a..<b`用于定义一个从a到b(包括a边界不包括b边界)，其中a不能大于b。
```
for num in 1..<5 {
    print(num) //打印1-4
}
```

### nil合并运算符
nil合并运算符`??`，它的格式为`a ?? b`，就是如果a为nil，则程序会返回b的值
```
let str1="tom1"
var str2:String?
print(str2 ?? str1)// 输出"tom1"
```
## if&switch&while&for
* if没有括号
* Swift的任意一个case块执行完成后会自动终止该switch语句，因此要求每个case块至少要包含一条语句，否则会导致编译错误。
几个例子：
* if&switch&while&for几个关键字用法和C基本一致，只是没有了括号
```
/* if用法 */
var age = 30
if age > 20
{
    print("年龄大于20岁")
}
else
{
    print("年龄小于等于20岁")
}

/* switch用法 */
var score = 78
switch score
{
    case 91...100:
        print("优秀")
    case 81...90: 
        print("良好")
    case 71...80: 
        print("中")
    case 60...70: 
        print("及格")
    case 0..<60: 
        print("不及格")
    default: 
        break
}

/* while用法 */
var count = 0
while count < 10
{
    print("count:\(count)")
    // 迭代语句
    count++
}

/* for用法 */
for var count = 0 ; count < 10 ; count++
{
    print("count: \(count)")
}

/* for-in用法 */
for number in 1..3
{
    print(number)
}
```
## 数组
声明数组有两种语法：
1. 使用泛型语法。格式为：Array
2. 使用简化语法。格式为：[类型]
创建数组也有两种方式： 
1. 使用Array的构造器创建数组 
2. 使用简化语法创建数组
```
/* 使用泛型语法声明数组 */ 
var arr : Array<String>
/* 使用简化语法声明数组 */ 
var names : [String]

/* 创建一个空数组，并将该空数组赋值给myArr变量 */ 
arr= Array<String>()

/* 创建一个包含10个"moon"元素的数组，并将该数组赋值给names变量 */ 
names = Array<String>(count: 10, repeatedValue: "moon")

/* 使用简化语法创建数组，并将数组赋值给values变量 */ 
var values = ["2" , "3" , "3" , "4" , "5" , "6"] 

/* for循环遍历数组 */
for var i = 0; i < values .count ; i++
{
    print(values[i])
}

/* Array提供了append()方法来添加元素，或者用+加号直接添加 */
var languages = ["Swift"]
languages.append("Java")// 添加元素,输出为["Swift","Java"]
languages=languages+["Ruby"]

/* Array提供了insert()方法来添加元素 */
languages.insert("Go" , atIndex:0)// 插入元素，这时数组第一个元素为"Go"
```
Array支持在”[]”中使用Range，这样可以一次性获取和赋值多个数组元素：
```
var languages = ["Swift", "OC", "PHP", "Perl" , "Ruby" , "Go"]

let subRange = languages[1..<4]// 获取languages中数组中索引为1~4的元素
print(subRange)  // 输出[OC, PHP, Perl]

languages[2...4] = ["C/C++" , "Python"]// 将languages中数组中索引为2~4的元素替换成"C/C++" , "Python"
print(languages)  // 输出[Swift, OC, C/C++, Python, Go]

languages[0..<languages.count] = []// 清空数组
print(languages)  // 输出[]
```
Array提供了removeAtIndex()、removeLast()和removeAll()方法来进行删除：
```
var languages = ["Swift", "OC", "PHP", "Perl" , "Ruby" , "Go"]

languages.removeAtIndex(2)// 删除索引为2的元素，删除"PHP"
print(languages)  // 输出[Swift,Perl,OC, Ruby, Go]

languages.removeLast()// 删除最后一个元素，删除"Go"
print(languages)  // 输出[Swift, Perl,OC, Ruby]

languages.removeAll()// 删除所有元素
print(languages)  // 输出[]
print(languages.count)  // 输出0
```
## 字典
创建字典也有两种方式：
1. 使用Dictionary的构造器
2. 使用简化语法
```
/* 创建一个Dictionary结构体，使用默认的参数 */ 
dict = Dictionary<String, String>()
scores = Dictionary<String, Int>(minimumCapacity:5)// minimumCapacity至少包含键值对的个数，默认值为2

// 使用简化语法创建字典
var health = ["身高":"178" , "体重":"75"]
```
访问字典的value需要在字典变量后紧跟一个方括号”[]”就可以了，方括号里是字典value对应的key值。
```
var height = health["身高"]//将key值赋值给height 
print(height) // 输出Optional("178")

var energy = health["能量"]// 访问并不存在的key对应的value时，将会返回nil
print(energy)  // 输出nil
```
根据key值访问字典对应的value时，因为字典不确定是否这个键值对存在，当键值对存在时则返回key对应的value，否则就返回nil。这时我们可以通过强制解析来解决这个问题：
```
var height : String? = health["身高"]//height的类型是String?,而不是String
if height != nil
{
    print(height!)// 使用!执行强制解析，输出为178
}
```
for-in循环同样可以用来遍历字典：
```
for heal in health
{
 print(heal) //输出 ("身高",178) ("体重",75)
}
```
字典提供了updataValue()方法来修改字典的value值，该方法会返回一个Sting?类型的值，如果key值存在则修改成功，如果key值不存在则返回nil，但会新增一个key-value值
```
var healths = ["身高":"178" , "体重":"75"]
var result=healths.updateValue("68",forKey:"体重")
print(result) // 输出Optional("75")
print(health) // 输出["身高":"178" , "体重":"68"]
var result=healths.updateValue("A",forKey:"血型")
print(health) // 输出["血型":"A","身高":"178" , "体重":"68"]
```
删除元素：
```
/* 使用removeValueForKey：删除指定key对应的value */
var languages = ["Swift":9000, "OC":8600, "PHP":3400, 
    "Perl":4300 , "Ruby":5600 , "Go": 5600]

languages.removeValueForKey("PHP")// 删除key为"PHP"的key-value对
languages.removeValueForKey("Perl")// 删除key为"Perl"的key-value对

print(languages)// 输出：[Go: 5600, OC: 8600, Ruby: 5600, Swift: 9000]
print(languages.count)  // 输出4

/* 将Key对应的Value值赋值为nil来删除该key-value对 */
languages["Go"] = nil// 删除key为"Go"的key-value对
print(languages)  // 输出[OC: 8600, Ruby: 5600, Swift: 9000]

/* 使用removeALL删除所有元素 */ 
languages.removeAll()
print(languages)  // 输出[:]
print(languages.count)  // 输出0
```
## 函数
* 函数可以作为另一个函数的返回值，也可以当做参数传入另一个函数
使用`func`来声明一个函数，使用名字和参数来调用函数。使用`->`来指定函数返回值的类型。
```
func greet(person: String, day: String) -> String {
    return "Hello \(person), today is \(day)."
}
greet(person:"Bob", day: "Tuesday")
```
默认情况下，函数使用它们的参数名称作为它们参数的标签，在参数名称前可以自定义参数标签，或者使用 _ 表示不使用参数标签。
```
func greet(_ person: String, on day: String) -> String {
    return "Hello \(person), today is \(day)."
}
greet("John", on: "Wednesday")
```
使用元组来生成复合值，比如让一个函数返回多个值。该元组的元素可以用名称或数字来获取。
```
func calculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
    var min = scores[0]
    var max = scores[0]
    var sum = 0

    for score in scores {
        if score > max {
            max = score
        } else if score < min {
            min = score
        }
        sum += score
    }

    return (min, max, sum)
}
let statistics = calculateStatistics(scores:[5, 3, 100, 3, 9])
print(statistics.sum)
print(statistics.2)
```
函数可以嵌套。被嵌套的函数可以访问外侧函数的变量，你可以使用嵌套函数来重构一个太长或者太复杂的函数。
```
func returnFifteen() -> Int {
    var y = 10
    func add() {
        y += 5
    }
    add()
    return y
}
returnFifteen()
```
## 闭包（使用方法未了解清楚，待了解）
* 函数实际上是一种特殊的闭包
* 涉及到函数作为参数的那些方法时,使用闭包很有用
* 闭包一般格式为`{ in }`函数体部分由关键字`in`引入。`in`表示闭包的参数和返回值类型定义已经完成，闭包函数体即将开始。
* Swift 自动为内联闭包提供了参数名称缩写功能，你可以直接通过 $0，$1，$2 来顺序调用闭包的参数，以此类推。
* 有很多种创建更简洁的闭包的方法。如果一个闭包的类型已知，就可以忽略参数，返回值，甚至两个都忽略。
使用 {} 来创建一个匿名闭包。使用 in 将参数和返回值类型的声明与闭包函数体进行分离。
```
numbers.map({(number: Int) -> Int in
    let result = 3 * number
    return result
})
```
### 闭包表达式优化
Swift 的闭包表达式拥有简洁的风格，并鼓励在常见场景中进行语法优化，主要优化如下：
1. 利用上下文推断参数和返回值类型
2. 隐式返回单表达式闭包，即单表达式闭包可以省略 return 关键字
3. 参数名称缩写
4. 尾随闭包语法
比如一个给数组排序的方法`reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in return s1 > s2 } )`,通过上下文推断、隐式返回、参数名缩写等规则可简写为`reversedNames = names.sorted(by: >)`

### 尾随闭包
定义尾随闭包的原因是有一些很长的闭包表达式，正常格式无法满足，所以需要一种新的格式，则是尾随闭包。当闭包非常长以至于不能在一行中进行书写时，尾随闭包变得非常有用。
```
func someFunctionThatTakesAClosure(closure: () -> Void) {
    // 函数体部分
}

// 不使用尾随闭包进行函数调用
someFunctionThatTakesAClosure(closure: {
    // 闭包主体部分
})

// 使用尾随闭包进行函数调用
someFunctionThatTakesAClosure() {
    // 闭包主体部分
}
```
上章节中的字符串排序闭包可以作为尾随包的形式改写在`sorted(by:)`方法圆括号的外面：
```
reversedNames = names.sorted() { $0 > $1 }
```
如果闭包表达式是函数或方法的唯一参数，则当你使用尾随闭包时，你甚至可以把 () 省略掉：
```
reversedNames = names.sorted { $0 > $1 }
```

通过尾随闭包语法，可以优雅地在函数后封装了闭包的具体功能，而不再需要将整个闭包包裹在()方法的括号内。

函数的传入参数中`_`表示什么意思？比如`func backward(_ s1: String, _ s2: String) -> Bool { return s1 > s2`}
闭包概念研究：https://swiftgg.gitbook.io/swift/swift-jiao-cheng/07_closures

## 对象和类（class未了解清楚，待了解）
123


# Playground工具介绍
![Xcode截图](https://github.com/gaozichen2012/Swift-notes/blob/master/img/1-Xcode%E6%88%AA%E5%9B%BE.jpg)
Playground是Xcode的一个简单的测试环境，主要是用于快速测试Swift语法功能和验证API功能，并不是用来进行实际开发应用。如果开发者对Swift语法功能不太确定，则可以用Playground来测试代码，其次Playground也可以用来验证某个函数，类的功能。



## CocoaPods
CocoaPods应该是iOS最常用最有名的类库管理工具了，通过CocoaPods工具我们可以为项目添加被称为“Pods”的依赖库（这些类库必须是CocoaPods本身所支持的），并且可以轻松管理其版本。（基本所有公司都在使用）

## Mockplus
Mockplus（摹客）是一款简洁快速的原型图设计工具












































# SwiftUI
* 苹果基于Swift开发出的一套通用UI，SwiftUI 原生支持“动态字体”、“深色模式”、本地化和辅助功能
* SwiftUI在Xcode11中可以使用图形化界面拖拽，并实时在代码中更改
* SwiftUI支持所有苹果设备ios/pados/watch os
* 



# Views and Controls（视图和控件）
视图`Views `用于显示自定义的内容`content`，控件`Controls`负责处理用户交互。
视图`Views`包含文本`text`，图像`images`，形状`shapes`，自定义工程图`custom drawings`等。
## 视图和控件实现
* 控制视图的大小，位置和外观属性。
* 响应点击，手势和其他用户交互。
* 支持拖放操作。
* 自定义动画和过渡。
* 设置样式首选项和其他环境数据。

# Stack
使用`Stack`来组合和嵌入多个视图`Views`，让它们以水平、垂直或从后到前的顺序组合在一起。堆叠视图提供了不论是以栏或者以列为布局方式的集合视图。可以在另一个堆叠视图来嵌入一个堆叠视图
* Stack包括struct`VStack`、struct`HStack`、struct`ZStack`。其中VStack将视图垂直排列；HStack将视图水平排列；ZStack将视图叠加排列

# Lists and Scroll Views（列表和滚动视图）
列表和滚动视图包含struct`List`、protocol`DynamicViewContent`、protocol`Identifiable`、struct`ForEach`、struct`ScrollView`、enum`Axis`
## list
## DynamicViewContent
## Identifiable
## ForEach
## ScrollView
## Axis

# Container Views（容器视图）
容器视图包含struct`From`、struct`Group`、struct`GroupBox`、struct`Section`

# Spacers and Dividers（空格和分割线）
* Spacer()：是一个灵活的空间视图，它可以沿着包含堆栈布局的主轴进行扩展，从而实现不同尺寸屏幕自适应，在两个内容中间添加`Spacer()`
* padding():填充，给目标一些填充空间，不至于贴边

# asset catalog（资源目录）
* asset catalog是 iOS app 开发必不可少的组成部分。我们一般将图片存放其中，但其用途远不止于此。
![asset catalog截图](https://github.com/gaozichen2012/Swift-notes/blob/master/img/3-asset%20catalog.jpg)
* asset catalog是 Xcode 提供的项目资源管理工具，其核心理念在于：以设备特征（traits）为单位配置资源，包括但不限于图片，颜色，材质，数据。既让开发者免于代码配置资源的烦恼，也让苹果能够更好的控制 .ipa 包。
* asset catalog 本质是一个文件目录。

# SF Symbols
WWDC 2019苹果发布SF Symbols，SF Symbols是苹果发布的一套内置的图标库, 大概有 1500 个内置图标, 并且提供了相关的 API 让我们更方便的使用，这些内置图标不仅仅是简单的图片, 他们可以像文字一样, 支持放大缩小加粗操作
*  SF Symbols中的SF表示San Francisco，Symbols表示符号，SF Symbols对应的是San Francisco system font（苹果设计的一种系统字体应用于mac）
## 使用方法
在程序中直接使用`Image(systemName: house)`调用，其中`house`是从SF Symbols中获取到的icons的名字
![SF Symbols](https://github.com/gaozichen2012/Swift-notes/blob/master/img/4-SF-Symbols.jpg)

# Combine（先了解概念，后续继续研究）
SwiftUI和Combine是WWDC2019发布的两大新框架，与SwiftUI配套的响应式编程框架Combine是一套通过组合变换事件操作来处理异步事件的标准库。
SwiftUI与Combine结合来控制业务数据的单向流动，让开发者无需关心数据流向，一些原来需要费时费力的处理工作由Combine包自动化处理，让开发复杂度大大降低

* 事件执行过程的关系包括：被观察者Observable和观察者Observer，在Combine中对应着Publisher和Subscriber


# Property Wrappers（属性包装器）
属性包装器的概念首先是从 SE-0258 提议中提出的。主要目的是将一些封装属性的逻辑从不同的结构中抽离出来，并复用到整个代码库中。这个提议苹果并未接受，但在 Xcode beta 的 Swift 5.1 快照中就有它了。
* SwiftUI 提供的属性包装器包括 @State, @Binding, @ObjectBinding, @EnvironmentObject, 和 @Environment 。
## @State
通过使用 @State 修饰器我们可以关联出 View 的状态。 SwiftUI 将会把使用过 @State 修饰器的属性存储到一个特殊的内存区域，并且这个区域和 View struct 是隔离的，只有关联的视图及其子视图能够访问它。当@State 属性值改变，SwiftUI 会重构与之相关的视图。
![使用State截图](https://github.com/gaozichen2012/Swift-notes/blob/master/img/5-%E5%B1%9E%E6%80%A7%E8%A3%85%E9%A5%B0%E5%99%A8state.jpg)
## @Binding （捆绑）
有时候我们会把一个视图的属性传至子节点中，但是又不能直接的传递给子节点，因为在 Swift 中值的传递形式是值类型传递方式，也就是传递给子节点的是一个拷贝过的值。但是通过 @Binding 修饰器修饰后，属性变成了一个引用类型，传递变成了引用传递，这样父子视图的状态就能关联起来了。
* 在子视图中使用@Binding修饰，在父视图中使用关键字`$`传递一个绑定引用
![使用Binding截图](https://github.com/gaozichen2012/Swift-notes/blob/master/img/6-%E5%B1%9E%E6%80%A7%E8%A3%85%E9%A5%B0%E5%99%A8Binding.jpg)
## @ObservedObject （被观测的对象）
@ObservedObject 的用处和 @State 非常相似，从名字看来它是来修饰一个对象的，这个对象可以给多个独立的 View 使用。如果你用 @ObservedObject 来修饰一个对象，那么那个对象必须要实现ObservableObject协议，然后用 @Published 修饰对象里属性，表示这个属性是需要被 SwiftUI 监听的
```
import SwiftUI
import Combine  //结合，Combine允许我们创建储存数据，并且进行数据操作的框架

//定义一个可被观测的数据类型，调用UpdateStore这个class就可以自动更新并储存updates
class UpdateStore : ObservableObject {
    @Published var updates: [Update] = updateData //定义一个可操作性的数据updates初始值为updateData
}

```
class定义了一个UpdateStore类，这个类可以给不同的 View 使用，SwiftUI 会追踪使用 View 里经过 ObservableObject 修饰过的对象里进过 @Published 修饰的属性变换，一旦发生了变换，SwiftUI 会自动更新相关联的 UI
![ObservedObject的使用]()

## @ObjectBinding 
## @EnvironmentObject
## @Environment
未用到暂时不管
详细参考：
1. https://blog.csdn.net/kmyhy/article/details/97176972
2. 英文原版：https://swiftwithmajid.com/2019/06/12/understanding-property-wrappers-in-swiftui/
3. https://www.cnblogs.com/xiaoniuzai/p/11417123.html

学习点：
* 了解滚动视图及相关参数的使用ScrollView
* 了解整理Combine包和ObservableObject @ObservedObject 相关概念
* 了解掌握导航列表的使用NavigationView-NavigationLink通用框架
* 了解掌握导航列表的相关编辑/删除/移动/添加的使用，及数据的修改（原来是定义只读数据，实际运用中大部门都是可编辑的列表和数据）

# Wartime preparation
## 创建和使用结构体
声明结构体要遵循Identifiable协议，此协议中只有一个必须的属性：id，它用来让SwiftUI区分不同的item
* 一般默认`id=UUID()`，UUID是Swift用来标识协议类型、接口和一些其他item
```
//创建一个数据结构体Course存放标题、图片相关信息
struct Course : Identifiable {
    var id = UUID()
    var title: String
    var image: String
    var color: Color
    var shadowColor: Color
}

//用Course数据结构创建一组新数据courseData
let courseData = [
    Course(
        title: "Build an app on SwiftUI",
        image: "Illustration1",
        color: Color("background3"),
        shadowColor: Color("backgroundShadow3")
    ),
    Course(
        title: "Design Courcse",
        image: "Illustration2",
        color: Color("background4"),
        shadowColor: Color("backgroundShadow4")
    )

//在HomeList视图中使用courseData数据
struct HomeList: View {
    @State var showContent = false
    var courses = courseData
    var body: some View {
        HStack(spacing: 30) {
            ForEach(courses) { item in
            CourceView(
                titile: item.title,
                image: item.image,
                color: item.color,
                shadowColor: item.shadowColor)
            }
        }
    }
}

```
## 创建可操作的数据（添加、删除）
ObservableObject @ObservedObject 相关概念
（明天继续）
## 导航列表NavigationView-NavigationLink通用组件
苹果提供NavigationView-NavigationLink框架让列表及列表相关操作变得简单
（明天继续）

## ForEach历询
* 在Xcode中按住`cmd`+指定View或元素，调出选择框，选择repeat，即可添加ForEach语法
![foreach](https://github.com/gaozichen2012/Swift-notes/blob/master/img/8-ForEach.jpg)

## 设置图片步骤
```
Image(item.image)
    .resizable() //让图像尺寸可调 
    .aspectRatio(contentMode: .fit) //将图片设置为填充
    .frame(width: 80 ,height: 80) //设置图片框架大小
    .background(Color("background")) //设置图片背景
    .cornerRadius(20) //设置圆角
```
## Button-sheet组合，实现点击按钮跳出指定View
```
@State var show = false

Button(action: { self.show.toggle() }){
    //此处为按钮显示的内容或界面
    }
    .sheet(isPresented: self.$show) { ContentView() } //ContentView为要跳出来的目标视图
```
![Button-sheet实例1](https://github.com/gaozichen2012/Swift-notes/blob/master/img/7-Button-sheet1.jpg)

