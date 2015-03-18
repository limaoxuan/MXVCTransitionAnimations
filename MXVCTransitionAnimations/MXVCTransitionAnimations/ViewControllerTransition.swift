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
    case ImageTransition
    
    
    
}

func transitionType(transitionType:TransitionType){

    var transition : UIViewControllerAnimatedTransitioning!
    switch transitionType{
    
    case .MaskLayerZoomIn:
        
        transition =   CircleTransitionAnimator(duration: 0.5, circleType: CircleTransitionType.ZoomIn)

    
    case .MaskLayerZoomOut:
        
        
        transition = CircleTransitionAnimator(duration: 0.5, circleType: CircleTransitionType.ZoomOut)
    
        
    case .ImageTransition:
        
        
        
        print("")
        
        
    default:
        print("")
    }
    accroingToTransitionTypeSettingTranstion(transition)
   
}

func accroingToTransitionTypeSettingTranstion(transitionType:UIViewControllerAnimatedTransitioning){




        getAppdelegate().transition = transitionType


}



