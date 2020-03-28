# 相关资源

- [Swift官网](https://swift.org/)
- [Xcode官方介绍（英文）](https://help.apple.com/xcode/mac/current/#/devc8c2a6be1)
- [Swift编程语言文档（英文，官方参考文档）](https://swift.org/documentation/#the-swift-programming-language)
- [Swift编程语言文档（中文，官方中文参考文档）](https://github.com/SwiftGGTeam/the-swift-programming-language-in-chinese)
- [Swift教程（不了解Swift语法概念可查阅此文档）](https://swiftgg.gitbook.io/swift/swift-jiao-cheng)
- [SwiftUI官网首页（英文原版）](https://developer.apple.com/documentation/swiftui/)
- [SwiftUI官方开发教程（英文原版）](https://developer.apple.com/tutorials/swiftui/creating-and-combining-views)
- [SwiftUI官方开发教程（中文）](https://github.com/WillieWangWei/SwiftUI-Tutorials)
- [哔哩视频1：用SwiftUI构建完整应用](https://www.bilibili.com/video/av64681507/)
- [哔哩视频2：从零开发苹果手机App](https://www.bilibili.com/video/av61957676/)
- [博客1：SwiftUI 的一些初步探索 (一)](https://onevcat.com/2019/06/swift-ui-firstlook/)

# 记忆点

- 按住option，点击鼠标左键即可查看该好函数或变量的简介定义
- swift的`import UIKit`相当于C语言中的`#include <UIKit.h>`
- Container Views容器视图包含`From`、`Group`、`GroupBox`、`Section`
- Divider()：分割线，在两个内容中间添加`Divider()`
- 每个函数参数都有一个参数标签label以及一个参数名称，默认情况下参数名称=参数标签。
- 如果函数参数有标签，在调用的时候必须使用标签。如果不希望为某个参数添加一个标签，可以使用一个下划线（_）来代替一个明确的参数标签。
- 定义一个结构体或类时，命名使用首字母大写风格，如`SomeStructure`,`SomeClass`;（和Bool/Int一样属于类型）
- 定义一个属性或方法命名使用首字母小写风格，以便与类型名区分，如`frameRate`和`incrementCount`；
- 任何数据类型跟?就是可选类型，比如`var num1:Int? = 3`，可选类型的变量可用于处理“值缺失”
- 结构体和枚举时值类型，在发生数据传递时只发生值拷贝
- 类class是引用类型，在发生数据传递时，共用同一个内存地址，class a改变，class b也会改变（类似于C语言中不同的指针指向同一个内存空间）
- 每一个实例都有一个隐含属性叫做 self，self 完全等同于该实例本身
- self的使用场景是实例方法的某个参数名与实例的某个属性名称相同时，用self来区分参数名称和属性名称
- 刷新 preview 的快捷键：Option + Command + P
- 预览没有显示，请选择 Editor > Canvas , 然后单击 Get Started 。
- background和foregroundColor对于.color和Color.color的使用没有区别

## 记忆点（已掌握）

- 重新编译command+b
- `ctrl+i` 自动格式化代码（先选中一段代码）
- `shift+command+L` 调出库Library
- 苹果基于Swift开发出的一套通用UI，SwiftUI 原生支持“动态字体”、“深色模式”、本地化和辅助功能
- SwiftUI在Xcode11中可以使用图形化界面拖拽，并实时在代码中更改
- SwiftUI支持所有苹果设备ios/pados/watch os
- Stack包括 `VStack`、`HStack`、`ZStack`。其中VStack将视图垂直排列；HStack将视图水平排列；ZStack将视图叠加排列
- Spacer()：是一个灵活的空间视图，它可以沿着包含堆栈布局的主轴进行扩展，从而实现不同尺寸屏幕自适应，在两个内容中间添加`Spacer()`
- padding()：填充，给目标一些填充空间，不至于贴边

# Swift简介

Swift，苹果于2014年WWDC（苹果开发者大会）发布的新开发语言，可与Objective-C共同运行于Mac OS和iOS平台，用于搭建基于苹果平台的应用程序。Swift吸收了众多现代编程语言的优点，尽力的提供简洁的编程语言和强大的功能。

# 使用模拟器或手机调试

- 使用模拟器调试点击RUN即可模拟器调试，见下图
- 使用手机调试，需要先将手机连写mac，在Xcode中选中手机设备，再点RUN

    ![http://image.tomtwos.com/tom-image/20200328/56Am7dxLfiz3.png?imageslim](http://image.tomtwos.com/tom-image/20200328/56Am7dxLfiz3.png?imageslim)

# 设置APP默认界面

在`SceneDelegate.swift`文件中修改`UIHostingController()`中的视图设置为进入app默认显示的界面

![http://image.tomtwos.com/tom-image/20200328/CSkQdK631qWj.png?imageslim](http://image.tomtwos.com/tom-image/20200328/CSkQdK631qWj.png?imageslim)

# List/Form/Group的区别

- Form仅用于Picker、toggle这一类数据输入的控件
- group仅在PreviewProvider预览多个视图时使用
- 其他的列表都用List（涉及添加或删除选项的也用List）

# ForEach历询

- 在Xcode中按住`cmd`+指定View或元素，调出选择框，选择repeat，即可添加ForEach语法

    ![http://image.tomtwos.com/tom-image/20200328/gH4ElWWmVaV6.png?imageslim](http://image.tomtwos.com/tom-image/20200328/gH4ElWWmVaV6.png?imageslim)

# swift package dependencies

https://www.cnblogs.com/feng9exe/p/10485087.html

Swift Package Manager（swift包管理器，简称：SPM）就是在swift开发中用来替代CocoaPod的；在swift开发中，SPM完全可以替代CocoaPod的功能，并且速度更快，体验更佳；

# Lottie-iOS

Airbnb开源的Lottie，可以让开发者免去写一行一行的代码而非常容易地渲染动画。你可以直接把 Adobe After Effects的动画用在你的Xcode 项目中。并且Android、macOS、React Native都可使用。

## 什么是Lottie呢？

Airbnb开源的Lottie，可以让开发者免去写一行一行的代码而非常容易地渲染动画。你可以直接把 Adobe After Effects的动画用在你的Xcode 项目中。并且Android、macOS、React Native都可使用。

什么是Lottie呢？ 由Airbnb开发的[Lottie](https://github.com/airbnb/lottie-ios)是一个将After Effects动画提供给任意一个iOS，macOS，Android还有React Native原生APP的文件库。这些动画通过一个叫[Bodymovin](https://github.com/bodymovin/bodymovin)的开源After Effects插件，以JSON文件的形式进行输出。Lottie通过JSON格式下载动画数据并实时提供给开发者。

Lottie现在不仅在GitHub上已经开源，而且还提供一个示例项目和一系列的示例动画

# CocoaPods

CocoaPods应该是iOS最常用最有名的类库管理工具了，通过CocoaPods工具我们可以为项目添加被称为“Pods”的依赖库（这些类库必须是CocoaPods本身所支持的），并且可以轻松管理其版本。（基本所有公司都在使用）

# 账号系统搭建

- 账号系统搭建的前提是有自己的服务器和数据库，这一块需要LNMP，所以先尝试发布不带账号系统的工具类APP，确定熟练SwiftUI以后，再开始搭建服务器：阿里云 + Linux + Nginx + MySQL + PHP
- [微信登陆API](https://developers.weixin.qq.com/doc/oplatform/Mobile_App/WeChat_Login/Development_Guide.html)
- [Sign In with Apple介绍](https://xiaozhuanlan.com/topic/8675913204)

# Playground工具介绍

![http://image.tomtwos.com/tom-image/20200328/CH6tmWJ0cXMu.png?imageslim](http://image.tomtwos.com/tom-image/20200328/CH6tmWJ0cXMu.png?imageslim)

Playground是Xcode的一个简单的测试环境，主要是用于快速测试Swift语法功能和验证API功能，并不是用来进行实际开发应用。如果开发者对Swift语法功能不太确定，则可以用Playground来测试代码，其次Playground也可以用来验证某个函数，类的功能。

# Mockplus

Mockplus（摹客）是一款简洁快速的原型图设计工具

# asset catalog（资源目录）

- asset catalog是 iOS app 开发必不可少的组成部分。我们一般将图片存放其中，但其用途远不止于此。

![http://image.tomtwos.com/tom-image/20200328/WFLWHFSlpTaS.png?imageslim](http://image.tomtwos.com/tom-image/20200328/WFLWHFSlpTaS.png?imageslim)

- asset catalog是 Xcode 提供的项目资源管理工具，其核心理念在于：以设备特征（traits）为单位配置资源，包括但不限于图片，颜色，材质，数据。既让开发者免于代码配置资源的烦恼，也让苹果能够更好的控制 .ipa 包。
- asset catalog 本质是一个文件目录。

# SF Symbols

> SF Symbols中的SF表示San Francisco，Symbols表示符号，SF Symbols对应的是San Francisco system font（苹果设计的一种系统字体应用于mac）

WWDC 2019苹果发布SF Symbols，SF Symbols是苹果发布的一套内置的图标库, 大概有 1500 个内置图标, 并且提供了相关的 API 让我们更方便的使用，这些内置图标不仅仅是简单的图片, 他们可以像文字一样, 支持放大缩小加粗操作

## 使用方法

在程序中直接使用

`Image(systemName: house)`

调用，其中

`house`

是从SF Symbols中获取到的icons的名字

![http://image.tomtwos.com/tom-image/20200328/bbxHPuFqiVhr.png?imageslim](http://image.tomtwos.com/tom-image/20200328/bbxHPuFqiVhr.png?imageslim)