
# 下面学习2.6继承
https://www.php.cn/code/17074.html

# Swift语法笔记
* 在for-in结构中的循环变量不需要使用var声明，无需定义即可使用，swift会自动推断类型；如果循环内没用到该循环变量直接使用下划线代替`_`，如`for _ in 1...10 {...}`
* Swift的Switch语句不需要写break，因为swift默认case自带break退出
* Swift源文件的第一行可执行的代码就是Swift的程序的入口
* Swift把每行代码作为了一个语句，无须任何符号作为结束。但是如果2句代码写在同一行需要以`;`分隔。
* Swift要求所有的变量和常量必须先声明后使用，声明变量需要使用var，声明常量则需要使用let；形如：var 变量名[:类型] =初始值
* Swift 用字符串print打印，使用`\()`的方式打印变量，如`tom=88，print("the value=\(tom)")`，输出值为`the value=88`
* 变量申明尽可能使用Int，可以提高代码复用性，不同数据类型转换使用`Int(tom)`，和C类似
* 编译：新建源程序hello.swift，在终端使用`swiftc -o hello.out hello.swift`生成hello.out，执行`./hello.out`
* 只有可选类型的变量和常量才能接收nil，非可选类型的变量和常量不能接收nil。
* 使用if和switch没有括号，比如`if a==true`

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

## 可选类型（optional）
任何数据类型跟?就是可选类型，比如`var num1:Int? = 3`，可选类型的变量可用于处理“值缺失”
* 一个变量定义为可选类型以后，再使用数据值时必须用感叹号!解包，
```
var str = "tom"
var num :Int = str.toInt()//会报错
var num1: Int? = str.toInt()//正确的代码
```
上面代码第二行会报错，因为字符串"tom"无法转换为Int类型，转换失败，此时就会出现值缺失
第三行num1是可选类型，出现值缺失，num1会储存转换结果nil，nil表示值缺失
### 强制解包
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
### 自动解包（隐式解包）
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
## 字符串
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
### 关于字符串的常用函数
1. isEmpty 判断字符串是否为空
2. hasPrefix()
3. hasSuffix()
4. count() 判断字符串的字符数
5. 


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
* 每个函数参数都有一个参数标签（argument label）以及一个参数名称（parameter name）
* 默认情况下，函数参数使用参数名称来作为它们的参数标签。
* 如果一个参数有一个标签，那么在调用的时候必须使用标签来标记这个参数。
* 如果你不希望为某个参数添加一个标签，可以使用一个下划线（_）来代替一个明确的参数标签。
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
* 闭包是引用类型
* 闭包是没有名字的函数
* 函数实际上是一种特殊的闭包；全局函数是一个有名字但是不会捕获任何值的闭包；嵌套函数是一个有名字并可以捕获其封闭函数域内值的闭包
* 涉及到函数作为参数的那些方法时,使用闭包很有用
* 函数定义和闭包定义的区别是：闭包省略了函数定义中的func，并用{}包含定义的所有内容，然后用in区分函数和函数内部定义的内容
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
1. 利用上下文推断参数和返回值类型（利用上下文可以省略参数和返回值的定义）
2. 隐式返回单表达式闭包，即单表达式闭包可以省略 return 关键字（函数内只有一行语句则可以省略return）
3. 参数名称缩写
4. 尾随闭包语法（当闭包语句过长，把整个闭包拿出来，放在调用函数func()的外面，形如func(){...}）
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

## 枚举
### 枚举语法
使用 enum 关键词来创建枚举并且把它们的整个定义放在一对大括号内：
```
enum SomeEnumeration {
    // 枚举定义放在这里
}
```
下面是用枚举表示指南针四个方向的例子：
```
enum CompassPoint {
    case north
    case south
    case east
    case west
}
```
枚举中定义的值（如 north，south，east 和 west）是这个枚举的成员值（或成员）。你可以使用 case 关键字来定义一个新的枚举成员值。
>与 C 和 Objective-C 不同，Swift 的枚举成员在被创建时不会被赋予一个默认的整型值。在上面的 CompassPoint 例子中，north，south，east 和 west 不会被隐式地赋值为 0，1，2 和 3。相反，这些枚举成员本身就是完备的值，这些值的类型是已经明确定义好的 CompassPoint 类型。
多个成员值可以出现在同一行上，用逗号隔开：
```
enum Planet {
    case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
}
```
每个枚举定义了一个全新的类型。像 Swift 中其他类型一样，它们的名字（例如 CompassPoint 和 Planet）以一个大写字母开头。
```
var directionToHead = CompassPoint.west
```
directionToHead 的类型可以在它被 CompassPoint 的某个值初始化时推断出来。一旦 directionToHead 被声明为 CompassPoint 类型，你可以使用更简短的点语法将其设置为另一个 CompassPoint 的值：
```
directionToHead = .east
```
当 directionToHead 的类型已知时，再次为其赋值可以省略枚举类型名。在使用具有显式类型的枚举值时，这种写法让代码具有更好的可读性。
### 使用 Switch 语句匹配枚举值
使用 switch 语句匹配单个枚举值：
```
directionToHead = .south
switch directionToHead {
case .north:
    print("Lots of planets have a north")
case .south:
    print("Watch out for penguins")
case .east:
    print("Where the sun rises")
case .west:
    print("Where the skies are blue")
}
// 打印“Watch out for penguins”
```
正如在 控制流 中介绍的那样，在判断一个枚举类型的值时，switch 语句必须穷举所有情况。如果忽略了 .west 这种情况，上面那段代码将无法通过编译，因为它没有考虑到 CompassPoint 的全部成员。强制穷举确保了枚举成员不会被意外遗漏。
当不需要匹配每个枚举成员的时候，你可以提供一个 default 分支来涵盖所有未明确处理的枚举成员：（和C一样）
```
let somePlanet = Planet.earth
switch somePlanet {
case .earth:
    print("Mostly harmless")
default:
    print("Not a safe place for humans")
}
// 打印“Mostly harmless”
```
### 枚举成员的遍历
令枚举遵循 CaseIterable 协议。Swift 会生成一个 allCases 属性，用于表示一个包含枚举所有成员的集合。下面是一个例子：
```
/* 通过 Beverage.allCases 可以访问到包含 Beverage 枚举所有成员的集合 */
enum Beverage: CaseIterable {
    case coffee, tea, juice
}
let numberOfChoices = Beverage.allCases.count
print("\(numberOfChoices) beverages available")
// 打印“3 beverages available”
```
allCases 的使用方法和其它一般集合一样——集合中的元素是枚举类型的实例，所以在上面的情况中，这些元素是 Beverage 值。在前面的例子中，统计了总共有多少个枚举成员。而在下面的例子中，则使用 for 循环来遍历所有枚举成员
```
for beverage in Beverage.allCases {
    print(beverage)
}
// coffee
// tea
// juice
```
### 关联值
Swift 枚举可以用来存储任意类型的关联值
声明存储不同类型关联值的枚举成员(这个定义不提供任何Int或String类型的关联值)
```
//一个成员值是(Int，Int，Int)类型关联值的num
//一个成员值是(String,String)类型关联值的str
enum Code{
    case num(Int,Int,Int)
    case str(String,String)
}

//创建了一个名为 code 的变量，并将 Code.num 赋值给它，关联的元组值为 (2, 3, 3)
var code = Code.num(2, 3, 3)

//code被重新赋值为.str以后，原始的 Code.num 和其整数关联值被新的 Code.str 和其字符串关联值所替代
code =  .str("A", "B")
```
Code 类型的常量和变量可以存储一个 .num 或者一个 .str（连同它们的关联值），但是在同一时间只能存储这两个值中的一个。

使用switch语句检查不同类型
```
switch code {
case .num(let num1, let num2, let num3):
    print("\(num1),\(num2),\(num3)")
case .str(let str1, let str2):
    print("\(str1),\(str2)")
}

//如果枚举的所有关联值都被提取为常量或者变量，则可以在前面放置单个var或let注释，以简洁起见
switch code {
case let .num(num1,num2,num3):
    print("\(num1),\(num2),\(num3)")
case let .str(str1,str2):
    print("\(str1),\(str2)")
}
```
### 原始值
枚举成员可以设置原始值，这些原始值的类型必须相同
```
enum Season:String {
    case spring = "A"
    case summer = "B"
    case autumn = "C"
    case winter = "D"
}
```
>原始值和关联值是不同的。原始值是在定义枚举时被预先填充的值。对于一个特定的枚举成员，它的原始值始终不变。关联值是创建一个基于枚举成员的常量或变量时才设置的值，枚举成员的关联值可以变化。
#### 原始值的隐式赋值
当使用整数作为枚举成员的原始值时，隐式赋值的值依次递增1
```
enum Season:Int {
    case spring = 1
    case summer
    case autumn
    case winter
}
```
当使用字符串作为枚举类型的原始值时，每个枚举成员的隐式原始值为该枚举成员的名称
```
enum Season:String {
    case spring 
    case summer
    case autumn
    case winter
}
```
使用枚举成员的rawValue属性可以访问该枚举成员的原始值
```
print(Season.spring.rawValue)
//"spring"
```
#### 使用原始值初始化枚举实例
可以通过rawValue初始化一个枚举成员，返回值则是枚举成员或nil，可以通过这个来判断这个新枚举成员是否在枚举值中
```
enum Season:Int {
    case spring
    case summer
    case autumn
    case winter
}
if let season = Season(rawValue: 5){
    switch season{
    case .spring:
        print("spring")
    case .summer:
        print("summer")
    case .autumn:
        print("autumn")
    case .winter:
        print("winter")
    }
}else{
    print("rawValue: 5 not in season!")
}
```
这个例子使用了可选绑定（optional binding），试图通过原始值 5 来访问Season。if let season = Season(rawValue: 5)语句创建了一个可选 Season，如果可选 Season 的值存在，就会赋值给 season。在这个例子中，无法检索到位置为 5的季节，所以 else 分支被执行。
### 递归枚举
* 递归枚举是一种枚举类型，它有一个或多个枚举成员使用该枚举类型的实例作为关联值。
* 在枚举成员前加上indirect来表示该成员可递归

下面的例子中，枚举类型存储了简单的算术表达式：
```
enum ArithmeticExpression {
    case number(Int)
    indirect case addition(ArithmeticExpression, ArithmeticExpression)
    indirect case multiplication(ArithmeticExpression, ArithmeticExpression)
}
```
也可以在枚举类型开头加上 indirect 关键字来表明它的所有成员都是可递归的：
```
indirect enum ArithmeticExpression {
    case number(Int)
    case addition(ArithmeticExpression, ArithmeticExpression)
    case multiplication(ArithmeticExpression, ArithmeticExpression)
}
```
上面定义的枚举类型可以存储三种算术表达式：纯数字、两个表达式相加、两个表达式相乘。枚举成员 addition 和 multiplication 的关联值也是算术表达式——这些关联值使得嵌套表达式成为可能。

例如，表达式 (5 + 4) * 2，乘号右边是一个数字，左边则是另一个表达式。因为数据是嵌套的，因而用来存储数据的枚举类型也需要支持这种嵌套——这意味着枚举类型需要支持递归。下面的代码展示了使用 ArithmeticExpression 这个递归枚举创建表达式 (5 + 4) * 2
```
let five = ArithmeticExpression.number(5)
let four = ArithmeticExpression.number(4)
let sum = ArithmeticExpression.addition(five, four)
let product = ArithmeticExpression.multiplication(sum, ArithmeticExpression.number(2))
```
要操作具有递归性质的数据结构，使用递归函数是一种直截了当的方式。例如，下面是一个对算术表达式求值的函数：
```
func evaluate(_ expression: ArithmeticExpression) -> Int {
    switch expression {
    case let .number(value):
        return value
    case let .addition(left, right):
        return evaluate(left) + evaluate(right)
    case let .multiplication(left, right):
        return evaluate(left) * evaluate(right)
    }
}

print(evaluate(product))
// 打印“18”
```
该函数如果遇到纯数字，就直接返回该数字的值。如果遇到的是加法或乘法运算，则分别计算左边表达式和右边表达式的值，然后相加或相乘。
## 结构体和类 Structures and Classes
* 与其他编程语言所不同的是，Swift 不要求你为自定义的结构体和类的接口与实现代码分别创建文件。你只需在单一的文件中定义一个结构体或者类，系统将会自动生成面向其它代码的外部接口。
* 一个类可以没有父类（super class）
* 结构体的实例为结构体实例，类的实例被称为对象
* 类class在定义的时候可以直接在类中声明函数func

### 结构体和类对比
* 定义属性用于存储值
* 定义方法用于提供功能
* 定义下标操作用于通过下标语法访问它们的值
* 定义构造器用于设置初始值
* 通过扩展以增加默认实现之外的功能
* 遵循协议以提供某种标准功能
与结构体相比，类还有如下的附加功能：
* 继承允许一个类继承另一个类的特征
* 类型转换允许在运行时检查和解释一个类实例的类型
* 析构器允许一个类实例释放任何其所被分配的资源
* 引用计数允许对一个类的多次引用
>类支持的附加功能是以增加复杂性为代价的。作为一般准则，优先使用结构体，因为它们更容易理解，仅在适当或必要时才使用类。实际上，这意味着你的大多数自定义数据类型都会是结构体和枚举。
### 结构体和类的命名
定义一个新的结构体或者类时，都是定义了一个新的`Swift`类型。和`String`，`Int`和`Bool`一样要符合标准`Swift`类型的大写命名风格，如`SomeStructure`,`SomeClass`;属性和方法命名使用首字母小写风格，以便与类型名区分，如`frameRate`和`incrementCount`（结构体里的成员也是属性）
### 类型定义的语法
以下是定义结构体和定义类的示例：
```
struct Resolution {
    var width = 0
    var height = 0
}
class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}
```
在上面的示例中定义了一个名为 Resolution 的结构体，用来描述基于像素的分辨率。
还定义了一个名为 VideoMode 的类，用来描述视频显示器的某个特定视频模式。这个类包含了四个可变的存储属性。分别是：
1. `resolution`被初始化为一个新的`Resolution`结构体的实例，属性类型被推断为`Resolution`。
2. 初始值为 false 的 interlaced（意为“非隔行视频”）
3. 初始值为 0.0 的 frameRate
4. 值为可选 String 的 name。因为 name 是一个可选类型，它会被自动赋予一个默认值 nil，意为“没有 name 值”。

Resolution 结构体和 VideoMode 类的定义仅描述了什么是 Resolution 和 VideoMode。它们并没有描述一个特定的分辨率（resolution）或者视频模式（video mode）。为此，你需要创建结构体或者类的一个实例。
```
let someResolution = Resolution()
let someVideoMode = VideoMode()
```
结构体和类都使用构造器语法来创建新的实例。
构造器语法的最简单形式是在结构体或者类的类型名称后跟随一对空括号，如 Resolution() 或 VideoMode()。通过这种方式所创建的类或者结构体实例，其属性均会被初始化为默认值。
### 属性访问
通过`.`访问，如`someResolution.width`,`someVideoMode.resolution.width`
### 结构体类型的成员逐一构造器
所有结构体都有一个自动生成的成员逐一构造器，用于初始化新结构体实例中成员的属性。新实例中各个属性的初始值可以通过属性的名称传递到成员逐一构造器之中：
```
let vga = Resolution(width: 640, height: 480)
```
与结构体不同，类实例没有默认的成员逐一构造器。
### 结构体和枚举是值类型
* 值类型是这样一种类型，当它被赋值给一个变量、常量或者被传递给一个函数的时候，其值会被拷贝。如Bool,Int,String,array,dictionary都是值类型，其底层也是使用结构体实现的。
* Swift 中所有的结构体和枚举类型都是值类型。
* 值类型表示在数据传递时，只发生数据拷贝，拷贝者与拷贝者没有关系
### 类是引用类型
* 引用类型在被赋予到一个变量、常量或者被传递到一个函数时，其值不会被拷贝。因此，使用的是已存在实例的引用，而不是其拷贝。
* 引用类型类似与c语言中直接调用指针，使用的是同一个内存区域

见下面实例：
```
//声明了一个名为 tenEighty 的常量，并让其引用一个VideoMode类的新实例。并给tenEighty赋值
let tenEighty = VideoMode()
tenEighty.resolution = hd
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0


//将tenEighty赋值给一个名为alsoTenEighty的新常量，并修改 alsoTenEighty 的帧率
let alsoTenEighty = tenEighty
alsoTenEighty.frameRate = 30.0

print(tenEighty.frameRate)
// 打印 "30.0"
```
因为类是引用类型，所以 tenEighty 和 alsoTenEighty 实际上引用的是同一个 VideoMode 实例。

>tenEighty 和 alsoTenEighty 被声明为常量。然而你依然可以改变 tenEighty.frameRate 和 alsoTenEighty.frameRate，这是因为 tenEighty 和 alsoTenEighty 这两个常量的值并未改变。它们并不“存储”这个 VideoMode 实例，而仅仅是对 VideoMode 实例的引用。所以，改变的是底层 VideoMode 实例的 frameRate 属性，而不是指向 VideoMode 的常量引用的值。

### 恒等运算符
因为类是引用类型，所以多个常量和变量可能在幕后同时引用同一个类实例。判定两个常量或者变量是否引用同一个类实例有时很有用。为了达到这个目的，Swift 提供了两个恒等运算符：相同`===`和不相同`！==`，使用这两个运算符检测两个常量或者变量是否引用了同一个实例
```
if tenEighty === alsoTenEighty {
    print("tenEighty and alsoTenEighty refer to the same VideoMode instance.")
}
// 打印 "tenEighty and alsoTenEighty refer to the same VideoMode instance."
```
### 指针
* Swift 中引用了某个引用类型实例的常量或变量，与 C 语言中的指针类似，不过它并不直接指向某个内存地址，也不要求你使用星号（*）来表明你在创建一个引用
* Swift 中引用的定义方式与其它的常量或变量的一样。如果需要直接与指针交互，你可以使用标准库提供的指针和缓冲区类型

## 属性
* 属性将值与特定的类、结构体或枚举关联。
* 存储属性会将常量和变量存储为实例的一部分，而计算属性则是直接计算（而不是存储）值。
* 计算属性可以用于类、结构体和枚举，而存储属性只能用于类和结构体。
* 存储属性和计算属性通常与特定类型的实例关联。但是，属性也可以直接与类型本身关联，这种属性称为类型属性。
* 还可以定义属性观察器来监控属性值的变化，以此来触发自定义的操作。属性观察器可以添加到类本身定义的存储属性上，也可以添加到从父类继承的属性上。
* 也可以利用属性包装器来复用多个属性的 getter 和 setter 中的代码
### 存储属性
一个存储属性就是存储在特定类或结构体实例里的一个常量或变量
```
struct FixedLengthRange {
    var firstValue: Int
    let length: Int
}
var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)
// 该区间表示整数 0，1，2
rangeOfThreeItems.firstValue = 6
// 该区间现在表示整数 6，7，8
```
`FixedLengthRange`的实例包含一个名为`firstValue`的变量存储属性和一个名为`length`的常量存储属性。
#### 常量结构体实例的存储属性
如果创建了一个结构体实例并将其赋值给一个常量，则无法修改该实例的任何属性，即使被声明为可变属性也不行:
```
let rangeOfFourItems = FixedLengthRange(firstValue: 0, length: 4)
// 该区间表示整数 0，1，2，3
rangeOfFourItems.firstValue = 6
// 尽管 firstValue 是个可变属性，但这里还是会报错
```
>当值类型的实例被声明为常量的时候，它的所有属性也就成了常量。引用类型的类则不一样。把一个引用类型的实例赋给一个常量后，依然可以修改该实例的可变属性。
#### 延时加载存储属性
>必须将延时加载属性声明成变量（使用 var 关键字）

延时加载存储属性是指当第一次被调用的时候才会计算其初始值的属性。在属性声明前使用 lazy 来标示一个延时加载存储属性。

延时加载属性的应用场合：
1. 当属性的值依赖于一些外部因素且这些外部因素只有在构造过程结束之后才会知道的时候
2. 当获得属性的值因为需要复杂或者大量的计算，而采用需要的时候再计算的方式

下面的例子使用了延时加载存储属性来避免复杂类中不必要的初始化工作。例子中定义了 DataImporter 和 DataManager 两个类，下面是部分代码：
```
class DataImporter {
    /*
    DataImporter 是一个负责将外部文件中的数据导入的类。
    这个类的初始化会消耗不少时间。
    */
    var fileName = "data.txt"
    // 这里会提供数据导入功能
}

class DataManager {
    lazy var importer = DataImporter()
    var data = [String]()
    // 这里会提供数据管理功能
}

let manager = DataManager()
manager.data.append("Some data")
manager.data.append("Some more data")
// DataImporter 实例的 importer 属性还没有被创建
```
DataManager 类包含一个名为 data 的存储属性，初始值是一个空的字符串数组。这里没有给出全部代码，只需知道 DataManager 类的目的是管理和提供对这个字符串数组的访问即可。

由于使用了 lazy，DataImporter 的实例 importer 属性只有在第一次被访问的时候才被创建。
#### 存储属性和实例变量
Swift中的属性没有对应的实例变量，属性的备份存储也无法直接访问。这避免了不同场景下访问方式的困扰，同时也将属性的定义简化成一个语句。属性的全部信息——包括命名、类型和内存管理特征——作为类型定义的一部分，都定义在一个地方。
### 计算属性
* 除存储属性外，类、结构体和枚举可以定义计算属性。
* 计算属性不直接存储值，而是提供一个 getter 和一个可选的 setter，来间接获取和设置其他属性或变量的值。
```
struct Point {
    var x = 0.0, y = 0.0
}
struct Size {
    var width = 0.0, height = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        set(newCenter) {
            origin.x = newCenter.x - (size.width / 2)
            origin.y = newCenter.y - (size.height / 2)
        }
    }
}

//创建了一个名为 square 的 Rect 实例，初始值原点是 (0, 0)，宽度高度都是 10
var square = Rect(origin: Point(x: 0.0, y: 0.0),size: Size(width: 10.0, height: 10.0))

//创建了initialSquareCenter等于square.center，此时调用了center计算属性的getter获取他的值
let initialSquareCenter = square.center

//center属性被设置了一个新的值 (15, 15)，此时调用了center计算属性的setter来修改属性 origin 的 x 和 y 的值
square.center = Point(x: 15.0, y: 15.0)
print("square.origin is now at (\(square.origin.x), \(square.origin.y))")
// 打印“square.origin is now at (10.0, 10.0)”
```
上面的例子定义了三个结构体描述几何形状`Point`封装了起点坐标，`Size`封装了长宽信息，`Rect`表示一个有原点尺寸和中心点的矩形；
`Rect`提供了`center`的计算属性，一个`Rect`的中心点可以从`origin`（原点）和 `size`（大小）算出，所以不需要将中心点以`Point`类型的值来保存。
`Rect`的计算属性`center`提供了自定义的`getter`和`setter`来获取和设置矩形的中心点，就像它有一个存储属性一样。
#### 简化Setter声明
如果计算属性的 setter 没有定义表示新值的参数名，则可以使用默认名称 newValue。下面是使用了简化 setter 声明的 Rect 结构体代码：
```
struct AlternativeRect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        set {
            origin.x = newValue.x - (size.width / 2)
            origin.y = newValue.y - (size.height / 2)
        }
    }
}
```
#### 简化 Getter 声明
如果整个 getter 是单一表达式，getter 会隐式地返回这个表达式结果。
```
struct CompactRect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            Point(x: origin.x + (size.width / 2),
                  y: origin.y + (size.height / 2))
        }
        set {
            origin.x = newValue.x - (size.width / 2)
            origin.y = newValue.y - (size.height / 2)
        }
    }
}
```
#### 只读计算属性
>必须使用 var 关键字定义计算属性，包括只读计算属性，因为它们的值不是固定的。let 关键字只用来声明常量属性，表示初始化后再也无法修改的值。

只有 getter 没有 setter 的计算属性叫只读计算属性。只读计算属性总是返回一个值，可以通过点运算符访问，但不能设置新的值。

只读计算属性的声明可以去掉 get 关键字和花括号：
```
//定义一个三维空间的立方体，并计算体积
struct Cuboid {
    var width = 0.0, height = 0.0, depth = 0.0
    var volume: Double {
        return width * height * depth
    }
}
let fourByFiveByTwo = Cuboid(width: 4.0, height: 5.0, depth: 2.0)
print("the volume of fourByFiveByTwo is \(fourByFiveByTwo.volume)")
// 打印“the volume of fourByFiveByTwo is 40.0”
```

### 类型属性
Swift可以为类添加类型属性，即在class中定义一个class
* 类型属性本质上属于计算属性
```
class Human {
    //定义类型属性时，必须使用计算属性，不能使用储存属性
    class var planet: String {
        return "earth"
    }
}

//下面是使用储存属性定义的错误例子
class Human {
    class var planet: String = "earth"
}
```


### 属性观察器
* 属性观察器监控和响应属性值的变化，每次属性被设置值的时候都会调用属性观察器，即使新值和当前值相同的时候也不例外。
* 可以为除了延时加载存储属性之外的其他存储属性添加属性观察器
* 可以在子类中通过重写属性的方式为继承的属性（包括存储属性和计算属性）添加属性观察器
* 不必为非重写的计算属性添加属性观察器，因为你可以直接通过它的 setter 监控和响应值的变化。

为属性添加其中一个或两个观察器：
* willSet 在新的值被设置之前调用
* didSet 在新的值被设置之后调用
willSet 观察器会将新的属性值作为常量参数传入，在 willSet 的实现代码中可以为这个参数指定一个名称，如果不指定则参数仍然可用，这时使用默认名称 newValue 表示。
同样，didSet 观察器会将旧的属性值作为参数传入，可以为该参数指定一个名称或者使用默认参数名 oldValue。如果在 didSet 方法中再次对该属性赋值，那么新值会覆盖旧的值。

下面是一个 willSet 和 didSet 实际运用的例子，其中定义了一个名为 StepCounter 的类，用来统计一个人步行时的总步数。这个类可以跟计步器或其他日常锻炼的统计装置的输入数据配合使用。
```
class StepCounter {
    var totalSteps: Int = 0 {
        willSet(newTotalSteps) {
            print("将 totalSteps 的值设置为 \(newTotalSteps)")
        }
        didSet {
            if totalSteps > oldValue  {
                print("增加了 \(totalSteps - oldValue) 步")
            }
        }
    }
}
let stepCounter = StepCounter()
stepCounter.totalSteps = 200
// 将 totalSteps 的值设置为 200
// 增加了 200 步
stepCounter.totalSteps = 360
// 将 totalSteps 的值设置为 360
// 增加了 160 步
stepCounter.totalSteps = 896
// 将 totalSteps 的值设置为 896
// 增加了 536 步
```
`StepCounter`类定义了一个叫`totalSteps`的Int类型的属性。它是一个存储属性，包含`willSet`和`didSet`观察器。
当 totalSteps 被设置新值的时候，它的 willSet 和 didSet 观察器都会被调用;
例子中的 willSet 观察器将表示新值的参数自定义为 newTotalSteps，这个观察器只是简单的将新的值输出。
didSet 观察器在 totalSteps 的值改变后被调用，它把新值和旧值进行对比，如果总步数增加了，就输出一个消息表示增加了多少步。didSet 没有为旧值提供自定义名称，所以默认值 oldValue 表示旧值的参数名。
### 属性包装器
* 属性包装器在管理属性如何存储和定义属性的代码之间添加了一个分隔层
* 属性包装器的作用时为了让传入的数据满足特定需求

定义一个属性包装器，你需要创建一个定义 wrappedValue 属性的结构体、枚举或者类。在下面的代码中，TwelveOrLess 结构体确保它包装的值始终是小于等于 12 的数字。如果要求它存储一个更大的数字，它则会存储 12 这个数字。
```
@propertyWrapper
struct TwelveOrLess {
    private var number = 0
    var wrappedValue: Int {
        get { return number }
        set { number = min(newValue, 12) }
    }
}
```
>以 private 的方式声明 number 变量，这使得 number 仅在 TwelveOrLess 的实现中使用。写在其他地方的代码通过使用 wrappedValue 的 getter 和 setter 来获取这个值，但不能直接使用 number。

通过在属性之前写上包装器名称作为特性的方式，你可以把一个包装器应用到一个属性上去。这里有个存储小矩形的结构体。通过 TwelveOrLess 属性包装器实现类似（挺随意的）对“小”的定义。
```
struct SmallRectangle {
    @TwelveOrLess var height: Int
    @TwelveOrLess var width: Int
}

var rectangle = SmallRectangle()
print(rectangle.height)
// 打印 "0"

rectangle.height = 10
print(rectangle.height)
// 打印 "10"

//尝试存储 24 的操作实际上存储的值为 12，这是因为对于这个属性的 setter 的规则来说，24 太大了。
rectangle.height = 24
print(rectangle.height)
// 打印 "12"
```
当你把一个包装器应用到一个属性上时，编译器将合成提供包装器存储空间和通过包装器访问属性的代码。（属性包装器只负责存储被包装值，所以没有合成这些代码。）
（待整理）
#### 设置被包装属性的初始值（待整理）
#### 从属性包装器中呈现一个值（待整理）
### 全局变量和局部变量
* 计算属性和观察属性所描述的功能也可以用于全局变量和局部变量。
* 全局变量是在函数、方法、闭包或任何类型之外定义的变量。
* 局部变量是在函数、方法或闭包内部定义的变量。
* 前面章节提到的全局或局部变量都属于存储型变量，跟存储属性类似，它为特定类型的值提供存储空间，并允许读取和写入。
* 另外，在全局或局部范围都可以定义计算型变量和为存储型变量定义观察器。计算型变量跟计算属性一样，返回一个计算结果而不是存储值，声明格式也完全一样。
### 类型属性（待整理）
实例属性属于一个特定类型的实例，每创建一个实例，实例都拥有属于自己的一套属性值，实例之间的属性相互独立。
#### 类型属性语法（待整理）
#### 获取和设置类型属性的值（待整理）

## 方法
方法包括实例方法、类型方法、下标方法
* 方法是函数（在类class内部定义的函数被称为方法）。
* 类、结构体、枚举都可以定义实例方法；
* 实例方法为给定类型的实例封装了具体的任务与功能。
* 类、结构体、枚举也可以定义类型方法；
* 类型方法与类型本身相关联。
* 结构体和枚举能够定义方法是 Swift 与 C/Objective-C 的主要区别之一。
* 在 Objective-C 中，类是唯一能定义方法的类型。但在 Swift 中，你不仅能选择是否要定义一个类/结构体/枚举，还能灵活地在你创建的类型（类/结构体/枚举）上定义方法。

### 实例方法（Instance Methods）
* 实例方法是属于某个特定类、结构体或者枚举类型实例的方法。
* 实例方法提供访问和修改实例属性的方法或提供与实例目的相关的功能，并以此来支撑实例的功能。
* 实例方法的语法与函数完全一致
* 实例方法要写在它所属的类型的前后大括号之间。
* 实例方法能够隐式访问它所属类型的所有的其他实例方法和属性。
* 实例方法只能被它所属的类的某个特定实例调用。
* 实例方法不能脱离于现存的实例而被调用。

下面的例子，定义一个很简单的 Counter 类，Counter 能被用来对一个动作发生的次数进行计数：
```
class Counter {
    var count = 0
    func increment() {
        count += 1
    }
    func increment(by amount: Int) {
        count += amount
    }
    func reset() {
        count = 0
    }
}
```
Counter 类定义了三个实例方法：
* increment 让计数器按一递增；
* increment(by: Int) 让计数器按一个指定的整数值递增；
* reset 将计数器重置为0。
Counter 这个类还声明了一个可变属性 count，用它来保持对当前计数器值的追踪。

和调用属性一样，用`.`调用实例方法：
```
let counter = Counter()
// 初始计数值是0
counter.increment()
// 计数值现在是1
counter.increment(by: 5)
// 计数值现在是6
counter.reset()
// 计数值现在是0
```
#### self 属性
* 类型的每一个实例都有一个隐含属性叫做 self，self 完全等同于该实例本身。
* 你可以在一个实例的实例方法中使用这个隐含的 self 属性来引用当前实例。

上面例子中的 increment 方法还可以这样写：
```
func increment() {
    self.count += 1
}
```
实际上，你不必在你的代码里面经常写 self。不论何时，只要在一个方法中使用一个已知的属性或者方法名称，如果你没有明确地写 self，Swift 假定你是指当前实例的属性或者方法。这种假定在上面的 Counter 中已经示范了：Counter 中的三个实例方法中都使用的是 count（而不是 self.count）。
##### 使用self的场景
使用这条规则的主要场景是实例方法的某个参数名称与实例的某个属性名称相同的时候。在这种情况下，参数名称享有优先权，并且在引用属性时必须使用一种更严格的方式。这时你可以使用 self 属性来区分参数名称和属性名称。

下面的例子中，self 消除方法参数 x 和实例属性 x 之间的歧义：
```
struct Point {
    var x = 0.0, y = 0.0
    func isToTheRightOf(x: Double) -> Bool {
        return self.x > x
    }
}
let somePoint = Point(x: 4.0, y: 5.0)
if somePoint.isToTheRightOf(x: 1.0) {
    print("This point is to the right of the line where x == 1.0")
}
// 打印“This point is to the right of the line where x == 1.0”
```
如果不使用 self 前缀，Swift会认为 x 的两个用法都引用了名为 x 的方法参数。
#### 在实例方法中修改值类型
结构体和枚举是值类型。默认情况下，值类型的属性不能在它的实例方法中被修改。
但是，如果你确实需要在某个特定的方法中修改结构体或者枚举的属性，你可以为这个方法选择 可变（mutating）行为，然后就可以从其方法内部改变它的属性；
(未用到暂不研究)

### 类型方法
* 实例方法是被某个类型的实例调用的方法。
* 定义在类型本身上调用的方法，这种方法就叫做类型方法。
* 在方法的 func 关键字之前加上关键字 static，来指定类型方法。类还可以用关键字 class 来指定，从而允许子类重写父类该方法的实现。
* 不能再类型方法内访问实例属性，但可以访问类型属性（不能访问class中var定义的实例属性，但可以访问class中class类型属性）

类型方法和实例方法一样用点语法调用。但是，你是在类型上调用这个方法，而不是在实例上调用。下面是如何在 SomeClass 类上调用类型方法的例子：
```
class SomeClass {
    class func someTypeMethod() {
        // 在这里实现类型方法
    }
}
SomeClass.someTypeMethod()
```
(没看懂待整理)

### 下标方法（Subsript）
下标方法仅用于实例。是实例方法的一种，其目的是简化元素的访问形式
```
class FriendsBook {
    var friendsArry : [Int:string] = [:]
    var name : String
    subscript(number:Int)->String? {
        get {
            return friendsArry[number]
        }
        set {
            friendArray[number] = newValue
        }
    }
}
var book = FriendsBook()
book.name ="Dancer"

//使用下标法传入数据或者访问数据
book[1] = "lili1"
book[2] = "lili2"

```


## 扩展
>扩展可以给一个类型添加新的功能，但是不能重写已经存在的功能。
* 扩展可以给一个现有的类，结构体，枚举，还有协议添加新的功能。
* 它还拥有不需要访问被扩展类型源代码就能完成扩展的能力（即逆向建模）

Swift 中的扩展可以：
* 添加计算型实例属性和计算型类属性
* 定义实例方法和类方法
* 提供新的构造器
* 定义下标
* 定义和使用新的嵌套类型
* 使已经存在的类型遵循（conform）一个协议
### 扩展的语法
使用 extension 关键字声明扩展：
```
extension SomeType {
  // 在这里给 SomeType 添加新的功能
}
```
扩展可以扩充一个现有的类型，给它添加一个或多个协议。协议名称的写法和类或者结构体一样：
```
extension SomeType: SomeProtocol, AnotherProtocol {
  // 协议所需要的实现写在这里
}
```
(暂时了解扩展的概念即可)

## protocol（协议）
* 协议可以要求遵循协议的类型提供特定名称和类型的实例属性或类型属性。
* 协议不指定属性是存储属性还是计算属性，它只指定属性的名称和类型。
* 协议还指定属性是可读的还是可读可写的。

协议的定义方式与类、结构体和枚举的定义非常相似
```
protocol SomeProtocol {
    // 这里是协议的定义部分
}
```
要让自定义类型遵循某个协议，在定义类型时，需要在类型名称后加上协议名称，中间以冒号（:）分隔。遵循多个协议时，各协议之间用逗号（,）分隔
```
struct SomeStructure: FirstProtocol, AnotherProtocol {
    // 这里是结构体的定义部分
}
```
若是一个类拥有父类，应该将父类名放在遵循的协议名之前，以逗号分隔：
```
class SomeClass: SomeSuperClass, FirstProtocol, AnotherProtocol {
    // 这里是类的定义部分
}
```
协议总是用 var 关键字来声明变量属性，在类型声明后加上 { set get } 来表示属性是可读可写的，可读属性则用 { get } 来表示
```
protocol SomeProtocol {
    var mustBeSettable: Int { get set }
    var doesNotNeedToBeSettable: Int { get }
}
```
在协议中定义类型属性时，总是使用 static 关键字作为前缀。当类类型遵循协议时，除了 static 关键字，还可以使用 class 关键字来声明类型属性：
```
protocol AnotherProtocol {
    static var someTypeProperty: Int { get set }
}
```
### 例子
下面是一个只含有一个实例属性要求的协议
```
protocol FullyNamed {
    var fullName: String { get }
}
```
FullyNamed 协议除了要求遵循协议的类型提供 fullName 属性外，并没有其他特别的要求。这个协议表示，任何遵循 FullyNamed 的类型，都必须有一个可读的 String 类型的实例属性 fullName 。
下面是一个遵循 FullyNamed 协议的简单结构体：
```
struct Person: FullyNamed {
    var fullName: String
}
let john = Person(fullName: "John Appleseed")
// john.fullName 为 "John Appleseed"
```
下面是一个更为复杂的类，它采纳并遵循了 FullyNamed 协议：(待研究CLASS)
```
class Starship: FullyNamed {
    var prefix: String?
    var name: String
    init(name: String, prefix: String? = nil) {
        self.name = name
        self.prefix = prefix
    }
    var fullName: String {
        return (prefix != nil ? prefix! + " " : "") + name
    }
}
var ncc1701 = Starship(name: "Enterprise", prefix: "USS")
// ncc1701.fullName 为 "USS Enterprise"
```
Starship 类把 fullName 作为只读的计算属性来实现。每一个 Starship 类的实例都有一个名为 name 的非可选属性和一个名为 prefix 的可选属性。 当 prefix 存在时，计算属性 fullName 会将 prefix 插入到 name 之前，从而得到一个带有 prefix 的 fullName。
（后续内容较多待研究）
