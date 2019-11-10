//
//  MainController.swift
//  Facebook
//
//  Created by Тимур Чеберда on 10.11.2019.
//  Copyright © 2019 Тимур Чеберда. All rights reserved.
//

import UIKit
import LBTATools

class PostCell: LBTAListCell<String> {
    
    let imageView = UIImageView(backgroundColor: .red)
    let nameLabel = UILabel(text: "Name Label")
    let dateLabel = UILabel(text: "Friday at 11:11 AM")
    let postTextLabel = UILabel(text: "Here is my post text")
//    let imageViewGrid = UIView(backgroundColor: .yellow)
    
    let photosGridController = PhotosGridController()
    
    override func setupViews() {
        backgroundColor = .white
        
        stack(
            hstack(
                imageView
                    .withHeight(40)
                    .withWidth(40),
                stack(nameLabel, dateLabel),
                spacing: 8
                )
                .padLeft(12)
                .padRight(12)
                .padTop(12),
            postTextLabel,
            photosGridController.view,
            spacing: 8
        )
    }
}

class MainController: LBTAListController<PostCell, String>, UICollectionViewDelegateFlowLayout {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .init(white: 0.9, alpha: 1)
        
        self.items = ["hello", "WORLD", "1", "2"]
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return .init(width: view.frame.width, height: 250)
    }
}

import SwiftUI

struct MainPreview: PreviewProvider {
    static var previews: some View {
        ContrinerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContrinerView: UIViewControllerRepresentable {
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<MainPreview.ContrinerView>) -> UIViewController {
            return MainController()
        }
        
        func updateUIViewController(_ uiViewController: MainPreview.ContrinerView.UIViewControllerType, context: UIViewControllerRepresentableContext<MainPreview.ContrinerView>) {
            
        }
    }
}
