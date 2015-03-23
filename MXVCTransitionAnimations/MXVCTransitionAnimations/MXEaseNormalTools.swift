//
//  MXEaseNormalTools.swift
//  MXAlertView
//
//  Created by 李茂轩 on 15/2/10.
//  Copyright (c) 2015年 lee. All rights reserved.
//


import UIKit


let screenWidth = UIScreen.mainScreen().bounds.width

let screenHeight = UIScreen.mainScreen().bounds.height



/**
This is color encapsulation. You can use conveniently.

:param: r red
:param: g green
:param: b blue
:param: a alpha

:returns: UIColor
*/
func RGBA(r:CGFloat,g:CGFloat,b:CGFloat,a:CGFloat)->UIColor{

return UIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a)

}

func RED()->UIColor{

return UIColor.redColor()
    
}

func BLACK()->UIColor{


return UIColor.blackColor()


}

func YELLOW()->UIColor{


return UIColor.yellowColor()

}

func BLUE()->UIColor{

return UIColor.blueColor()


}

func DARKGRAY()->UIColor{

return UIColor.darkGrayColor()

}

func GREEN()->UIColor{


return UIColor.greenColor()

}

func CLEAR()->UIColor{


return UIColor.clearColor()

}


func getAppdelegate()->AppDelegate{


return UIApplication.sharedApplication().delegate as AppDelegate


}


//
func getStoryBoard()->UIStoryboard{


    let board = UIStoryboard(name: "Main", bundle: nil)
    
    return board

}

func getMainStoryboardInstance(className:String)->UIViewController{


let controller = getStoryBoard().instantiateViewControllerWithIdentifier(className) as UIViewController

return controller


}

//