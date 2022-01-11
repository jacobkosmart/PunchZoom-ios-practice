# 🔎 PunchZoom-ios-practice

<!-- ! gif 스크린샷 -->

<img width="300" alt="스크린샷" src="https://user-images.githubusercontent.com/28912774/148862322-e16fa78c-301f-4d80-922b-eab9470f4524.gif">

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

![image](https://user-images.githubusercontent.com/28912774/148867512-fb08ca56-b50f-415d-943f-484ca141a0ee.png)

### 🔷 Model

```swift
//  PageModel.swift

import Foundation

// Swift Protocol : A protocol defines a blueprint of methods, properties, and
// other requirements that suit a particular task or piece of functionality
struct Page: Identifiable {
	let id: Int // ID: Specifying the identified Item
	let imageName: String
}

extension Page {
	var thumbnailName: String {
		// Concatenating Strings: String values can be added together (or concatenated)
		// with the addition operator (+)
		return "thumb-" + imageName
	}
}

```

#### 👉 [1.Double Tap Gesture](https://github.com/jacobkosmart/PunchZoom-ios-practice/blob/main/MD/1.DoubleTab.md)

#### 👉 [2.Drag Gesture](https://github.com/jacobkosmart/PunchZoom-ios-practice/blob/main/MD/2.DragGesture.md)

#### 👉 [3.Long Press Gesture](https://github.com/jacobkosmart/PunchZoom-ios-practice/blob/main/MD/3.LongPressGesture.md)

#### 👉 [4.Control Interface](https://github.com/jacobkosmart/PunchZoom-ios-practice/blob/main/MD/4.ControlInterface.md)

#### 👉 [5.Magnification Gesture](https://github.com/jacobkosmart/PunchZoom-ios-practice/blob/main/MD/5.MagnificationGesture.md)

#### 👉 [6.User Interface](https://github.com/jacobkosmart/PunchZoom-ios-practice/blob/main/MD/6.DrawerUI.md)

#### 👉 [7.Page Thumbnails](https://github.com/jacobkosmart/PunchZoom-ios-practice/blob/main/MD/7.PageThumbnails.md)

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

How to use gestures in SwiftUI - [https://www.hackingwithswift.com/books/ios-swiftui/how-to-use-gestures-in-swiftui](https://www.hackingwithswift.com/books/ios-swiftui/how-to-use-gestures-in-swiftui)

Udemy SwiftUI Masterclass 2022 - [https://www.udemy.com/course/swiftui-masterclass-course-ios-development-with-swift/](https://www.udemy.com/course/swiftui-masterclass-course-ios-development-with-swift/)
