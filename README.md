# 🔎 PunchZoom-ios-practice

<!-- ! gif 스크린샷 -->

<img width="300" alt="스크린샷" src="">

## 📌 기능 상세

- SwiftUI Gestures : long-press, double-tap, drag gesture and magnification

- SwiftUI Materials : Apply blur effect plus vibrancy to a view that appears behind another view by adding a material with tha background

<!-- ## 👉 Pod library -->

<!-- ### 🔷  -->

<!-- >  -->

<!-- #### 설치

`pod init`

```ruby

```

`pod install`
 -->

<!-- ## 📌 Project Setup -->

## 🔑 Check Point !

### 🔷 UI Structure

<!-- ! ppt UI structure -->

![image]()

<!--
### 🔷 Model

```swift

``` -->

### 🔷 Long Press Gesture

#### 👉 SF Symbol

- Apple 에서 기본으로 제공해주는 symbol package 입니다. 4가지의 rendering mode 를 지원해줘서 각 테마에 맞게 색 과 어울리게 rendering 을 적용해서 적절하게 모양을 변경 할 수 있습니다

![image](https://user-images.githubusercontent.com/28912774/148719889-21e9ccb2-8eb4-41ee-8627-7acff976def8.png)

#### 👉 InfoPanelView UI

- 커서의 위치 offset 의 위치를 숫자로 보여주는 viewComponent 를 먼저 만들어 주고 onPressGesture 를 누를 경우에 보여지고, 안보여 지는 기능을 만듬

```swift
struct InfoPanelView: View {
// MARK: -  PROPERTY
var scale: CGFloat
var offset: CGSize

@State private var isInfoPanelVisible: Bool = false

// MARK: -  CONTENT
var body: some View {
HStack {
// MARK: -  HOTSPOT
Image(systemName: "circle.circle")
  .symbolRenderingMode(.hierarchical)
  .resizable()
  .frame(width: 30, height: 30)
  .onLongPressGesture(minimumDuration: 1) {
    withAnimation(.easeOut) {
      isInfoPanelVisible.toggle()
    }
  }

Spacer()

// MARK: -  INFO PANEL
HStack (spacing: 2) {
  Image(systemName: "arrow.up.left.and.arrow.down.right")
  Text("\(scale)")

  Spacer()

  Image(systemName: "arrow.left.and.right")
  Text("\(offset.width)")

  Spacer()

  Image(systemName: "arrow.up.and.down")
  Text("\(offset.height)")

  Spacer()
}
.font(.footnote)
.padding(8)
.background(.ultraThinMaterial)
.cornerRadius(8)
.frame(maxWidth: 420)
.opacity(isInfoPanelVisible ? 1 : 0)

Spacer()
}
}
}

struct InfoPanelView_Previews: PreviewProvider {
static var previews: some View {
InfoPanelView(scale: 1, offset: .zero)
.preferredColorScheme(.dark)
.previewLayout(.sizeThatFits)
.padding()
}
}

```

![Kapture 2022-01-10 at 14 12 27](https://user-images.githubusercontent.com/28912774/148720862-68db3857-e735-4d41-9f92-c3c1b25f7d9f.gif)

#### 👉 ContentView 에 적용하기

```swift
// MARK: -  INFO PANEL
.overlay(
  InfoPanelView(scale: imageScale, offset: imageOffset)
    .padding(.horizontal)
    .padding(.top, 30)
  , alignment: .top
)

} //: NAVIGATION
.navigationViewStyle(.stack)
}
```

<img width="300" alt="스크린샷" src="https://user-images.githubusercontent.com/28912774/148721652-c0338055-efc4-408a-95fd-d44e1c4b6309.gif">

### 🔷 Control Interface

### 🔷 Magnification Gesture

### 🔷 User Interface

### 🔷 Page Thumbnails

#### 👉 [1.Double Tap Gesture]()

#### 👉 [2.Drag Gesture]()

#### 👉 [3.Long Press Gesture]()

#### 👉 [4.Control Interface]()

#### 👉 [5.Magnification Gesture]()

#### 👉 [6.User Interface]()

#### 👉 [7.Page Thumbnails]()

<!-- #### 👉 -->

<!-- > Describing check point in details in Jacob's DevLog - https://jacobko.info/firebaseios/ios-firebase-03/ -->

<!-- ## ❌ Error Check Point

### 🔶 -->

<!-- xcode Mark template -->

<!--
// MARK: IBOutlet
// MARK: LifeCycle
// MARK: Actions
// MARK: Methods
// MARK: Extensions
-->

<!-- <img width="300" alt="스크린샷" src=""> -->

<!-- README 한 줄에 여러 screenshoot 놓기 예제 -->
<!-- <p>
    <img alt="Clear Spaces demo" src="../assets/demo-clear-spaces.gif" height=400px>
    <img alt="QR code scanner demo" src="../assets/demo-qr-code.gif" height=400px>
    <img alt="Example preview demo" src="../assets/demo-example.gif" height=400px>
</p> -->

---

🔶 🔷 📌 🔑 👉

## 🗃 Reference

Udemy SwiftUI Masterclass 2022 - [https://www.udemy.com/course/swiftui-masterclass-course-ios-development-with-swift/](https://www.udemy.com/course/swiftui-masterclass-course-ios-development-with-swift/)
