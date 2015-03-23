//
//  ImageViewController.swift
//  MXVCTransitionAnimations
//
//  Created by 李茂轩 on 15/3/19.
//  Copyright (c) 2015年 limaoxuan. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{

    @IBOutlet var collectionView: UICollectionView!
    
    var collectionImageCount : Int = 0
    
    
    override func viewWillAppear(animated: Bool) {
        
        self.navigationController?.navigationBarHidden = false
    }
    
    override func viewWillDisappear(animated: Bool) {
        self.navigationController?.navigationBarHidden = true

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setUp()
        
        

    }
    
    func setUp(){
    
    
        let cellNib = UINib(nibName: "ImageViewCollectionViewCell", bundle: nil)
        
        collectionView.registerNib(cellNib, forCellWithReuseIdentifier: "collectionCell")
        
        collectionImageCount = 4
        collectionView.reloadData()
    
    }
    
    
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionImageCount
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell{
    
//        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as UITableViewCell
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("collectionCell", forIndexPath: indexPath) as ImageViewCollectionViewCell
//        cell.delegate = self
        cell.tag = indexPath.row+1
        cell.imageView.image = UIImage(named:"\(indexPath.row+1)")
        
        return cell
    
    
    
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        print(indexPath.row)
        
                transitionType( TransitionType.ImageTransitionIn)
                let imageChildViewController = ImagechildrenViewController()
        
        let cell = collectionView.cellForItemAtIndexPath(indexPath) as ImageViewCollectionViewCell
        
        
                imageChildViewController.image = cell.imageView.image
                imageChildViewController.imageIndex = indexPath.row
                navigationController?.pushViewController(imageChildViewController, animated: true)
        
        
        
    }
    
    func clickEventWithImage(image: UIImage) {
        

        
        
        
        
    }
    
//    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
//        
//        
//        getAppdelegate().selectIndex = indexPath.row
//        
//    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(screenWidth/2.1, screenWidth/2.1 * 1.5)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionViewCellForIndexRow(row:Int)->ImageViewCollectionViewCell{
    

        return  collectionView.cellForItemAtIndexPath(NSIndexPath(forRow: row, inSection: 0)) as ImageViewCollectionViewCell

    }
    
    
//    collectionview
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
