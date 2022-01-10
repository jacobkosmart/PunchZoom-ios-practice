//
//  ControlImageView.swift
//  PinchZoom-App
//
//  Created by Jacob Ko on 2022/01/10.
//

import SwiftUI

struct ControlImageView: View {
	// MARK: -  PROPERTY
	let icon: String
	
	// MARK: -  FUNCTION
	
	
	// MARK: -  CONTENT
	var body: some View {
		Image(systemName: icon)
			.font(.system(size: 36))
	}
}

// MARK: -  PREVIEW
struct ControlImageView_Previews: PreviewProvider {
	static var previews: some View {
		ControlImageView(icon: "minus.magnifyingglass")
			.preferredColorScheme(.dark)
			.previewLayout(.sizeThatFits)
			.padding()
	}
}

