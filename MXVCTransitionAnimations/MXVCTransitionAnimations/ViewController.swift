//
//  ViewController.swift
//  MXVCTransitionAnimations
//
//  Created by 李茂轩 on 15/3/13.
//  Copyright (c) 2015年 limaoxuan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    @IBAction func backEvent(sender: AnyObject) {
        
        transitionType( TransitionType.MaskLayerZoomOut)
        
        self.navigationController?.popViewControllerAnimated(true)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.layer.contents = UIImage(named: "background1")?.CGImage
        view.contentMode  = UIViewContentMode.ScaleAspectFill
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

