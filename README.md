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

### 元组类型（等同于C的结构体）

## Playground工具介绍
![Xcode截图](https://github.com/gaozichen2012/Swift-notes/blob/master/img/1-Xcode%E6%88%AA%E5%9B%BE.jpg)
Playground是Xcode的一个简单的测试环境，主要是用于快速测试Swift语法功能和验证API功能，并不是用来进行实际开发应用。如果开发者对Swift语法功能不太确定，则可以用Playground来测试代码，其次Playground也可以用来验证某个函数，类的功能。