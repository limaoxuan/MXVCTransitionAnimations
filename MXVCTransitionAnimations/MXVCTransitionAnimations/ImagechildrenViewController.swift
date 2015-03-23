//
//  ImagechildrenViewController.swift
//  MXVCTransitionAnimations
//
//  Created by 李茂轩 on 15/3/19.
//  Copyright (c) 2015年 limaoxuan. All rights reserved.
//

import UIKit

class ImagechildrenViewController: UIViewController {

    
    
    var imageIndex : Int!
    var imageView : UIImageView!
    
    var image : UIImage!
    
    override func viewWillAppear(animated: Bool) {
        
        self.navigationController?.navigationBarHidden = false
    }
    
    override func viewWillDisappear(animated: Bool) {
        self.navigationController?.navigationBarHidden = true
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.view.backgroundColor = UIColor.whiteColor()
        imageView = UIImageView()
        imageView.setTranslatesAutoresizingMaskIntoConstraints(false)
        imageView.contentMode = UIViewContentMode.ScaleAspectFit
        imageView.image = image
        let imH = "H:[imageView(\(screenWidth/2.1))]"
        let imV = "V:|-80-[imageView(\(screenWidth/2.1*1.5))]"
        let viewDic = ["imageView":imageView]
        view.addSubview(imageView)
    setLocationAccrodingWithSuperViewAndCurrentViewSetLayoutAttributeCenterX(view, imageView, "\(screenWidth/2.1*1.5)")

        setConstraintsWithStringHandVWithCurrentView(imH, imV, view, viewDic)
        
        
        let backButton = UIBarButtonItem(title: "返回", style: UIBarButtonItemStyle.Bordered, target: self, action: "backEvent:")
        self.navigationItem.setLeftBarButtonItem(backButton, animated: false)
        
        

        // Do any additional setup after loading the view.
    }
    
    func backEvent(sender:AnyObject){
    
        
        transitionType(TransitionType.ImageTransitionOut)
        
    self.navigationController?.popViewControllerAnimated(true)
        
    
    
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
