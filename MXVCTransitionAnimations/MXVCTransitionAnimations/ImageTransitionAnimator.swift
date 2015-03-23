//
//  ImageTransitionAnimator.swift
//  MXVCTransitionAnimations
//
//  Created by 李茂轩 on 15/3/18.
//  Copyright (c) 2015年 limaoxuan. All rights reserved.
//

import UIkit

public enum ImageTransitionType{
    
    case TransitionIn //
    case TransitionOut
    
    
}

class ImageTransitionAnimator: NSObject,UIViewControllerAnimatedTransitioning {

    
    var duration : NSTimeInterval!
    var imageTransitionType : ImageTransitionType!
    
    weak var transitionContext: UIViewControllerContextTransitioning?
    
    convenience init(duration:NSTimeInterval,transitionType:ImageTransitionType) {
        self.init()
        self.duration = duration
        self.imageTransitionType = transitionType
    }
    
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        return duration
    }
    
    
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        
        
        self.transitionContext = transitionContext
        
        var containerView = transitionContext.containerView()
        
        
        
        
        switch imageTransitionType! {
        
        case .TransitionIn:

            print("")


            //############################################################
            
            var fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)! as ImageViewController
            
            var toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey) as ImagechildrenViewController
            
            
            
            let indexpath =  fromViewController.collectionView.indexPathsForSelectedItems().first as NSIndexPath
            
            let cell = fromViewController.collectionView.cellForItemAtIndexPath(indexpath) as ImageViewCollectionViewCell
            
            let imageView = cell.imageView
            
            
            let imageSnapshot = imageView.snapshotViewAfterScreenUpdates(false)
            
            imageSnapshot.frame = containerView.convertRect(imageView.frame, fromView: imageView.superview)
            
            
            
            imageView.hidden = true
            
            toViewController.view.frame = transitionContext.finalFrameForViewController(toViewController)
            toViewController.view.alpha = 0
            toViewController.imageView.hidden = true
            
            containerView.addSubview(toViewController.view)
            containerView.addSubview(imageSnapshot)
            
            
            toViewController.imageView.layoutIfNeeded()
            
            UIView.animateWithDuration(self.duration, animations: { () -> Void in
                toViewController.view.alpha = 1
                let  frame = containerView.convertRect(toViewController.imageView.frame, fromView: toViewController.view)
                imageSnapshot.frame = frame
                toViewController.imageView.layoutIfNeeded()
                //            containerView.layoutIfNeeded()
                }) { (Bool) -> Void in
                    
                    toViewController.imageView.hidden = false
                    imageView.hidden = false
                    imageSnapshot.removeFromSuperview()
                    
                    
                    //
                    
                    
                    //                toViewController.imageView.layoutIfNeeded()
                    //
                    
                    self.cancelAnimation()
                    
                    
                    
            }

//############################################################

        case .TransitionOut:
            print("")
            
            var fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)! as ImagechildrenViewController
            
            var toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey) as ImageViewController
            
            let imageSnapshot = fromViewController.imageView.snapshotViewAfterScreenUpdates(false)
            
            
            fromViewController.imageView.layoutIfNeeded()
            
            imageSnapshot.frame = containerView.convertRect(fromViewController.imageView.frame, fromView: fromViewController.imageView.superview)
            
            fromViewController.imageView.hidden = true
            
            let imageCell = toViewController.collectionViewCellForIndexRow(fromViewController.imageIndex)
            imageCell.imageView.hidden = true
            
            
            toViewController.view.frame = transitionContext.finalFrameForViewController(toViewController)
            
            containerView.addSubview(fromViewController.view)
            containerView.addSubview(toViewController.view)
            containerView.addSubview(imageSnapshot)
            
            
            UIView.animateWithDuration(self.duration, animations: { () -> Void in
                fromViewController.view.alpha = 0
                imageSnapshot.frame =  containerView.convertRect(imageCell.imageView.frame, fromView: imageCell.imageView.superview)
            }, completion: { (Bool) -> Void in
                
                imageSnapshot.removeFromSuperview()
                fromViewController.imageView.hidden = false
                imageCell.imageView.hidden = false
                
                self.cancelAnimation()
                
                
            })
            
            
        default:
            print("")
            
        
        
        
        
        }

        
        
    }
    

    func cancelAnimation(){
    
        
        getAppdelegate().transition = nil
        self.transitionContext?.cancelInteractiveTransition()
        self.transitionContext?.completeTransition(self.transitionContext!.transitionWasCancelled())
    
    
    
    
    
    }

    
    
    
}
