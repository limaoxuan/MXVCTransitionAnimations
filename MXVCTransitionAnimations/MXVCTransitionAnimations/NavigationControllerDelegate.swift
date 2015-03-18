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
    @IBOutlet weak var navigationController: UINavigationController?
    var interactionController : UIPercentDrivenInteractiveTransition?
    
    
    func navigationController(navigationController: UINavigationController, animationControllerForOperation operation: UINavigationControllerOperation, fromViewController fromVC: UIViewController, toViewController toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {

        
        return getAppdelegate().transition
    }
    
//    override func awakeFromNib() {
//        var panGesture = UIPanGestureRecognizer(target: self, action: Selector("panned:"))
//        self.navigationController!.view.addGestureRecognizer(panGesture)
//    }
//    
//   func panned(gestureRecognizer: UIPanGestureRecognizer) {
//    
//    print(gestureRecognizer.state.hashValue)
//    
//        switch gestureRecognizer.state {
//        case .Began:
//            self.interactionController = UIPercentDrivenInteractiveTransition()
//            if self.navigationController?.viewControllers.count > 1 {
//                self.navigationController?.popViewControllerAnimated(true)
//            } else {
//                self.navigationController?.topViewController.performSegueWithIdentifier("PushSegue", sender: nil)
//            }
//            
//            //2
//        case .Changed:
//            var translation = gestureRecognizer.translationInView(self.navigationController!.view)
//            var completionProgress = translation.x/CGRectGetWidth(self.navigationController!.view.bounds)
//            self.interactionController?.updateInteractiveTransition(completionProgress)
//            
//            //3
//        case .Ended:
//            if (gestureRecognizer.velocityInView(self.navigationController!.view).x > 0) {
//                self.interactionController?.finishInteractiveTransition()
//            } else {
//                self.interactionController?.cancelInteractiveTransition()
//            }
//            self.interactionController = nil
//            
//            //4
//        default:
//            self.interactionController?.cancelInteractiveTransition()
//            self.interactionController = nil
//        }
//        
//        
//        
//        
//    }
//
//    func navigationController(navigationController: UINavigationController, interactionControllerForAnimationController animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
//        return self.interactionController
//    }
}


