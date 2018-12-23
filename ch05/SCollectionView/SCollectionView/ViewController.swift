//
//  ViewController.swift
//  SCollectionView
//
//  Created by MyZiyue on 2018/12/14.
//  Copyright © 2018 MyZiyue.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    var events: NSArray!
    @IBOutlet weak var collectView: UICollectionView!
    var COL_NUM = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let bundle = Bundle.main
        let plistPath = bundle.path(forResource: "events", ofType: "plist")
        // 获取属性列表文件中的全部数据
        self.events = NSArray(contentsOfFile: plistPath!)
    }
    // UICollectionViewDataSource
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        let num = self.events.count%COL_NUM
        if(num == 0) {
            return self.events.count/COL_NUM
        } else {
            return self.events.count/COL_NUM+1
        }
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return COL_NUM
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellIdentifier", for: indexPath) as!EventCollectionViewCell
        
        let event = self.events[indexPath.section * COL_NUM + indexPath.row] as! NSDictionary
        
        cell.label.text = event["name"] as? String
        cell.imageView.image = UIImage(named: event["image"] as! String)
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let event = self.events[indexPath.section * COL_NUM + indexPath.row] as! NSDictionary
        NSLog("select event name : %@", event["name"] as! String)
    }
}

