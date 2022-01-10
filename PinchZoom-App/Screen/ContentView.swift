//
//  ContentView.swift
//  PinchZoom-App
//
//  Created by Jacob Ko on 2022/01/10.
//

import SwiftUI




struct ContentView: View {
	// MARK: -  PROPERTY
	@State private var isAnimating: Bool = false
	// DoubleTap Gesture proverty
	@State private var imageScale: CGFloat = 1
	// Drag Gesture state imageOffset
	@State private var imageOffset: CGSize = .zero
	
	// MARK: -  FUNCTION
	func resetImageState() {
		return withAnimation(.spring()) {
			imageScale = 1 // drag 가 끝나면 image 사이즈를 원상 복귀
			imageOffset = .zero // drag 가 끝나면 원래 위치로 원상 복구
		}
	}
	
	
	// MARK: -  CONTENT
	var body: some View {
		NavigationView {
			ZStack {
				Color.clear
				
				// MARK: -  Page Image
				Image("magazine-front-cover")
					.resizable()
					.aspectRatio(contentMode: .fit)
					.cornerRadius(10)
					.padding()
					.shadow(color: .black.opacity(0.2), radius: 12, x: 2, y: 2)
					.opacity(isAnimating ? 1 : 0)
					.offset(x: imageOffset.width, y: imageOffset.height)
				// Double Tap Gesture
					.scaleEffect(imageScale)
				// MARK: -  1. Tap Gestrue
					// count: Tap Count
					.onTapGesture(count: 2, perform: {
						if imageScale == 1 {
							withAnimation(.spring()) {
								imageScale = 5 // Scale-Up
							}
						} else {
							resetImageState() // Back to Default
							}
					})
				// MARK: -  2. DRAG GESTURE
					.gesture(
						DragGesture()
						// drage gesture 로 그림이 움직이게 함 .onChange
							.onChanged { value in
								withAnimation(.linear(duration: 1)) {
									imageOffset = value.translation
								}
							}
							.onEnded {_ in
								if imageScale <= 1 {
									resetImageState()
								}
							}
					)
			} //: ZSTACK
			.navigationTitle("Pinch & Zoom")
			.navigationBarTitleDisplayMode(.inline)
			.onAppear(perform: {
				withAnimation(.linear(duration: 1)) {
					isAnimating = true
				}
			})
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
}

// MARK: -  PREVIEW
struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
			.preferredColorScheme(.dark)
			.previewDevice("iPhone 13")
	}
}
