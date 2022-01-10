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

### 🔷 Magnification Gesture

- User 가 손가락 2개로 길에 늘리면 화면이 확대되는 기능을 구현합니다

```swift
// MARK: -  3. MAGNIFICATION
.gesture(
MagnificationGesture()
// 확대 되는 gesture 조건 설정
.onChanged { value in
withAnimation(.linear(duration: 1)) {
  if imageScale >= 1 && imageScale <= 5 {
    imageScale = value
  } else if imageScale > 5 {
    imageScale = 5
  }
}
}
.onEnded { _ in
if imageScale < 5 {
  imageScale = 5
} else if imageScale  <= 1 {
  resetImageState()
}
}
)
```

<img width="300" alt="스크린샷" src="https://user-images.githubusercontent.com/28912774/148847496-032fbd87-4440-43ff-9862-a6f1d761a5f2.gif">

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
