//
//  SecondViewController.swift
//  MXVCTransitionAnimations
//
//  Created by 李茂轩 on 15/3/13.
//  Copyright (c) 2015年 limaoxuan. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet var button: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.layer.contents = UIImage(named: "background2")?.CGImage
        view.contentMode  = UIViewContentMode.ScaleAspectFill
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func circleTapped(sender: AnyObject) {
        
        
        self.navigationController?.popViewControllerAnimated(true)
    }
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}
