//
//  ViewControllerTransition.swift
//  MXVCTransitionAnimations
//
//  Created by 李茂轩 on 15/3/17.
//  Copyright (c) 2015年 limaoxuan. All rights reserved.
//

import UIkit

public enum TransitionType{
    
    case MaskLayerZoomOut
    case MaskLayerZoomIn
    
    case ImageTransitionIn
    case ImageTransitionOut
    
    
}

func transitionType(transitionType:TransitionType){

    var transition : UIViewControllerAnimatedTransitioning!
    
    
    switch transitionType{
    
    case .MaskLayerZoomIn:
        
        transition =   CircleTransitionAnimator(duration: 0.5, circleType: CircleTransitionType.ZoomIn)
        
    case .MaskLayerZoomOut:
        
        
        transition = CircleTransitionAnimator(duration: 0.5, circleType: CircleTransitionType.ZoomOut)
    
        
    case .ImageTransitionIn:
        
        transition = ImageTransitionAnimator(duration: 0.3, transitionType: ImageTransitionType.TransitionIn)
        
    case .ImageTransitionOut:
        
        transition = ImageTransitionAnimator(duration: 0.3, transitionType: ImageTransitionType.TransitionOut)
        print("ss")
        
        
        
    default:
        print("")
    }
    
    
    accroingToTransitionTypeSettingTranstion(transition)
   
}

func accroingToTransitionTypeSettingTranstion(transitionType:UIViewControllerAnimatedTransitioning){




        getAppdelegate().transition = transitionType


}



