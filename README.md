# 苹果开发笔记
* Swift，苹果于2014年WWDC（苹果开发者大会）发布的新开发语言，可与Objective-C共同运行于Mac OS和iOS平台，用于搭建基于苹果平台的应用程序。Swift吸收了众多现代编程语言的优点，尽力的提供简洁的编程语言和强大的功能。

# Swift语法
Swift语法单独记录：见swift-notes.md
https://github.com/gaozichen2012/Swift-notes/blob/master/swift-notes.md

# 记忆点
* 每个函数参数都有一个参数标签label以及一个参数名称，默认情况下参数名称=参数标签。
* 如果函数参数有标签，在调用的时候必须使用标签。如果不希望为某个参数添加一个标签，可以使用一个下划线（_）来代替一个明确的参数标签。
* 定义一个结构体或类时，命名使用首字母大写风格，如`SomeStructure`,`SomeClass`;（和Bool/Int一样属于类型）
* 定义一个属性或方法命名使用首字母小写风格，以便与类型名区分，如`frameRate`和`incrementCount`；
* 任何数据类型跟?就是可选类型，比如`var num1:Int? = 3`，可选类型的变量可用于处理“值缺失”
* 结构体和枚举时值类型，在发生数据传递时只发生值拷贝
* 类class是引用类型，在发生数据传递时，共用同一个内存地址，class a改变，class b也会改变（类似于C语言中不同的指针指向同一个内存空间）
* 每一个实例都有一个隐含属性叫做 self，self 完全等同于该实例本身
* self的使用场景是实例方法的某个参数名与实例的某个属性名称相同时，用self来区分参数名称和属性名称
* 刷新 preview 的快捷键：Option + Command + P
* 预览没有显示，请选择 Editor > Canvas , 然后单击 Get Started 。
* background和foregroundColor对于.color和Color.color的使用没有区别
## 记忆点（已掌握）
* 重新编译command+b
* `ctrl+i` 自动格式化代码（先选中一段代码）
* `shift+command+L` 调出库Library
* 苹果基于Swift开发出的一套通用UI，SwiftUI 原生支持“动态字体”、“深色模式”、本地化和辅助功能
* SwiftUI在Xcode11中可以使用图形化界面拖拽，并实时在代码中更改
* SwiftUI支持所有苹果设备ios/pados/watch os

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

# 账号系统搭建
## 微信登陆：
https://developers.weixin.qq.com/doc/oplatform/Mobile_App/WeChat_Login/Development_Guide.html
## Sign In with Apple介绍1
https://xiaozhuanlan.com/topic/8675913204


# 需求点
* Mac Windows多终端同步助手
* 微博朋友圈qq空间insFacebook同步助手
* 照片滤镜，摄影模板助手
* 单词本助手
* gif转换助手
* 番茄钟（mac+iphone+watch）
* 睡眠钟
* 时间倒计时（iphone+watch+mac）
* 看iPhone MAC app store付费榜以半价策略攻击

# Playground工具介绍
![Xcode截图](https://github.com/gaozichen2012/Swift-notes/blob/master/img/1-Xcode%E6%88%AA%E5%9B%BE.jpg?raw=true)

Playground是Xcode的一个简单的测试环境，主要是用于快速测试Swift语法功能和验证API功能，并不是用来进行实际开发应用。如果开发者对Swift语法功能不太确定，则可以用Playground来测试代码，其次Playground也可以用来验证某个函数，类的功能。

# CocoaPods
CocoaPods应该是iOS最常用最有名的类库管理工具了，通过CocoaPods工具我们可以为项目添加被称为“Pods”的依赖库（这些类库必须是CocoaPods本身所支持的），并且可以轻松管理其版本。（基本所有公司都在使用）

# Mockplus
Mockplus（摹客）是一款简洁快速的原型图设计工具

# asset catalog（资源目录）
* asset catalog是 iOS app 开发必不可少的组成部分。我们一般将图片存放其中，但其用途远不止于此。
![asset catalog截图](https://github.com/gaozichen2012/Swift-notes/blob/master/img/3-asset%20catalog.jpg?raw=true)
* asset catalog是 Xcode 提供的项目资源管理工具，其核心理念在于：以设备特征（traits）为单位配置资源，包括但不限于图片，颜色，材质，数据。既让开发者免于代码配置资源的烦恼，也让苹果能够更好的控制 .ipa 包。
* asset catalog 本质是一个文件目录。

# SF Symbols
>SF Symbols中的SF表示San Francisco，Symbols表示符号，SF Symbols对应的是San Francisco system font（苹果设计的一种系统字体应用于mac）

WWDC 2019苹果发布SF Symbols，SF Symbols是苹果发布的一套内置的图标库, 大概有 1500 个内置图标, 并且提供了相关的 API 让我们更方便的使用，这些内置图标不仅仅是简单的图片, 他们可以像文字一样, 支持放大缩小加粗操作
## 使用方法
在程序中直接使用`Image(systemName: house)`调用，其中`house`是从SF Symbols中获取到的icons的名字
![SF Symbols](https://github.com/gaozichen2012/Swift-notes/blob/master/img/4-SF-Symbols.jpg?raw=true)

# Combine（先了解概念，后续继续研究）
* Combine是SwiftUI中处理数据的本体，响应式框架
* SwiftUI和Combine是WWDC2019发布的两大新框架，与SwiftUI配套的响应式编程框架Combine是一套通过组合变换事件操作来处理异步事件的标准库。
* SwiftUI与Combine结合来控制业务数据的单向流动，让开发者无需关心数据流向，一些原来需要费时费力的处理工作由Combine包自动化处理，让开发复杂度大大降低
* 事件执行过程的关系包括：被观察者Observable和观察者Observer，在Combine中对应着Publisher和Subscriber
## Combine中的三大支柱
三大支柱为`publisher` `Operator` `subscribe`，这三个都是协议，且都是`@propertyWrapper`的具体应用
* publisher：负责发布事件
* Operator：负责转换事件和数据
* subscribe：负责订阅事件

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
# Property Wrappers（属性包装器）
属性包装器的概念首先是从 SE-0258 提议中提出的。主要目的是将一些封装属性的逻辑从不同的结构中抽离出来，并复用到整个代码库中。这个提议苹果并未接受，但在 Xcode beta 的 Swift 5.1 快照中就有它了。
* SwiftUI 提供的属性包装器包括 @State, @Binding, @ObservedObject, @EnvironmentObject, 和 @Environment 。
* 可以自定义包装，但没必要。SwiftUI提供的已经够用了。
* @State包装的属性通常是设置成私有的，不让外部使用。如果想让外部使用，则应该使用@ObservedObject和@EnvironmentObject，他们能够使外部修改属性后，状态能够得到改变。建议把@State包装的属性都设置成私有：`@State private var username = ""`
* 使用@ObservedObject修饰的变量需要赋值`order = Order()`，使用@EnvironmentObject修饰的变量不需要赋初始值，直接使用`order: Order`
* 使用@EnvironmentObject需要先把属性放到环境中，否则程序会崩溃
## @State
通过使用 @State 修饰器我们可以关联出 View 的状态。 SwiftUI 将会把使用过 @State 修饰器的属性存储到一个特殊的内存区域，并且这个区域和 View struct 是隔离的，只有关联的视图及其子视图能够访问它。当@State 属性值改变，SwiftUI 会重构与之相关的视图。
![使用State截图](https://github.com/gaozichen2012/Swift-notes/blob/master/img/5-%E5%B1%9E%E6%80%A7%E8%A3%85%E9%A5%B0%E5%99%A8state.jpg?raw=true)
## @Binding （捆绑）
有时候我们会把一个视图的属性传至子节点中，但是又不能直接的传递给子节点，因为在 Swift 中值的传递形式是值类型传递方式，也就是传递给子节点的是一个拷贝过的值。但是通过 @Binding 修饰器修饰后，属性变成了一个引用类型，传递变成了引用传递，这样父子视图的状态就能关联起来了。
* 在子视图中使用@Binding修饰，在父视图中使用关键字`$`传递一个绑定引用
![使用Binding截图](https://github.com/gaozichen2012/Swift-notes/blob/master/img/6-%E5%B1%9E%E6%80%A7%E8%A3%85%E9%A5%B0%E5%99%A8Binding.jpg?raw=true)
## @ObservedObject （被观测的对象）（用于实现可操作数据，修改、添加、删除）
* @ObservedObject告诉SwiftUI，这个对象是可以被观察的，里面含有被@Published包装了的属性。
* @ObservedObject 包装的对象，必须遵循ObservableObject协议。也就是说必须是class对象，不能是struct。
* @ObservedObject允许外部进行访问和修改。
@ObservedObject 的用处和 @State 非常相似，从名字看来它是来修饰一个对象的，这个对象可以给多个独立的 View 使用。如果你用 @ObservedObject 来修饰一个对象，那么那个对象必须要实现ObservableObject协议，然后用 @Published 修饰对象里属性，表示这个属性是需要被 SwiftUI 监听的

### ObservedObject 例子1
```
import SwiftUI
import Combine  //结合，Combine允许我们创建储存数据，并且进行数据操作的框架

//定义一个可被观测的数据类型，调用UpdateStore这个class就可以自动更新并储存updates
class UpdateStore : ObservableObject {
    @Published var updates: [Update] = updateData //定义一个可操作性的数据updates初始值为updateData
}

```
class定义了一个UpdateStore类，这个类可以给不同的 View 使用，SwiftUI 会追踪使用 View 里经过 ObservableObject 修饰过的对象里进过 @Published 修饰的属性变换，一旦发生了变换，SwiftUI 会自动更新相关联的 UI

![ObservedObject的使用](https://github.com/gaozichen2012/Swift-notes/blob/master/img/9-%E8%A2%AB%E8%A7%82%E6%B5%8B%E6%95%B0%E6%8D%AE%E7%9A%84%E4%BD%BF%E7%94%A8.jpg?raw=true)

在声明时需要用@ObservedObject来修饰store，store.updates相当原来的固定数据updateData，使用方法一样相当于一个二维数组

### ObservedObject 例子2
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
>@EnvironmentObject包装的属性是全局的，整个app都可以访问。
从名字上可以看出，这个修饰器是针对全局环境的。通过它，我们可以避免在初始 View 时创建 ObservableObject, 而是从环境中获取 ObservableObject
经过@EnvironmentObject修饰之后，会隐含地注入到视图树的环境中去。这样，我们就能够允许当前环境中的所有子视图都能够访问到
### 例子1
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
### 例子2
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
需要注意的是，不需要给定默认值，由于该属性是整个app都可以访问的，SwiftUI会自动的从环境中取出来。

可以想象一下，有这样一个场景，A->B->C->D->E->F，A界面的数据要传递给F界面，假如使用@ObservedObject包装，则需要一层一层传递，而使用@EnvironmentObject则不需要，直接在F界面，通过SwiftUI环境直接取出来就行。
>注意：需要注意的是，当界面显示时，就会去环境中取，但是，假如之前没有把属性放到环境中，则程序会崩溃。
## @Environment
@Environment和@EnvironmentObject 的区别是，EnvironmentObject是修饰用户自定义的object，而Environment是修饰系统自带的设定（ SwiftUI 本身就有很多系统级别的设定，我们开一个通过 @Environment 来获取到它们）
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
@Published是SwiftUI最有用的包装之一，允许我们创建出能够被自动观察的对象属性，SwiftUI会自动监视这个属性，一旦发生了改变，会自动修改与该属性绑定的界面。

1.首先需要遵循ObservableObject属性
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
这样就完成了。@Published包装会自动添加willSet方法监视属性的改变。
详细参考：
1. https://blog.csdn.net/kmyhy/article/details/97176972
2. 英文原版：https://swiftwithmajid.com/2019/06/12/understanding-property-wrappers-in-swiftui/
3. https://www.cnblogs.com/xiaoniuzai/p/11417123.html
4. https://www.jianshu.com/p/28623e017445

## 关于如何定义一个可操作的数据ObservableObject
```
class UpdateStore : ObservableObject {
    @Published var updates: [Update] = updateData //定义一个updates初始值为updateData
}
```
其中`: [Update]`是可以省略的，因为已经直接赋值了，不需要在一定一遍数据类型


# Wartime preparation
## Xcode添加不同的预览视角
默认1个预览视角，想要2个以上用Group重复即可；用environment可配置dark模式或字体大小预览
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
同时在SE、XS、iPad上预览
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
## 滚动视图
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
见：ObservedObject （被观测的对象）

## 导航列表NavigationView-NavigationLink通用组件
苹果提供NavigationView-NavigationLink框架让列表及列表相关操作变得简单
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
## Settings列表小控件
Settings列表用到了导航列表NavigationView框架，以表格Form作为载体，用到的小控件有开关Toggle、步进Stepper、选择器Picker、日期选择器DatePicker、文本输入TextField、警报 Alert
* `SecureField ` 一般作为密码输入时使用，使用方式与 `TextField` 并无差别，示例与运行效果同上 `TextField`。
* 比如Settings这种列表总数量固定的用Form，涉及添加或删除选项的用List
* 各个小控件都用了@State修饰的数据，使用$符号是因为需要向小控件传递数据
* TextField用到了Section作为载体，Section相当于一个集合，目的是与上下文区分，见下图
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
另一种形式的Picker使用（常用）
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

## ForEach历询
* 在Xcode中按住`cmd`+指定View或元素，调出选择框，选择repeat，即可添加ForEach语法
![foreach](https://github.com/gaozichen2012/Swift-notes/blob/master/img/8-ForEach.jpg?raw=true)

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
![Button-sheet实例1](https://github.com/gaozichen2012/Swift-notes/blob/master/img/7-Button-sheet1.jpg?raw=true)

## 模糊视图BlurView和Dark模式
SwiftUI中暂时无模糊视图的方法，所以使用Uikit做了一个模糊的方法在`BlurView.swift`文件中，不需细研究，直接调用即可
* Dark模式和BlurView放在一起讲，是因为dark模式中大量用到模糊视角，有一些设置是重复的
* 模糊视图BlurView的背景选为系统材料systemMaterial，为了用于兼容dark 
* 设置背景色为自适应白天和dark模式，那么前景色foregroundColor也需要自适应：如primary
```
 BlurView(style: .systemMaterial)//作为一个View呈现
 .background(BlurView(style: .systemMaterial))//作为View的修饰语呈现
 .background(BlurView(style: .systemThinMaterial))//systemThinMaterial是加厚渲染，比如一些按钮或处于顶部的视图需要做强对比
 .foregroundColor(.primary)//primary对白天模式是黑色，对于dark模式为白色
 .foregroundColor(.clear)//与primary相反
```
![BlurView](https://github.com/gaozichen2012/Swift-notes/blob/master/img/10-BlurView.jpg?raw=true)

## TabBar（底部栏）
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

## 使用模拟器或手机调试
* 使用模拟器调试点击RUN即可模拟器调试，见下图
* 使用手机调试，需要先将手机连写mac，在Xcode中选中手机设备，再点RUN
![使用模拟器调试](https://raw.githubusercontent.com/gaozichen2012/Swift-notes/master/img/12-%E4%BD%BF%E7%94%A8%E6%A8%A1%E6%8B%9F%E5%99%A8%E8%B0%83%E8%AF%95.jpg?raw=true)
## 设置APP默认界面
在`SceneDelegate.swift`文件中修改`UIHostingController()`中的视图设置为进入app默认显示的界面
![设置APP默认界面](https://github.com/gaozichen2012/Swift-notes/blob/master/img/13-%E8%AE%BE%E7%BD%AEAPP%E9%BB%98%E8%AE%A4%E7%95%8C%E9%9D%A2.jpg?raw=true)

## Swift注释支持markdown语法（待测试）
![MARK-TODO](https://github.com/gaozichen2012/Swift-notes/blob/master/img/14-%E6%B3%A8%E9%87%8A.jpg?raw=true)
```
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
```
## 创建自定义代码段（code snippets）
![自定义代码段](https://github.com/gaozichen2012/Swift-notes/blob/master/img/15-%E8%87%AA%E5%AE%9A%E4%B9%89%E4%BB%A3%E7%A0%81%E6%AE%B5.jpg?raw=true)
https://help.apple.com/xcode/mac/current/#/dev2b24f6f93

## Codable和JSON数据格式
* JSON（JavaScript Object Notation，JavaScript对象表示法），是一种轻量级的数据交换语言，该语言以易于让人阅读的文字为基础，用来传输由属性值或者序列性的值组成的数据对象。尽管JSON是JavaScript的一个子集，但JSON是独立于语言的文本格式，并且采用了类似于C语言家族的一些习惯。
* Codable 是 Swift 4.0 以后推出的一个编解码协议，可以配合 JSONDecoder 和 JSONEncoder 用来进行 JSON 解码和编码。
* JSONDecoder Apple 官方推出的基于 Codable 的 JSON 解析类
* Codable提供了简洁的API，使Swift的编码与解析焕然一新。
* Swift的Enum，Struct和Class都支持Codable

### 对JSON数据的解析使用分析《SwiftUI教程中第三节》
1.定义了一个`landmarkData.json`json数据，里面存放了用户数据
2.在`Data.swift`中定义了函数方法`load`,对json数据进行了解析：`load("landmarkData.json")`,`load`方法内用到了`JSONDecoder()`和`.decode(T.self, from: data)`对json数据进行解码，解码后的数据以`Landmark`格式存在`landmarkData`
3.在后续调用函数中声明`var landmark : Landmark`，再在预览视图中传入数据：`LandmarkRow(landmark: landmarkData[0])`

菜鸟JSON教程：https://www.runoob.com/json/json-tutorial.html

## List/Form/Group的区别
* Form仅用于Picker、toggle这一类数据输入的控件
* group仅在PreviewProvider预览多个视图时使用
* 其他的列表都用List（涉及添加或删除选项的也用List）

## 添加动画
给视图添加动画直接使用.animation()和其他一些修饰词即可；要给状态的改变添加动画必须用withAnimation()
* 比如点击一个按钮跳出一个界面，按钮的动画用.animation()，跳出的界面用withAnimation()
```
Button(action: {
    withAnimation {
        self.showDetail.toggle()
        }
    }) {
            Image(systemName: "chevron.right.circle")
            .imageScale(.large)
            .rotationEffect(.degrees(showDetail ? 90 : 0))
            .scaleEffect(showDetail ? 1.5 : 1)
            .padding()
            .animation(.default)
        }
```
## animation常用动画效果
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

## class声明为final的作用
final修饰类 不能被继承，也没有子类。
【使用环境】：
1.不是专门为继承而设计的类，类的本身方法之间有复杂的调用关系。假如随意创建这些类的子类，子类可能会错误的修改父类的实现细节
2.出于安全原因，类的实现细节不允许有任何改动
3.在创建对象模型的时候，确信这个类不会再被扩展

## swift package dependencies
https://www.cnblogs.com/feng9exe/p/10485087.html
Swift Package Manager（swift包管理器，简称：SPM）就是在swift开发中用来替代CocoaPod的；在swift开发中，SPM完全可以替代CocoaPod的功能，并且速度更快，体验更佳；
## Lottie-iOS
Airbnb开源的Lottie，可以让开发者免去写一行一行的代码而非常容易地渲染动画。你可以直接把 Adobe After Effects的动画用在你的Xcode 项目中。并且Android、macOS、React Native都可使用。

什么是Lottie呢？
由Airbnb开发的[Lottie](https://github.com/airbnb/lottie-ios)是一个将After Effects动画提供给任意一个iOS，macOS，Android还有React Native原生APP的文件库。这些动画通过一个叫[Bodymovin](https://github.com/bodymovin/bodymovin)的开源After Effects插件，以JSON文件的形式进行输出。Lottie通过JSON格式下载动画数据并实时提供给开发者。

Lottie现在不仅在GitHub上已经开源，而且还提供一个示例项目和一系列的示例动画

## extension（扩展）

# APP : SFSymbols
# APP : Example To-Do App
# APP : WWDCPlayer

# 学习点：
* 通过苹果SwiftUI教程第三节的Section 4：了解此节使用ObservableObject的方式与bilibili教程的区别异同（重要）
* 通过苹果SwiftUI教程第三节的Section 6: 了解父子视图的ObservableObject类型数据传递（重要）
* 苹果SwiftUI教程第5节3.2使用extension自定义一个静态静态属性并使用（了解此用法，目的是为了保持代码清洁可读）对比4.2的用法
* 6.2.1了解Dictionary 结构的作用，和使用场合
* 6.4.3 .listRowInsets(EdgeInsets())将内容就可以展开到显示的边缘。
* 6.5.2 通过应用 renderingMode(_:) 和 color(_:) 修饰符改变分类项的导航外观。
* 7.4 使用 onAppear(perform:) 和 onDisappear(perform:),延迟编辑的传递,使编辑在用户退出编辑模式之后才生效，我们需要在编辑期间使用信息的草稿副本，然后仅在用户确认编辑时将草稿副本分配给真实副本。
* SwiftUI官方教程涉及swift语法过多，先大概过一遍功能和模块，再针对性研究swift语法，再回头一遍一遍过SwiftUI官方教程
* UIKit和SwiftUI联合开发未研究，暂不研究，只需看懂苹果官方教程的实例即可
* swift语法中的属性后面一些内容待整理：https://swiftgg.gitbook.io/swift/swift-jiao-cheng/10_properties
* 研究github上的例子app：https://github.com/gaozichen2012/SwiftUI
* 当觉得无项目或者无目标时到github搜SwiftUI，找一些好项目学习
* 学习账号系统的搭建
* 学习播放音乐所需要的组件（VedioCtroller）
* 关注MengTo的SwiftUI教程

# 近期学习计划
* 在example APP中添加数据储存，在app里修改，下次打开依旧有数据
* 在example APP中添加小控件
* 在example APP中添加滚动视图（水平滚动和垂直滚动）
* 在example APP中添加Button-sheet组合，实现点击按钮跳出指定View
* 在example APP中添加导航列表NavigationView-NavigationLink通用组件
* 在example APP中添加animation常用动画效果

iOS接入 Lottie 动画过程详解（使用lottie）：http://www.cocoachina.com/articles/23324
SwiftUI 和 Flutter开发对比：http://www.cocoachina.com/cms/wap.php?action=article&id=87003
