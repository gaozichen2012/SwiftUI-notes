参考资料：
https://www.jianshu.com/p/28623e017445
# 临时文件


## 关于ObservedObject的补充说明


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

## 关于如何定义一个可操作的数据ObservableObject
```
class UpdateStore : ObservableObject {
    @Published var updates: [Update] = updateData //定义一个updates初始值为updateData
}

```
其中`: [Update]`是可以省略的，因为已经直接赋值了，不需要在一定一遍数据类型

## swift package dependencies
https://www.cnblogs.com/feng9exe/p/10485087.html
Swift Package Manager（swift包管理器，简称：SPM）就是在swift开发中用来替代CocoaPod的；在swift开发中，SPM完全可以替代CocoaPod的功能，并且速度更快，体验更佳；
## Lottie-iOS
Airbnb开源的Lottie，可以让开发者免去写一行一行的代码而非常容易地渲染动画。你可以直接把 Adobe After Effects的动画用在你的Xcode 项目中。并且Android、macOS、React Native都可使用。

什么是Lottie呢？
由Airbnb开发的[Lottie](https://github.com/airbnb/lottie-ios)是一个将After Effects动画提供给任意一个iOS，macOS，Android还有React Native原生APP的文件库。这些动画通过一个叫[Bodymovin](https://github.com/bodymovin/bodymovin)的开源After Effects插件，以JSON文件的形式进行输出。Lottie通过JSON格式下载动画数据并实时提供给开发者。

Lottie现在不仅在GitHub上已经开源，而且还提供一个示例项目和一系列的示例动画