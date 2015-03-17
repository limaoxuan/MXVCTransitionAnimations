//
//  CircleTransitionAnimator.swift
//  MXVCTransitionAnimations
//
//  Created by 李茂轩 on 15/3/13.
//  Copyright (c) 2015年 limaoxuan. All rights reserved.
//

import UIKit
import Foundation

class CircleTransitionAnimator: NSObject , UIViewControllerAnimatedTransitioning{

    weak var transitionContext: UIViewControllerContextTransitioning?
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        return 0.5
    }
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        
        //1
        self.transitionContext = transitionContext
        
        //2
        var containerView = transitionContext.containerView()
        var fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!
        var toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
        var button = fromViewController.view.viewWithTag(1) as UIButton
        
        //3
        containerView.addSubview(toViewController.view)
        
        //4
        var circleMaskPathInitial = UIBezierPath(ovalInRect: button.frame)
        
//        print("\(button.center.x)  : \(button.center.y)")
        var extremePoint = CGPoint(x: button.center.x - 0, y: button.center.y - CGRectGetHeight(toViewController.view.bounds))
        
        print("\(extremePoint.x) + \(extremePoint.y)")
        
        
        
        var radius = sqrt((extremePoint.x * extremePoint.x) + (extremePoint.y*extremePoint.y))
        
        
        
        var circleMaskPathFinal =        UIBezierPath(ovalInRect:  CGRectInset(button.frame, -radius, -radius))
        
        //5
        var maskLayer = CAShapeLayer()
        maskLayer.path = circleMaskPathFinal.CGPath
//        maskLayer.backgroundColor = UIColor.redColor().CGColor
        
//        toViewController.view.layer.addSublayer(maskLayer)
        toViewController.view.layer.mask = maskLayer
//        5
//        6
        var maskLayerAnimation = CABasicAnimation(keyPath: "path")
        maskLayerAnimation.fromValue = circleMaskPathInitial.CGPath
        maskLayerAnimation.toValue = circleMaskPathFinal.CGPath
        maskLayerAnimation.duration = self.transitionDuration(transitionContext)
        maskLayerAnimation.delegate = self
        maskLayer.addAnimation(maskLayerAnimation, forKey: "path")
        
        
    }
    override func animationDidStop(anim: CAAnimation!, finished flag: Bool) {
        self.transitionContext?.completeTransition(!self.transitionContext!.transitionWasCancelled())
        self.transitionContext?.viewControllerForKey(UITransitionContextFromViewControllerKey)?.view.layer.mask = nil
        
    }
    
}
