参考资料：
https://www.jianshu.com/p/28623e017445
# 临时文件
* 可以自定义包装，但没必要。SwiftUI提供的已经够用了。
* @State包装的属性通常是设置成私有的，不让外部使用。如果想让外部使用，则应该使用@ObservedObject和@EnvironmentObject，他们能够使外部修改属性后，状态能够得到改变。建议把@State包装的属性都设置成私有：`@State private var username = ""`

## @Published
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
## 关于ObservedObject的补充说明
@ObservedObject告诉SwiftUI，这个对象是可以被观察的，里面含有被@Published包装了的属性。
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
@ObservedObject包装的对象，必须遵循ObservableObject协议。也就是说必须是class对象，不能是struct。

@ObservedObject允许外部进行访问和修改。

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
## class声明为final的作用
final修饰类 不能被继承，也没有子类。
【使用环境】：
1.不是专门为继承而设计的类，类的本身方法之间有复杂的调用关系。假如随意创建这些类的子类，子类可能会错误的修改父类的实现细节
2.出于安全原因，类的实现细节不允许有任何改动
3.在创建对象模型的时候，确信这个类不会再被扩展