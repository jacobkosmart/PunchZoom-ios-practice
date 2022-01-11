//
//  PageModel.swift
//  PinchZoom-App
//
//  Created by Jacob Ko on 2022/01/11.
//

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
