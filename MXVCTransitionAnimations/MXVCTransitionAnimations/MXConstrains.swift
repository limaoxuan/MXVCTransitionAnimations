//
//  CCConstrains.swift
//  MyNews
//
//  Created by 李茂轩 on 15/1/29.
//  Copyright (c) 2015年 lee. All rights reserved.
//

import UIKit



func setConstraintsWithStringWithCurrentView(format : String,superView : UIView,viewDic : NSDictionary)->Void{
    
    
    
    var constaraints = NSLayoutConstraint.constraintsWithVisualFormat(format, options: NSLayoutFormatOptions(0), metrics: nil, views:viewDic as [NSObject : AnyObject])
    superView.addConstraints(constaraints)
    
}


func setConstraintsWithStringHandVWithCurrentView(formatH : String,formatV : String,superView : UIView,viewDic : NSDictionary)->Void{
    
    
    setConstraintsWithStringWithCurrentView(formatH, superView, viewDic)
    setConstraintsWithStringWithCurrentView(formatV, superView, viewDic)
    
}

func setLocationAccrodingWithSuperViewAndCurrentViewSetLayoutAttributeCenterY(superView :UIView,currentView:UIView,height:Int)->Void{


    let dic = ["currentView":currentView]
    
    setConstraintsWithStringWithCurrentView("V:[currentView(\(height))]", superView, dic)
    
    let  constaraint = NSLayoutConstraint(item: currentView, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: superView, attribute: NSLayoutAttribute.CenterY, multiplier: 1.0, constant: 0)


    superView.addConstraint(constaraint)
}

func setLocationAccrodingWithSuperViewAndCurrentViewSetLayoutAttributeCenterX(superView :UIView,currentView:UIView,width:String)->Void{

    
    let dic = ["currentView":currentView]
    
    setConstraintsWithStringWithCurrentView("H:[currentView(\(width))]", superView, dic)
    
    let  constaraint = NSLayoutConstraint(item: currentView, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: superView, attribute: NSLayoutAttribute.CenterX, multiplier: 1.0, constant: 0)
    
    
      superView.addConstraint(constaraint)

}

/**
This is setting a view that It is in the superview center
:param: superView   superView   His father view
:param: currentView currentView son view
*/

/**
设置一个居于父级视图中心的视图

:param: superView   父亲视图
:param: currentView 儿子视图
*/
func setLocationCurrentInSuperViewlocationCenter(superView :UIView,currentView:UIView,width:String,height:Int)->Void{


    setLocationAccrodingWithSuperViewAndCurrentViewSetLayoutAttributeCenterX(superView, currentView,width)
    
    setLocationAccrodingWithSuperViewAndCurrentViewSetLayoutAttributeCenterY(superView, currentView,height)
    
        



}



