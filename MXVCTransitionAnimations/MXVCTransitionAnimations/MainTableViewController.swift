//
//  MainTableViewController.swift
//  MXVCTransitionAnimations
//
//  Created by 李茂轩 on 15/3/17.
//  Copyright (c) 2015年 limaoxuan. All rights reserved.
//

import UIkit

class MainTableViewController: UIViewController,UITableViewDataSource,UITableViewDelegate ,UINavigationControllerDelegate{

//    var percentTransition 
    
    var nameArray : [String]!
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        nameArray = ["maskLayer↗️","otherAnimation"]
        
        tableView.reloadData()
        
        tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        // 动画延时
        let diff = 0.05
        // 获取tableview的高
        let tableHeight = self.tableView.bounds.size.height
        
        let cells : [UITableViewCell] = tableView.visibleCells() as  [UITableViewCell]
        
        // 便利单元格，将之隐藏
        for cell in cells {
        
        cell.transform = CGAffineTransformMakeTranslation(0, tableHeight)
        
        }
        
        
        for i in 0...cells.count-1{
        
            let cell : UITableViewCell = cells[i] as UITableViewCell
            let delay = diff * Double(i)
            
            UIView.animateWithDuration(1, delay: delay, options: UIViewAnimationOptions.allZeros, animations: { () -> Void in
                cell.transform =

                    CGAffineTransformMakeTranslation(0, 0)
                }, completion: nil)
        
            
        
        }
        
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
     func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
     func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    
    return nameArray.count
    
    }
//    
      func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as UITableViewCell
    cell.textLabel?.text = "\(indexPath.row+1)--" + nameArray[indexPath.row]
//        cell.lin
    return cell
    
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        
        print(indexPath.row)
        
        if indexPath.row == 1 {
        
            let toViewController =     getMainStoryboardInstance("ImageViewController")

        self.navigationController?.pushViewController(toViewController, animated: true)
            
        
        
        }
   
        

        
        
        
//        self.performSegueWithIdentifier("toChatSegue", sender: self)

        
        
//        performSegueWithIdentifier("", sender: self)
        
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
      
        if segue.identifier == "setting" {
        
            transitionType( TransitionType.MaskLayerZoomIn)
    
        
        
        }
        
        
        
        
    }

   
//    @IBAction func maskLayerAnimation(sender: AnyObject) {
//        
//        let viewController = ViewController()
//        self.navigationController?.navigationBarHidden = true
//        
//        self.navigationController?.pushViewController(viewController, animated: true)
//        
//        
//    }
    
}
