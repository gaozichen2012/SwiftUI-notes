此文档为 tom 的个人学习 swiftUI 的笔记，希望对各位有帮助。

如遇到问题，请联系邮箱：gaozichen2012@outlook.com

欢迎关注个人博客：[tomtwos.com](http://tomtwos.com)

此笔记分 3 块

1. SwiftUI 及 Swift 学习资源及一些基础概念会记录在此文档`README.md`
2. 比较重要、内容较多的知识点会独立记录，列表会在`知识点列表`中列出
3. Swift 语法笔记记录在`swift-notes.md`

# 学习资源

- [Swift 官网](https://swift.org/)
- [Xcode 官方介绍（英文）](https://help.apple.com/xcode/mac/current/#/devc8c2a6be1)
- [Swift 编程语言文档（英文，官方参考文档）](https://swift.org/documentation/#the-swift-programming-language)
- [Swift 编程语言文档（中文，官方中文参考文档）](https://github.com/SwiftGGTeam/the-swift-programming-language-in-chinese)
- [Swift 教程（不了解 Swift 语法概念可查阅此文档）](https://swiftgg.gitbook.io/swift/swift-jiao-cheng)
- [SwiftUI 官网首页（英文原版）](https://developer.apple.com/documentation/swiftui/)
- [SwiftUI 官方开发教程（英文原版）](https://developer.apple.com/tutorials/swiftui/creating-and-combining-views)
- [SwiftUI 官方开发教程（中文）](https://github.com/WillieWangWei/SwiftUI-Tutorials)
- [哔哩视频 1：用 SwiftUI 构建完整应用](https://www.bilibili.com/video/av64681507/)
- [哔哩视频 2：从零开发苹果手机 App](https://www.bilibili.com/video/av61957676/)
- [博客 1：SwiftUI 的一些初步探索 (一)](https://onevcat.com/2019/06/swift-ui-firstlook/)

# 知识点列表

[设置图片步骤](https://www.notion.so/e10e39e6de474578bdc0013bfe6f5688)

[Settings 列表小控件](https://www.notion.so/Settings-e03c415c084543059009d0db2ee3fe70)

[TabBar（底部栏）](https://www.notion.so/TabBar-1c40fb0da60d4ccd85c8edfd70ffc132)

[导航列表 NavigationView-NavigationLink 通用组件](https://www.notion.so/NavigationView-NavigationLink-97a2f306c6b9430db4a0dd6dff8fdb18)

[滚动视图 ScrollView](https://www.notion.so/ScrollView-bd3f44975dec4bfdb4f8304f1fb38bba)

[Property Wrappers（属性包装器）](https://www.notion.so/Property-Wrappers-1b6347c19f354ced8abc2002d3f60ccc)

[创建和使用结构体](https://www.notion.so/bd8996977c0b4e5399270aff7ed89d59)

[Xcode 添加不同的预览视角](https://www.notion.so/Xcode-db3c9d2005ad462a82a51890202f9d2c)

[点击 Button 触发 4 种特殊窗口](https://www.notion.so/Button-4-50c4813aa0e44f97b7c3d1480008940e)

[点击 Button 触发普通视图](https://www.notion.so/Button-9c26ba91c6de40688a3896b207cc7655)

[添加动画](https://www.notion.so/86351e7f14dd44d386146fa658cf4aa0)

[Codable 和 JSON 数据格式](https://www.notion.so/Codable-JSON-5dec8648d9cf4efba324c089e0609b28)

[创建自定义代码段（code snippets）](https://www.notion.so/code-snippets-7ec5085eaf634b4a826ca930c53172b3)

[Swift 注释支持 markdown 语法（待测试）](https://www.notion.so/Swift-markdown-662feaa85d984fde9a3ac0bba9ab8348)

[模糊视图 BlurView 和 Dark 模式](https://www.notion.so/BlurView-Dark-3d9931ec163e436b8ab0af53d8a03e9f)

[Combine（先了解概念，后续继续研究）](https://www.notion.so/Combine-7762e6e2b3b24fa6913c0c7a599b9f5b)

# 记忆点

- 按住 option，点击鼠标左键即可查看该好函数或变量的简介定义
- swift 的`import UIKit`相当于 C 语言中的`#include <UIKit.h>`
- Container Views 容器视图包含`From`、`Group`、`GroupBox`、`Section`
- Divider()：分割线，在两个内容中间添加`Divider()`
- 每个函数参数都有一个参数标签 label 以及一个参数名称，默认情况下参数名称=参数标签。
- 如果函数参数有标签，在调用的时候必须使用标签。如果不希望为某个参数添加一个标签，可以使用一个下划线（\_）来代替一个明确的参数标签。
- 定义一个结构体或类时，命名使用首字母大写风格，如`SomeStructure`,`SomeClass`;（和 Bool/Int 一样属于类型）
- 定义一个属性或方法命名使用首字母小写风格，以便与类型名区分，如`frameRate`和`incrementCount`；
- 任何数据类型跟?就是可选类型，比如`var num1:Int? = 3`，可选类型的变量可用于处理“值缺失”
- 结构体和枚举时值类型，在发生数据传递时只发生值拷贝
- 类 class 是引用类型，在发生数据传递时，共用同一个内存地址，class a 改变，class b 也会改变（类似于 C 语言中不同的指针指向同一个内存空间）
- 每一个实例都有一个隐含属性叫做 self，self 完全等同于该实例本身
- self 的使用场景是实例方法的某个参数名与实例的某个属性名称相同时，用 self 来区分参数名称和属性名称
- 刷新 preview 的快捷键：Option + Command + P
- 预览没有显示，请选择 Editor > Canvas , 然后单击 Get Started 。
- background 和 foregroundColor 对于.color 和 Color.color 的使用没有区别

## 记忆点（已掌握）

- 重新编译 command+b
- `ctrl+i`  自动格式化代码（先选中一段代码）
- `shift+command+L`  调出库 Library
- 苹果基于 Swift 开发出的一套通用 UI，SwiftUI 原生支持“动态字体”、“深色模式”、本地化和辅助功能
- SwiftUI 在 Xcode11 中可以使用图形化界面拖拽，并实时在代码中更改
- SwiftUI 支持所有苹果设备 ios/pados/watch os
- Stack 包括  `VStack`、`HStack`、`ZStack`。其中 VStack 将视图垂直排列；HStack 将视图水平排列；ZStack 将视图叠加排列
- Spacer()：是一个灵活的空间视图，它可以沿着包含堆栈布局的主轴进行扩展，从而实现不同尺寸屏幕自适应，在两个内容中间添加`Spacer()`
- padding()：填充，给目标一些填充空间，不至于贴边

# Swift 简介

Swift，苹果于 2014 年 WWDC（苹果开发者大会）发布的新开发语言，可与 Objective-C 共同运行于 Mac OS 和 iOS 平台，用于搭建基于苹果平台的应用程序。Swift 吸收了众多现代编程语言的优点，尽力的提供简洁的编程语言和强大的功能。

# 使用模拟器或手机调试

- 使用模拟器调试点击 RUN 即可模拟器调试，见下图
- 使用手机调试，需要先将手机连写 mac，在 Xcode 中选中手机设备，再点 RUN

  ![http://image.tomtwos.com/tom-image/20200328/56Am7dxLfiz3.png?imageslim](http://image.tomtwos.com/tom-image/20200328/56Am7dxLfiz3.png?imageslim)

# 设置 APP 默认界面

在`SceneDelegate.swift`文件中修改`UIHostingController()`中的视图设置为进入 app 默认显示的界面

![http://image.tomtwos.com/tom-image/20200328/CSkQdK631qWj.png?imageslim](http://image.tomtwos.com/tom-image/20200328/CSkQdK631qWj.png?imageslim)

# List/Form/Group 的区别

- Form 仅用于 Picker、toggle 这一类数据输入的控件
- group 仅在 PreviewProvider 预览多个视图时使用
- 其他的列表都用 List（涉及添加或删除选项的也用 List）

# ForEach 历询

- 在 Xcode 中按住`cmd`+指定 View 或元素，调出选择框，选择 repeat，即可添加 ForEach 语法

  ![http://image.tomtwos.com/tom-image/20200328/gH4ElWWmVaV6.png?imageslim](http://image.tomtwos.com/tom-image/20200328/gH4ElWWmVaV6.png?imageslim)

# swift package dependencies

https://www.cnblogs.com/feng9exe/p/10485087.html

Swift Package Manager（swift 包管理器，简称：SPM）就是在 swift 开发中用来替代 CocoaPod 的；在 swift 开发中，SPM 完全可以替代 CocoaPod 的功能，并且速度更快，体验更佳；

# Lottie-iOS

Airbnb 开源的 Lottie，可以让开发者免去写一行一行的代码而非常容易地渲染动画。你可以直接把 Adobe After Effects 的动画用在你的 Xcode 项目中。并且 Android、macOS、React Native 都可使用。

## 什么是 Lottie 呢？

Airbnb 开源的 Lottie，可以让开发者免去写一行一行的代码而非常容易地渲染动画。你可以直接把 Adobe After Effects 的动画用在你的 Xcode 项目中。并且 Android、macOS、React Native 都可使用。

什么是 Lottie 呢？ 由 Airbnb 开发的[Lottie](https://github.com/airbnb/lottie-ios)是一个将 After Effects 动画提供给任意一个 iOS，macOS，Android 还有 React Native 原生 APP 的文件库。这些动画通过一个叫[Bodymovin](https://github.com/bodymovin/bodymovin)的开源 After Effects 插件，以 JSON 文件的形式进行输出。Lottie 通过 JSON 格式下载动画数据并实时提供给开发者。

Lottie 现在不仅在 GitHub 上已经开源，而且还提供一个示例项目和一系列的示例动画

# CocoaPods

CocoaPods 应该是 iOS 最常用最有名的类库管理工具了，通过 CocoaPods 工具我们可以为项目添加被称为“Pods”的依赖库（这些类库必须是 CocoaPods 本身所支持的），并且可以轻松管理其版本。（基本所有公司都在使用）

# 账号系统搭建

- 账号系统搭建的前提是有自己的服务器和数据库，这一块需要 LNMP，所以先尝试发布不带账号系统的工具类 APP，确定熟练 SwiftUI 以后，再开始搭建服务器：阿里云 + Linux + Nginx + MySQL + PHP
- [微信登陆 API](https://developers.weixin.qq.com/doc/oplatform/Mobile_App/WeChat_Login/Development_Guide.html)
- [Sign In with Apple 介绍](https://xiaozhuanlan.com/topic/8675913204)

# Playground 工具介绍

![http://image.tomtwos.com/tom-image/20200328/CH6tmWJ0cXMu.png?imageslim](http://image.tomtwos.com/tom-image/20200328/CH6tmWJ0cXMu.png?imageslim)

Playground 是 Xcode 的一个简单的测试环境，主要是用于快速测试 Swift 语法功能和验证 API 功能，并不是用来进行实际开发应用。如果开发者对 Swift 语法功能不太确定，则可以用 Playground 来测试代码，其次 Playground 也可以用来验证某个函数，类的功能。

# Mockplus

Mockplus（摹客）是一款简洁快速的原型图设计工具

# asset catalog（资源目录）

- asset catalog 是 iOS app 开发必不可少的组成部分。我们一般将图片存放其中，但其用途远不止于此。

![http://image.tomtwos.com/tom-image/20200328/WFLWHFSlpTaS.png?imageslim](http://image.tomtwos.com/tom-image/20200328/WFLWHFSlpTaS.png?imageslim)

- asset catalog 是 Xcode 提供的项目资源管理工具，其核心理念在于：以设备特征（traits）为单位配置资源，包括但不限于图片，颜色，材质，数据。既让开发者免于代码配置资源的烦恼，也让苹果能够更好的控制 .ipa 包。
- asset catalog 本质是一个文件目录。

# SF Symbols

> SF Symbols 中的 SF 表示 San Francisco，Symbols 表示符号，SF Symbols 对应的是 San Francisco system font（苹果设计的一种系统字体应用于 mac）

WWDC 2019 苹果发布 SF Symbols，SF Symbols 是苹果发布的一套内置的图标库, 大概有 1500 个内置图标, 并且提供了相关的 API 让我们更方便的使用，这些内置图标不仅仅是简单的图片, 他们可以像文字一样, 支持放大缩小加粗操作

## 使用方法

在程序中直接使用

`Image(systemName: house)`

调用，其中

`house`

是从 SF Symbols 中获取到的 icons 的名字

![http://image.tomtwos.com/tom-image/20200328/bbxHPuFqiVhr.png?imageslim](http://image.tomtwos.com/tom-image/20200328/bbxHPuFqiVhr.png?imageslim)
