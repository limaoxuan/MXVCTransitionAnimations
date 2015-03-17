//
//  NavigationControllerDelegate.swift
//  MXVCTransitionAnimations
//
//  Created by 李茂轩 on 15/3/13.
//  Copyright (c) 2015年 limaoxuan. All rights reserved.
//

import Foundation
import UIKit

class NavigationControllerDelegate: NSObject,UINavigationControllerDelegate {

    func navigationController(navigationController: UINavigationController, animationControllerForOperation operation: UINavigationControllerOperation, fromViewController fromVC: UIViewController, toViewController toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        print(operation)
        
        return CircleTransitionAnimator()
    }
    
}


