//
//  CircleTransitionAnimator.swift
//  MXVCTransitionAnimations
//
//  Created by 李茂轩 on 15/3/13.
//  Copyright (c) 2015年 limaoxuan. All rights reserved.
//

import UIKit
import Foundation

public enum CircleTransitionType{
    
    case ZoomIn //
    case ZoomOut
    
    
}


class CircleTransitionAnimator: NSObject , UIViewControllerAnimatedTransitioning{

    var duration : NSTimeInterval = 0.5
    var circleType : CircleTransitionType!
 
    convenience init(duration:NSTimeInterval,circleType:CircleTransitionType) {
        
    self.init()
    self.duration = duration
    self.circleType = circleType
        
    }

    
    weak var transitionContext: UIViewControllerContextTransitioning?
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        return duration
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
        
        
        
        
        switch circleType! {
        
        
        case .ZoomIn:
            containerView.addSubview(fromViewController.view)
            containerView.addSubview(toViewController.view)
            zoomInAniamtion(button, toViewController: toViewController)
        
        case .ZoomOut:
             containerView.addSubview(toViewController.view)
             containerView.addSubview(fromViewController.view)
           

        zoomOutAniamtion(button, fromViewController: fromViewController)
        
        default:
            print("")
        }
        
        //4
        
        
    }
    
    func zoomOutAniamtion(button:UIButton,fromViewController:UIViewController){

        
        
        print(button.frame)
        
//        path mask 看的到的一个点 而不是看不到的～！
        var circleMaskPathFinal = UIBezierPath(ovalInRect:button.frame)
        
        var extremePoint = CGPoint(x: button.center.x - 0, y: button.center.y - CGRectGetHeight(fromViewController.view.bounds))

        var radius = sqrt((extremePoint.x * extremePoint.x) + (extremePoint.y*extremePoint.y))

        
        
        var circleMaskPathInitial = UIBezierPath(ovalInRect:  CGRectInset(button.frame, -radius, -radius))
        
        var maskLayer = CAShapeLayer()
        
        
        var maskLayerAnimation = CABasicAnimation(keyPath: "path")
    
        
        maskLayer.path = circleMaskPathInitial.CGPath
        fromViewController.view.layer.mask = maskLayer
        
        
        maskLayerAnimation.fromValue =  circleMaskPathInitial.CGPath
        maskLayerAnimation.toValue =   circleMaskPathFinal.CGPath
        
        
        
        
        
        
       
        maskLayerAnimation.duration = self.transitionDuration(transitionContext!)
        maskLayerAnimation.delegate = self
        maskLayer.addAnimation(maskLayerAnimation, forKey: "path")
        
    }
    
    
    func zoomInAniamtion(button:UIButton,toViewController:UIViewController){
    
    
        //        path mask 看的到的一个点 而不是看不到的～！ 

        var circleMaskPathInitial = UIBezierPath(ovalInRect: button.frame)
        
        //        print("\(button.center.x)  : \(button.center.y)")
        var extremePoint = CGPoint(x: button.center.x - 0, y: button.center.y - CGRectGetHeight(toViewController.view.bounds))
        
        print("\(extremePoint.x) + \(extremePoint.y)")
        
        
        
        var radius = sqrt((extremePoint.x * extremePoint.x) + (extremePoint.y*extremePoint.y))
        
        
        
        var circleMaskPathFinal = UIBezierPath(ovalInRect:  CGRectInset(button.frame, -radius, -radius))
        
        //5
        var maskLayer = CAShapeLayer()
        
        
        var maskLayerAnimation = CABasicAnimation(keyPath: "path")
                           // 放大
    
            maskLayer.path = circleMaskPathFinal.CGPath
            maskLayerAnimation.fromValue =  circleMaskPathInitial.CGPath
            maskLayerAnimation.toValue = circleMaskPathFinal.CGPath
            
            
            
        
        
        
        toViewController.view.layer.mask = maskLayer
        maskLayerAnimation.duration = self.transitionDuration(transitionContext!)
        maskLayerAnimation.delegate = self
        maskLayer.addAnimation(maskLayerAnimation, forKey: nil)

    
    
    }
    
    
    override func animationDidStop(anim: CAAnimation!, finished flag: Bool) {
        self.transitionContext?.completeTransition(!self.transitionContext!.transitionWasCancelled())
        self.transitionContext?.viewControllerForKey(UITransitionContextFromViewControllerKey)?.view.layer.mask = nil
       self.transitionContext?.viewControllerForKey(UITransitionContextToViewControllerKey)?.view.layer.mask = nil
        
        
        // require
        getAppdelegate().transition = nil
    }
    
}
