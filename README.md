# 新笔记记录已转 Notion

如需笔记请联系邮箱：gaozichen2012@outlook.com

# 苹果开发笔记（已转 Notion）

- Swift，苹果于 2014 年 WWDC（苹果开发者大会）发布的新开发语言，可与 Objective-C 共同运行于 Mac OS 和 iOS 平台，用于搭建基于苹果平台的应用程序。Swift 吸收了众多现代编程语言的优点，尽力的提供简洁的编程语言和强大的功能。
  ![mark](http://image.tomtwos.com/tom-image/20200327/4fPGbtkpOOg0.png?imageslim)

# Swift 语法

Swift 语法单独记录：见 swift-notes.md
https://github.com/gaozichen2012/Swift-notes/blob/master/swift-notes.md

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
- `ctrl+i` 自动格式化代码（先选中一段代码）
- `shift+command+L` 调出库 Library
- 苹果基于 Swift 开发出的一套通用 UI，SwiftUI 原生支持“动态字体”、“深色模式”、本地化和辅助功能
- SwiftUI 在 Xcode11 中可以使用图形化界面拖拽，并实时在代码中更改
- SwiftUI 支持所有苹果设备 ios/pados/watch os
- Stack 包括 `VStack`、`HStack`、`ZStack`。其中 VStack 将视图垂直排列；HStack 将视图水平排列；ZStack 将视图叠加排列
- Spacer()：是一个灵活的空间视图，它可以沿着包含堆栈布局的主轴进行扩展，从而实现不同尺寸屏幕自适应，在两个内容中间添加`Spacer()`
- padding()：填充，给目标一些填充空间，不至于贴边

# 相关资源

- [Swift 官网](https://Swift.org/)
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

# 需求点

# 账号系统搭建

- 账号系统搭建的前提是有自己的服务器和数据库，这一块需要 LNMP，所以先尝试发布不带账号系统的工具类 APP，确定熟练 SwiftUI 以后，再开始搭建服务器：阿里云 + Linux + Nginx + MySQL + PHP

- [微信登陆 API](https://developers.weixin.qq.com/doc/oplatform/Mobile_App/WeChat_Login/Development_Guide.html)
- [Sign In with Apple 介绍](https://xiaozhuanlan.com/topic/8675913204)

# Playground 工具介绍

![Xcode截图](https://github.com/gaozichen2012/Swift-notes/blob/master/img/1-Xcode%E6%88%AA%E5%9B%BE.jpg?raw=true)

Playground 是 Xcode 的一个简单的测试环境，主要是用于快速测试 Swift 语法功能和验证 API 功能，并不是用来进行实际开发应用。如果开发者对 Swift 语法功能不太确定，则可以用 Playground 来测试代码，其次 Playground 也可以用来验证某个函数，类的功能。

# CocoaPods

CocoaPods 应该是 iOS 最常用最有名的类库管理工具了，通过 CocoaPods 工具我们可以为项目添加被称为“Pods”的依赖库（这些类库必须是 CocoaPods 本身所支持的），并且可以轻松管理其版本。（基本所有公司都在使用）

# Mockplus

Mockplus（摹客）是一款简洁快速的原型图设计工具

# asset catalog（资源目录）

- asset catalog 是 iOS app 开发必不可少的组成部分。我们一般将图片存放其中，但其用途远不止于此。

![asset catalog截图](https://github.com/gaozichen2012/Swift-notes/blob/master/img/3-asset%20catalog.jpg?raw=true)

- asset catalog 是 Xcode 提供的项目资源管理工具，其核心理念在于：以设备特征（traits）为单位配置资源，包括但不限于图片，颜色，材质，数据。既让开发者免于代码配置资源的烦恼，也让苹果能够更好的控制 .ipa 包。
- asset catalog 本质是一个文件目录。

# SF Symbols

> SF Symbols 中的 SF 表示 San Francisco，Symbols 表示符号，SF Symbols 对应的是 San Francisco system font（苹果设计的一种系统字体应用于 mac）

WWDC 2019 苹果发布 SF Symbols，SF Symbols 是苹果发布的一套内置的图标库, 大概有 1500 个内置图标, 并且提供了相关的 API 让我们更方便的使用，这些内置图标不仅仅是简单的图片, 他们可以像文字一样, 支持放大缩小加粗操作

## 使用方法

在程序中直接使用`Image(systemName: house)`调用，其中`house`是从 SF Symbols 中获取到的 icons 的名字
![SF Symbols](https://github.com/gaozichen2012/Swift-notes/blob/master/img/4-SF-Symbols.jpg?raw=true)

# Combine（先了解概念，后续继续研究）

- Combine 是 SwiftUI 中处理数据的本体，响应式框架
- SwiftUI 和 Combine 是 WWDC2019 发布的两大新框架，与 SwiftUI 配套的响应式编程框架 Combine 是一套通过组合变换事件操作来处理异步事件的标准库。
- SwiftUI 与 Combine 结合来控制业务数据的单向流动，让开发者无需关心数据流向，一些原来需要费时费力的处理工作由 Combine 包自动化处理，让开发复杂度大大降低
- 事件执行过程的关系包括：被观察者 Observable 和观察者 Observer，在 Combine 中对应着 Publisher 和 Subscriber

## Combine 中的三大支柱

三大支柱为`publisher` `Operator` `subscribe`，这三个都是协议，且都是`@propertyWrapper`的具体应用

- publisher：负责发布事件
- Operator：负责转换事件和数据
- subscribe：负责订阅事件

# Property Wrappers（属性包装器）

属性包装器的概念首先是从 SE-0258 提议中提出的。主要目的是将一些封装属性的逻辑从不同的结构中抽离出来，并复用到整个代码库中。这个提议苹果并未接受，但在 Xcode beta 的 Swift 5.1 快照中就有它了。

- SwiftUI 提供的属性包装器包括 @State, @Binding, @ObservedObject, @EnvironmentObject, 和 @Environment 。
- 可以自定义包装，但没必要。SwiftUI 提供的已经够用了。
- @State 包装的属性通常是设置成私有的，不让外部使用。如果想让外部使用，则应该使用@ObservedObject 和@EnvironmentObject，他们能够使外部修改属性后，状态能够得到改变。建议把@State 包装的属性都设置成私有：`@State private var username = ""`
- 使用@ObservedObject 修饰的变量需要赋值`order = Order()`，使用@EnvironmentObject 修饰的变量不需要赋初始值，直接使用`order: Order`
- 使用@EnvironmentObject 需要先把属性放到环境中，否则程序会崩溃

## @State

通过使用 @State 修饰器我们可以关联出 View 的状态。 SwiftUI 将会把使用过 @State 修饰器的属性存储到一个特殊的内存区域，并且这个区域和 View struct 是隔离的，只有关联的视图及其子视图能够访问它。当@State 属性值改变，SwiftUI 会重构与之相关的视图。
![使用State截图](https://github.com/gaozichen2012/Swift-notes/blob/master/img/5-%E5%B1%9E%E6%80%A7%E8%A3%85%E9%A5%B0%E5%99%A8state.jpg?raw=true)

## @Binding （捆绑）

有时候我们会把一个视图的属性传至子节点中，但是又不能直接的传递给子节点，因为在 Swift 中值的传递形式是值类型传递方式，也就是传递给子节点的是一个拷贝过的值。但是通过 @Binding 修饰器修饰后，属性变成了一个引用类型，传递变成了引用传递，这样父子视图的状态就能关联起来了。

- 在子视图中使用@Binding 修饰，在父视图中使用关键字`$`传递一个绑定引用
  ![使用Binding截图](https://github.com/gaozichen2012/Swift-notes/blob/master/img/6-%E5%B1%9E%E6%80%A7%E8%A3%85%E9%A5%B0%E5%99%A8Binding.jpg?raw=true)

## @ObservedObject （被观测的对象）（用于实现可操作数据，修改、添加、删除）

- @ObservedObject 告诉 SwiftUI，这个对象是可以被观察的，里面含有被@Published 包装了的属性。
- @ObservedObject 包装的对象，必须遵循 ObservableObject 协议。也就是说必须是 class 对象，不能是 struct。
- @ObservedObject 允许外部进行访问和修改。
  @ObservedObject 的用处和 @State 非常相似，从名字看来它是来修饰一个对象的，这个对象可以给多个独立的 View 使用。如果你用 @ObservedObject 来修饰一个对象，那么那个对象必须要实现 ObservableObject 协议，然后用 @Published 修饰对象里属性，表示这个属性是需要被 SwiftUI 监听的

### ObservedObject 例子 1

```
import SwiftUI
import Combine  //结合，Combine允许我们创建储存数据，并且进行数据操作的框架

//定义一个可被观测的数据类型，调用UpdateStore这个class就可以自动更新并储存updates
class UpdateStore : ObservableObject {
    @Published var updates: [Update] = updateData //定义一个可操作性的数据updates初始值为updateData
}

```

class 定义了一个 UpdateStore 类，这个类可以给不同的 View 使用，SwiftUI 会追踪使用 View 里经过 ObservableObject 修饰过的对象里进过 @Published 修饰的属性变换，一旦发生了变换，SwiftUI 会自动更新相关联的 UI

![ObservedObject的使用](https://github.com/gaozichen2012/Swift-notes/blob/master/img/9-%E8%A2%AB%E8%A7%82%E6%B5%8B%E6%95%B0%E6%8D%AE%E7%9A%84%E4%BD%BF%E7%94%A8.jpg?raw=true)

在声明时需要用@ObservedObject 来修饰 store，store.updates 相当原来的固定数据 updateData，使用方法一样相当于一个二维数组

### ObservedObject 例子 2

```
class Order: ObservableObject {
    @Published var items = [String]()
}

struct ContentView: View {
    @ObservedObject var order = Order()

    var body: some View {
    }
}
```

## @EnvironmentObject

> @EnvironmentObject 包装的属性是全局的，整个 app 都可以访问。
> 从名字上可以看出，这个修饰器是针对全局环境的。通过它，我们可以避免在初始 View 时创建 ObservableObject, 而是从环境中获取 ObservableObject
> 经过@EnvironmentObject 修饰之后，会隐含地注入到视图树的环境中去。这样，我们就能够允许当前环境中的所有子视图都能够访问到

### 例子 1

UserData.swift

```
import Combine
import SwiftUI

final class UserData: ObservableObject {
    @Published var showFavoritesOnly = false
    @Published var landmarks = landmarkData
}
```

LandmarkDetail.swift

```
import SwiftUI

struct LandmarkDetail: View {
    @EnvironmentObject var userData: UserData
    var landmark: Landmark

    var landmarkIndex: Int {
        userData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }

    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                HStack {
                    Text(verbatim: landmark.name)
                        .font(.title)

                    Button(action: {
                        self.userData.landmarks[self.landmarkIndex]
                            .isFavorite.toggle()
                    }) {
                        if self.userData.landmarks[self.landmarkIndex]
                            .isFavorite {
                            Image(systemName: "star.fill")
                                .foregroundColor(Color.yellow)
                        } else {
                            Image(systemName: "star")
                                .foregroundColor(Color.gray)
                        }
                    }
                }
            }
        }
    }
}

struct LandmarkDetail_Preview: PreviewProvider {
    static var previews: some View {
        let userData = UserData()
        return LandmarkDetail(landmark: userData.landmarks[0])
            .environmentObject(userData)
    }
}

```

LandmarkList.swift

```
import SwiftUI

struct LandmarkList: View {
    @EnvironmentObject private var userData: UserData

    var body: some View {
        NavigationView {
            List {
                Toggle(isOn: $userData.showFavoritesOnly) {
                    Text("Show Favorites Only")
                }

                ForEach(userData.landmarks) { landmark in
                    if !self.userData.showFavoritesOnly || landmark.isFavorite {
                        NavigationLink(
                            destination: LandmarkDetail(landmark: landmark)
                                .environmentObject(self.userData)
                        ) {
                            LandmarkRow(landmark: landmark)
                        }
                    }
                }
            }
            .navigationBarTitle(Text("Landmarks"))
        }
    }
}

struct LandmarksList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
        .environmentObject(UserData())
    }
}
```

### 例子 2

比如创建一个订单，所有页面都能访问和使用

```
class Order: ObservableObject {
    @Published var items = [String]()
}

struct ContentView: View {
    @EnvironmentObject var order: Order

    var body: some View {
    }
}
```

需要注意的是，不需要给定默认值，由于该属性是整个 app 都可以访问的，SwiftUI 会自动的从环境中取出来。

可以想象一下，有这样一个场景，A->B->C->D->E->F，A 界面的数据要传递给 F 界面，假如使用@ObservedObject 包装，则需要一层一层传递，而使用@EnvironmentObject 则不需要，直接在 F 界面，通过 SwiftUI 环境直接取出来就行。

> 注意：需要注意的是，当界面显示时，就会去环境中取，但是，假如之前没有把属性放到环境中，则程序会崩溃。

## @Environment

@Environment 和@EnvironmentObject 的区别是，EnvironmentObject 是修饰用户自定义的 object，而 Environment 是修饰系统自带的设定（ SwiftUI 本身就有很多系统级别的设定，我们开一个通过 @Environment 来获取到它们）

```
struct CalendarView: View {
    @Environment(\.calendar) var calendar: Calendar
    @Environment(\.locale) var locale: Locale
    @Environment(\.colorScheme) var colorScheme: ColorScheme

    var body: some View {
        return Text(locale.identifier)
    }
}
```

通过 @Environment 修饰的属性，我们开一个监听系统级别信息的变换，这个例子里一旦 Calendar, Locale, ColorScheme 发生了变换，我们定义的 CalendarView 就会刷新

## 其他包装器：@Published

@Published 是 SwiftUI 最有用的包装之一，允许我们创建出能够被自动观察的对象属性，SwiftUI 会自动监视这个属性，一旦发生了改变，会自动修改与该属性绑定的界面。

1.首先需要遵循 ObservableObject 属性

```
class Bag: ObservableObject {
    var items = [String]()
}
```

2.包装属性

```
class Bag: ObservableObject {
    @Published var items = [String]()
}
```

这样就完成了。@Published 包装会自动添加 willSet 方法监视属性的改变。
详细参考：

1. https://blog.csdn.net/kmyhy/article/details/97176972
2. 英文原版：https://swiftwithmajid.com/2019/06/12/understanding-property-wrappers-in-swiftui/
3. https://www.cnblogs.com/xiaoniuzai/p/11417123.html
4. https://www.jianshu.com/p/28623e017445

## 关于如何定义一个可操作的数据 ObservableObject

```
class UpdateStore : ObservableObject {
    @Published var updates: [Update] = updateData //定义一个updates初始值为updateData
}
```

其中`: [Update]`是可以省略的，因为已经直接赋值了，不需要在一定一遍数据类型

# Wartime preparation

## Xcode 添加不同的预览视角

默认 1 个预览视角，想要 2 个以上用 Group 重复即可；用 environment 可配置 dark 模式或字体大小预览

```
struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TabBar()
            TabBar()
                .environment(\.colorScheme, .dark)//以dark模式预览
                .environment(\.sizeCategory, .extraExtraExtraLarge)//以指定字体大小预览
        }
    }
}
```

同时在 SE、XS、iPad 上预览

```
struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE", "iPhone XS Max", "iPad Pro"], id: \.self) { deviceName in
            LandmarkList()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}
```

多设备预览效果如下图：
![多设备预览](https://github.com/gaozichen2012/Swift-notes/blob/master/img/16-%E5%A4%9A%E8%AE%BE%E5%A4%87%E9%A2%84%E8%A7%88.jpg?raw=true)

# 创建和使用结构体

声明结构体要遵循 Identifiable 协议，此协议中只有一个必须的属性：id，它用来让 SwiftUI 区分不同的 item

- 一般默认`id=UUID()`，UUID 是 Swift 用来标识协议类型、接口和一些其他 item

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

见：ObservedObject （被观测的对象）

# 滚动视图 ScrollView

```
//horizontal是让view水平滚动，showsIndicators=false是为了不显示滚动条
ScrollView (.horizontal,showsIndicators: false) {
    HStack(spacing: 30) {
        ForEach(courses) { item in
            CourceView(
                titile: item.title,
                image: item.image,
                color: item.color,
                shadowColor: item.shadowColor)
        }
        .padding(.leading, 40)
        .padding(.trailing,40)//让滚动视图最左和最右的视图离边框的距离是40
    }
}
```

# 导航列表 NavigationView-NavigationLink 通用组件

苹果提供 NavigationView-NavigationLink 框架让列表及列表相关操作变得简单

```
import SwiftUI

struct UpdateList: View {
    var updates = updateData
    @ObservedObject var store = UpdateStore() //声明一个可操作的数据store

    /* 实现添加一组数据，供Button()使用 */
    func addUpdate() { //
        store.updates.append(Update(image: "Certificate1", title: "New Title", text: "New Text", date: "JUL 1"))
    }

    /* 实现列表上下排序，获取移动list的值供onMove调用 */
    func move(from source: IndexSet, to destination: Int) {
        store.updates.swapAt(source.first!, destination)
    }

    var body: some View {
        /* 导航列表视图使用NavigationView-NavigationLink通用框架 */
        NavigationView {
            List {
                ForEach(store.updates) { item in //创建foreach是为了增加滑动删除按钮
                    NavigationLink(destination: UpdateDetail(title: item.title, text: item.text, image: item.image)) {
                        HStack(spacing: 15.0) {
                            Image(item.image)
                            Text(item.title)
                            }
                        }
                        .padding(.vertical)
                    }
                .onDelete{ index in
                self.store.updates.remove(at: index.first!)
                }//onDelete为删除控件，当左滑动作出现时，删除updates数据
                .onMove(perform: move)
            }
            .navigationBarTitle(Text("Updates"))
            //在导航列表界面创建按钮功能需要使用navigationBarItems
            //如果是编辑按钮直接调用EditButton()
            //如果是添加选项则使用Button模型即可
            //如果是需要调出新页面则需要使用Button-sheet模型
            .navigationBarItems(
                leading: Button(action: addUpdate) { Text("Add Update") },
                trailing: EditButton()
            )
        }
    }
}
```

# Settings 列表小控件

Settings 列表用到了导航列表 NavigationView 框架，以表格 Form 作为载体，用到的小控件有开关 Toggle、步进 Stepper、选择器 Picker、日期选择器 DatePicker、文本输入 TextField、警报 Alert

- `SecureField` 一般作为密码输入时使用，使用方式与 `TextField` 并无差别，示例与运行效果同上 `TextField`。
- 比如 Settings 这种列表总数量固定的用 Form，涉及添加或删除选项的用 List
- 各个小控件都用了@State 修饰的数据，使用\$符号是因为需要向小控件传递数据
- TextField 用到了 Section 作为载体，Section 相当于一个集合，目的是与上下文区分，见下图
  ![Settings截图](https://github.com/gaozichen2012/Swift-notes/blob/master/img/11-Settings%E6%88%AA%E5%9B%BE.jpg?raw=true)

```
import SwiftUI

struct Settings: View {
    @State var receive = false
    @State var number = 1
    @State var selection = 1
    @State var date = Date()
    @State var email = ""
    @State var submit = false

    var body: some View {
        NavigationView {
            Form { //表格，Form功能相当于list，但是不要提交数据
                Toggle(isOn: $receive) {
                    Text("Receive notification")
                }
                Stepper(value: $number, in: 1...10) {
                    Text("\(number) Notification\(number > 1 ? "s" : "") per week")
                }
                Picker(selection: $selection, label: Text("Favorite")) {
                    Text("SwiftUI").tag(1)
                    Text("React").tag(2)
                }
                DatePicker(selection: $date, label: { Text("Date") })
                Section(header: Text("Email")) {
                    TextField("Your email", text: $email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                Button(action: {self.submit.toggle()}){
                    Text("Submit")
                }
            .alert(isPresented: $submit, content: {
                Alert(title: Text("Thanks!"), message: Text("Email:\(email)"))
            })
            }
            .navigationBarTitle("Settings")
        }
    }
}
```

另一种形式的 Picker 使用（常用）

```
 VStack(alignment: .leading, spacing: 20) {
                Text("Seasonal Photo").bold()

                Picker("Seasonal Photo", selection: $profile.seasonalPhoto) {
                    ForEach(Profile.Season.allCases, id: \.self) { season in
                        Text(season.rawValue).tag(season)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
```

![另一种Picker使用](https://github.com/gaozichen2012/Swift-notes/blob/master/img/17-%E5%8F%A6%E4%B8%80%E7%A7%8DPicker%E4%BD%BF%E7%94%A8.jpg?raw=true)

# ForEach 历询

- 在 Xcode 中按住`cmd`+指定 View 或元素，调出选择框，选择 repeat，即可添加 ForEach 语法
  ![foreach](https://github.com/gaozichen2012/Swift-notes/blob/master/img/8-ForEach.jpg?raw=true)

# 设置图片步骤

```
Image(item.image)
    .resizable() //让图像尺寸可调
    .aspectRatio(contentMode: .fit) //将图片设置为填充
    .frame(width: 80 ,height: 80) //设置图片框架大小
    .background(Color("background")) //设置图片背景
    .cornerRadius(20) //设置圆角

Image("Card1")
    .resizable()
    .aspectRatio(contentMode: .fill)
    .frame(width:300, height: 110, alignment: .top)
```

# 模糊视图 BlurView 和 Dark 模式

SwiftUI 中暂时无模糊视图的方法，所以使用 Uikit 做了一个模糊的方法在`BlurView.swift`文件中，不需细研究，直接调用即可

- Dark 模式和 BlurView 放在一起讲，是因为 dark 模式中大量用到模糊视角，有一些设置是重复的
- 模糊视图 BlurView 的背景选为系统材料 systemMaterial，为了用于兼容 dark
- 设置背景色为自适应白天和 dark 模式，那么前景色 foregroundColor 也需要自适应：如 primary

```
 BlurView(style: .systemMaterial)//作为一个View呈现
 .background(BlurView(style: .systemMaterial))//作为View的修饰语呈现
 .background(BlurView(style: .systemThinMaterial))//systemThinMaterial是加厚渲染，比如一些按钮或处于顶部的视图需要做强对比
 .foregroundColor(.primary)//primary对白天模式是黑色，对于dark模式为白色
 .foregroundColor(.clear)//与primary相反
```

![BlurView](https://github.com/gaozichen2012/Swift-notes/blob/master/img/10-BlurView.jpg?raw=true)

# TabBar（底部栏）

```
添加底部栏使用`TabView()`,下面例子中Home、contentView、UpdateList为各个View
import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView() {
            Home().tabItem({
                VStack {
                    Image(systemName: "house")
                    Text("home")
                }
            })
                .tag(1) //constant(1)与.tag()相对应，constant选中那个，对应默认主界面就是tag()对应的界面
            ContentView().tabItem({
                VStack {
                    Image(systemName: "creditcard")
                    Text("Certificates")
                }
            })
                .tag(2)
            UpdateList().tabItem({
                VStack {
                    Image(systemName: "square.and.pencil")
                    Text("Updates")
                }
            })
            .tag(3)
        }
    }
}
```

# 使用模拟器或手机调试

- 使用模拟器调试点击 RUN 即可模拟器调试，见下图
- 使用手机调试，需要先将手机连写 mac，在 Xcode 中选中手机设备，再点 RUN
  ![使用模拟器调试](https://raw.githubusercontent.com/gaozichen2012/Swift-notes/master/img/12-%E4%BD%BF%E7%94%A8%E6%A8%A1%E6%8B%9F%E5%99%A8%E8%B0%83%E8%AF%95.jpg?raw=true)

# 设置 APP 默认界面

在`SceneDelegate.swift`文件中修改`UIHostingController()`中的视图设置为进入 app 默认显示的界面
![设置APP默认界面](https://github.com/gaozichen2012/Swift-notes/blob/master/img/13-%E8%AE%BE%E7%BD%AEAPP%E9%BB%98%E8%AE%A4%E7%95%8C%E9%9D%A2.jpg?raw=true)

# Swift 注释支持 markdown 语法（待测试）

![MARK-TODO](https://github.com/gaozichen2012/Swift-notes/blob/master/img/14-%E6%B3%A8%E9%87%8A.jpg?raw=true)

````
     /**
     # 支持markdown
     # 一级标题
     ## 二级标题也可以的
     注释参考2
     隔一行表示换行d

     三个”***"代表一条分割线
     ***
     ## 使用示例
     ```
     let result = testComment2(pram: "参数1", param2: true))
     ```

     ****
     - important:这个很重要
     - returns: 有返回值
     - parameter pram: The cubes available for allocation
     - parameter param2: The people that require cubes

     */
    func testComment2(pram:String, param2:Bool) -> Bool {
        print("markdown支持")
        return true
    }
````

# 创建自定义代码段（code snippets）

![自定义代码段](https://github.com/gaozichen2012/Swift-notes/blob/master/img/15-%E8%87%AA%E5%AE%9A%E4%B9%89%E4%BB%A3%E7%A0%81%E6%AE%B5.jpg?raw=true)
https://help.apple.com/xcode/mac/current/#/dev2b24f6f93

# Codable 和 JSON 数据格式

- JSON（JavaScript Object Notation，JavaScript 对象表示法），是一种轻量级的数据交换语言，该语言以易于让人阅读的文字为基础，用来传输由属性值或者序列性的值组成的数据对象。尽管 JSON 是 JavaScript 的一个子集，但 JSON 是独立于语言的文本格式，并且采用了类似于 C 语言家族的一些习惯。
- Codable 是 Swift 4.0 以后推出的一个编解码协议，可以配合 JSONDecoder 和 JSONEncoder 用来进行 JSON 解码和编码。
- JSONDecoder Apple 官方推出的基于 Codable 的 JSON 解析类
- Codable 提供了简洁的 API，使 Swift 的编码与解析焕然一新。
- Swift 的 Enum，Struct 和 Class 都支持 Codable

## 对 JSON 数据的解析使用分析《SwiftUI 教程中第三节》

1.定义了一个`landmarkData.json`json 数据，里面存放了用户数据 2.在`Data.swift`中定义了函数方法`load`,对 json 数据进行了解析：`load("landmarkData.json")`,`load`方法内用到了`JSONDecoder()`和`.decode(T.self, from: data)`对 json 数据进行解码，解码后的数据以`Landmark`格式存在`landmarkData` 3.在后续调用函数中声明`var landmark : Landmark`，再在预览视图中传入数据：`LandmarkRow(landmark: landmarkData[0])`

菜鸟 JSON 教程：https://www.runoob.com/json/json-tutorial.html

# List/Form/Group 的区别

- Form 仅用于 Picker、toggle 这一类数据输入的控件
- group 仅在 PreviewProvider 预览多个视图时使用
- 其他的列表都用 List（涉及添加或删除选项的也用 List）

# class 声明为 final 的作用

final 修饰类 不能被继承，也没有子类。
【使用环境】： 1.不是专门为继承而设计的类，类的本身方法之间有复杂的调用关系。假如随意创建这些类的子类，子类可能会错误的修改父类的实现细节 2.出于安全原因，类的实现细节不允许有任何改动 3.在创建对象模型的时候，确信这个类不会再被扩展

# swift package dependencies

https://www.cnblogs.com/feng9exe/p/10485087.html
Swift Package Manager（swift 包管理器，简称：SPM）就是在 swift 开发中用来替代 CocoaPod 的；在 swift 开发中，SPM 完全可以替代 CocoaPod 的功能，并且速度更快，体验更佳；

# Lottie-iOS

Airbnb 开源的 Lottie，可以让开发者免去写一行一行的代码而非常容易地渲染动画。你可以直接把 Adobe After Effects 的动画用在你的 Xcode 项目中。并且 Android、macOS、React Native 都可使用。

什么是 Lottie 呢？
由 Airbnb 开发的[Lottie](https://github.com/airbnb/lottie-ios)是一个将 After Effects 动画提供给任意一个 iOS，macOS，Android 还有 React Native 原生 APP 的文件库。这些动画通过一个叫[Bodymovin](https://github.com/bodymovin/bodymovin)的开源 After Effects 插件，以 JSON 文件的形式进行输出。Lottie 通过 JSON 格式下载动画数据并实时提供给开发者。

Lottie 现在不仅在 GitHub 上已经开源，而且还提供一个示例项目和一系列的示例动画

## extension（扩展）

# 点击 Button 触发 4 种特殊窗口

点击 Button 可以触发四种操作分别为底部 Modal 模态窗口 sheet、底部选择框 actionSheet、报警窗口 alert 和 Popover 气泡浮出层 popover，其中 popover 气泡弹出层不能在 iphone 中使用，所以暂时不研究

## Button-sheet，点击 Button 跳出底部 Modal 模态窗口 sheet

```
@State var show = false

Button(action: { self.show.toggle() }){
    //此处为按钮显示的内容或界面
    }
    .sheet(isPresented: self.$show) { ContentView() } //ContentView为要跳出来的目标视图

```

![Button-sheet实例1](https://github.com/gaozichen2012/Swift-notes/blob/master/img/7-Button-sheet1.jpg?raw=true)

## Button-actionSheet，点击 Button 跳出底部选择框

```
    @State var showActionSheet = false
    var body: some View {
        Button(action: {self.showActionSheet = true}) {
            BottonTextSonView(text: "弹出actionSheet选择窗口")
        }
        .actionSheet(isPresented: $showActionSheet, content: {sheet})

    }

    private var sheet: ActionSheet {

        let action = ActionSheet(title: Text("Title"),
                                 message: Text("Message"),
                                 buttons:
            [.default(Text("Default"), action: { print("Default")
                self.showActionSheet = false
            }),.destructive(Text("destructive"), action: {
                print("destructive")
                self.showActionSheet = false
            }),.cancel({
                print("Cancel")
                self.showActionSheet = false
            })])

        return action
    }
```

## Button-alert，点击 Button 跳出报警窗口

```
            Button(action: {self.showAlert = true}) {
                BottonTextSonView(text: "弹出alert报警窗口")
            }
            .alert(isPresented: $showAlert, content: {
                Alert(title: Text("alert报警窗口"),
                      message: Text("报警窗口里的内容第一行\n报警窗口里的内容第二行"),
                      primaryButton: .destructive(Text("确认")) { print("已转出") },
                      secondaryButton: .cancel())
            })
```

![3个跳出界面合并截图]()

1 点击按钮从底部弹出
2 点击按钮从底部弹
3 点击按钮跳出显示报警窗口（Botton-alert）
4 点击俺就跳出 Popover 气泡浮出层（Button-popover）

### popover 气泡浮出层

> iOS 的规范中限定 Popover 只能作为临时视图在 iPad 中使用，不能用在 iPhone 上。

Popover（气泡弹出框/弹出式气泡/气泡）是由一个矩形和三角箭头组成的弹出窗口，箭头指向的地方通常是导致 Popover 弹出的控件或区域。通过点击 Popover 内的按钮或非 Popover 的屏幕其他区域可关闭 Popover。
常用于快捷导航、长按触发、提示引导、临时视图
![popover四种用法](https://github.com/gaozichen2012/SwiftUI-notes/blob/master/img/18-popover%E7%94%A8%E6%B3%95.jpg?raw=true)

# 点击 Button 触发普通视图

- 定义一个 Botton 子视图，再定义一个跳出界面的子视图，用@Binding 分别绑定一个传入参数，再在父视图中用 Zstack 包含，点击 Botton 触发绑定的参数，该参数传入跳出界面的子视图改变偏移量实现该视图的显示和移出
- 点击 Button 触发普通视图在某种情况下和 Button-sheet 很相似

```
//父视图
struct ButtonNormalPopupViewPage: View {
    @State var show = false

    var body: some View {
        ZStack {
            NormalButtonSonView(show: $show)
            .animation(.spring())//按钮的动画
            PopupSonView(show: $show)
            .animation(.easeInOut(duration: 2))//弹出视图的动画
        }
    }
}

//Button子视图
struct NormalButtonSonView: View {
    @Binding var show : Bool
    var body: some View {
        Button(action: { self.show.toggle()}) {
            VStack {
                BottonView()
                .scaleEffect(show ? 1.5 : 1)
                Spacer()
            }
        }
    }
}

//弹出的子视图
struct PopupSonView: View {
    @Binding var show : Bool
    var body: some View {
        VStack {
            Text("这是一个弹出的子视图")
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(Color.yellow)
        .cornerRadius(30)
        .offset(y:show ? 50 : UIScreen.main.bounds.height)
        .onTapGesture {
            self.show.toggle()
        }
    }
}

//定义一个按钮
struct BottonView: View {
    var body: some View {
        VStack {
            Text(" 弹出普通视图 ")
        }
        .frame(width:150,height: 50)
        .background(Color.pink)
        .foregroundColor(.white)
        .cornerRadius(30)
    }
}
```

# 添加动画

无论是给按钮自身加动画还是给视图加动画直接使用.animation()即可满足需求，避免使用 withAnimation()。

- 比如点击一个按钮跳出一个界面，按钮的动画用.animation()，跳出的界面也用.animation()
- 不用 withAnimation 的原因：比如对按钮使用 withAnimation()会自动给按钮和跳出的视图加上动画，但是让跳出的视图返回是没有动画的，所以为了避免逻辑混乱，直接使用.animation()即可

```
struct ButtonNormalPopupViewPage: View {
    @State var show = false

    var body: some View {
        ZStack {
            NormalButtonSonView(show: $show)
            .animation(.spring())//按钮的动画
            PopupSonView(show: $show)
            .animation(.easeInOut(duration: 2))//弹出视图的动画
        }
    }
}
```

## animation 常用动画效果

```
.animation(.default)
.animation(.easeInOut(duration: 0.5))
.animation(.spring())
.animation(nil)

/* 将动画封装起来，再以.animation(animation)方式调用 */
struct GraphCapsule: View {
    var animation: Animation {
        Animation.spring(dampingFraction: 0.5)
        	.speed(2)
         	.delay(0.03 * Double(index))
    }

    var body: some View {
        Capsule()
            .fill(Color.white)
            .frame(height: height * heightRatio, alignment: .bottom)
            .offset(x: 0, y: height * -offsetRatio)
            .animation(animation)
    }
}

```

# 学习点：

- 通过苹果 SwiftUI 教程第三节的 Section 4：了解此节使用 ObservableObject 的方式与 bilibili 教程的区别异同（重要）
- 通过苹果 SwiftUI 教程第三节的 Section 6: 了解父子视图的 ObservableObject 类型数据传递（重要）
- 苹果 SwiftUI 教程第 5 节 3.2 使用 extension 自定义一个静态静态属性并使用（了解此用法，目的是为了保持代码清洁可读）对比 4.2 的用法
- 6.2.1 了解 Dictionary 结构的作用，和使用场合
- 6.4.3 .listRowInsets(EdgeInsets())将内容就可以展开到显示的边缘。
- 6.5.2 通过应用 renderingMode(_:) 和 color(_:) 修饰符改变分类项的导航外观。
- 7.4 使用 onAppear(perform:) 和 onDisappear(perform:),延迟编辑的传递,使编辑在用户退出编辑模式之后才生效，我们需要在编辑期间使用信息的草稿副本，然后仅在用户确认编辑时将草稿副本分配给真实副本。
- SwiftUI 官方教程涉及 swift 语法过多，先大概过一遍功能和模块，再针对性研究 swift 语法，再回头一遍一遍过 SwiftUI 官方教程
- UIKit 和 SwiftUI 联合开发未研究，暂不研究，只需看懂苹果官方教程的实例即可
- swift 语法中的属性后面一些内容待整理：https://swiftgg.gitbook.io/swift/swift-jiao-cheng/10_properties
- 研究 github 上的例子 app：https://github.com/gaozichen2012/SwiftUI
- 当觉得无项目或者无目标时到 github 搜 SwiftUI，找一些好项目学习
- 学习账号系统的搭建
- 学习播放音乐所需要的组件（VedioCtroller）
- 关注 MengTo 的 SwiftUI 教程

# 近期学习计划

- 在 example APP 中添加数据储存，在 app 里修改，下次打开依旧有数据
- 重新整理的 example APP 中动画，各种情况下的动画使用
- 构思并开始整理 example APP 的内容（不要详细解释，详细解释会在此笔记中解释，只要标出相关名词和动作即可）
- 针对 example app 重新整理汇总笔记
- 完成 example app 的 Button 组合的 3 个截图
-

几种动画形式

- 点击按钮或 View，该按钮或 View 本身出现变化
- 拖动按钮或 View，该按钮或 View 出现变化
- 点击按钮或 View，跳出（button-sheet）
- 点击按钮或 View，跳出其他 View

# example APP 规划

## 3 种 Button 呈现其他视图(Presenting Additional Views)

--Button-sheet 底部弹出 Modal 模态窗口
--Botton-actionSheet 底部弹出选择框
--Botton-alert 显示报警窗口
--Botton-popover

## button 处理视图事件 Handling View Events

## button 处理视图水龙头和笔势 Handling View Taps and Gestures

## button 向视图添加动画

1 基础元素（文字+）

iOS 接入 Lottie 动画过程详解（使用 lottie）：http://www.cocoachina.com/articles/23324
SwiftUI 和 Flutter 开发对比：http://www.cocoachina.com/cms/wap.php?action=article&id=87003

# TODOLIST

- 整理关于点按 onTapGesture 和 gesture 拖动的使用
- 在高动画状态使用 clipShape 代替 cornerRadius，实现不同圆角的动画
- 多重动画在.animation 中再调用 Animation
- Color 可以作为框架直接使用
- 渐变色 LinearGradient
- 颜色图形化代码 colorLiteral,双击切换颜色
- 和 color 图形化界面类似显示，图片图形化预览 Image(uiImage: imageLiteral)
- .edgesIgnoringSafeArea(.all)忽略安全区域
- let screen = UIScreen.main.bounds //声明一个屏幕的常量，为了不同设备的自适应
- 让系统图标变黑色.renderingMode(.original)；切割图片成圆的.clipShape(Circle())
- 在 ScrollView 中使用 GeometryReader+frame+rotation3DEffect 实现 3D 滚动
- addUpdate 实现添加项目，配合 navigationBarItems+button，在列表中显示一个加号
- .lineLimit(2)//最多 2 行，多的省略号隐藏
- 列出几种常用的字体形式在 example app 中（Text("82%").font(.subheadline).fontWeight(.bold)）
- 列出以后可能用到的几种进度圆 Circle
- MengTo 的 24 节说了关于自定义 Modifier 的内容，有需要是先看
- 了解 transition 的作用
- @binding 和 constant(true)的使用
