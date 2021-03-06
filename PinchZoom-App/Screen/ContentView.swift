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
	// Drawer Action State
	@State private var isDrawerOpen: Bool = false
	
	let pages:  [Page] = pagesData
	@State private var pageIndex: Int = 1
	
	// MARK: -  FUNCTION
	func resetImageState() {
		return withAnimation(.spring()) {
			imageScale = 1 // drag 가 끝나면 image 사이즈를 원상 복귀
			imageOffset = .zero // drag 가 끝나면 원래 위치로 원상 복구
		}
	}
	
	func currentPage() -> String {
		return pages[pageIndex - 1].imageName
	}
	
	// MARK: -  CONTENT
	var body: some View {
		NavigationView {
			ZStack {
				Color.clear
				
				// MARK: -  Page Image
				Image(currentPage())
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
			// MARK: -  CONTROLS
			.overlay(
				Group {
					HStack {
						// MARK: -  SCALE DOWN
						Button {
							withAnimation(.spring()) {
								// 1보다 imageScale 이 클때, 클릭시 iamgeScale 이 1씩 감소 : Main Action
								if imageScale > 1 {
									imageScale -= 1
									
									// Main Action 에서 1과 같거나 작을 경우에는 다시 reset 시킴: Safety Precaution
									if imageScale <= 1 {
										resetImageState()
									}
								}
							}
						} label: {
							ControlImageView(icon: "minus.magnifyingglass")
						}
						// MARK: -  RESET
						Button {
							// 누르면 바로 resetImage 가 되게 함
							resetImageState()
						} label: {
							ControlImageView(icon: "arrow.up.left.and.down.right.magnifyingglass")
						}
						
						// MARK: -  SCALE UP
						Button {
							withAnimation(.spring()) {
								// imageScale 5보다 작을 경우 1씩 증가: Main Action
								if imageScale < 5 {
									imageScale += 1
									
									// imageScale 이 5보다 커지면 더이상 커지지 안게 5로 고정 시킴 : Safety precaution
									if imageScale > 5 {
										imageScale = 5
									}
								}
							}
						} label: {
							ControlImageView(icon: "plus.magnifyingglass")
						}
					} //: CONTROLS
					.padding(EdgeInsets(top: 12, leading: 20, bottom: 12, trailing: 20))
					.background(.ultraThinMaterial)
					.cornerRadius(12)
					.opacity(isAnimating ? 1 : 0)
				}
					.padding(.bottom, 30)
				, alignment: .bottom
			)
			// MARK: -  DRAWER
			.overlay(
				HStack (spacing: 12) {
					// MARK: -  DRAWER HANDLE
					// UX 로 drawer 가 열리면 화살표 위치가 변경되게 함
					Image(systemName: isDrawerOpen ? "chevron.compact.right" : "chevron.compact.left")
						.resizable()
						.scaledToFit()
						.frame(height: 40)
						.padding(8)
						.foregroundColor(.secondary)
					// Drawer Function
						.onTapGesture(perform: {
							withAnimation(.easeOut) {
								isDrawerOpen.toggle()
							}
						})
					
					// MARK: -  THUMBNAILS
					ForEach(pages) { item in
						Image(item.thumbnailName)
							.resizable()
							.scaledToFit()
							.frame(width: 80)
							.cornerRadius(8)
							.shadow(radius: 4)
							.opacity(isDrawerOpen ? 1 : 0)
							.animation(.easeOut(duration: 0.5), value: isDrawerOpen)
							.onTapGesture(perform: {
								isAnimating = true
								pageIndex = item.id
							})
					}
					Spacer()
				} //: DRAWER
					.padding(EdgeInsets(top: 16, leading: 8, bottom: 16, trailing: 8))
					.background(.ultraThinMaterial)
					.cornerRadius(12)
					.opacity(isAnimating ? 1 : 0)
					.frame(width: 260)
				// Screen Height: UIScreen 을 사용함으로써 depending on the devices's screen size
					.padding(.top, UIScreen.main.bounds.height / 12)
					.offset(x: isDrawerOpen ? 20 : 215)
				, alignment: .topTrailing
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
