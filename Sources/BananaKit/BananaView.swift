//
//  BananaView.swift
//  🐟🐠🐡   🐟🐠🐡   🐟🐠🐡   🐟🐠🐡   🐟🐠🐡   🐟🐠🐡   🐟🐠🐡   🐟🐠🐡   🐟🐠🐡
//
//  Created by Romain on 01/04/2020
//  Copyright © 2020 Romain. All rights reserved.
//

import UIKit
import SwiftUI
import QuickLook
import ARKit


public struct BananaView : UIViewControllerRepresentable {
	
	public init() {}
	
	public func makeUIViewController(context: UIViewControllerRepresentableContext<BananaView>) -> QLPreviewController {
		let controller =  QLPreviewController()
		controller.dataSource = context.coordinator
		controller.delegate = context.coordinator
		return controller
	}
	public func updateUIViewController(_ uiViewController: QLPreviewController, context: UIViewControllerRepresentableContext<BananaView>) {
	}
	
	public func makeCoordinator() -> Coordinator {
		Coordinator(self)
	}
	
	public class Coordinator: NSObject,  QLPreviewControllerDelegate, QLPreviewControllerDataSource {
		
		public let arView : BananaView
		public init(_ arView : BananaView) {
			self.arView = arView
		}
		
		public func numberOfPreviewItems(in controller: QLPreviewController) -> Int { return 1 }
		
		public func previewController(_ controller: QLPreviewController, previewItemAt index: Int) -> QLPreviewItem {

			let path = "https://firebasestorage.googleapis.com/v0/b/motiv8-6ba4b.appspot.com/o/banana.usdz?alt=media&token=5f21dd19-8000-4e9b-ac88-1323f8ada16c"
			
			let banana = URL(fileURLWithPath: path)
			
			let item = ARQuickLookPreviewItem(fileAt: banana)
			return item
		}
	}
}
