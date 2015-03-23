//
//  ImageViewCollectionViewCell.swift
//  MXVCTransitionAnimations
//
//  Created by 李茂轩 on 15/3/19.
//  Copyright (c) 2015年 limaoxuan. All rights reserved.
//

import UIKit

//protocol ImageViewCollectionViewButtonDelegate {
//
//
//    func clickEventWithImage(image:UIImage)
//    
//
//}

class ImageViewCollectionViewCell: UICollectionViewCell {

//    @IBOutlet var clickButton: UIButton!
    
    @IBOutlet var imageView: UIImageView!
//     var delegate : ImageViewCollectionViewButtonDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        
       imageView.contentMode = UIViewContentMode.ScaleAspectFit

    }

    @IBAction func clickEvent(sender: AnyObject) {
        
//        getAppdelegate().selectTag = sender.tag
//        delegate?.clickEventWithImage(clickButton.imageView!.image!)
        
//        let childImageView = ImagechildrenViewController()
        
        
        
    }

}
