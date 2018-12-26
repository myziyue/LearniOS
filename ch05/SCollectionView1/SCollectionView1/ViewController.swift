//
//  ViewController.swift
//  SCollectionView1
//
//  Created by MyZiyue on 2018/12/18.
//  Copyright © 2018 MyZiyue.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var COL_NUM = 2; // 每一行有几个单元格
    var events: NSArray!
    var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let bundle = Bundle.main
        let plistPath = bundle.path(forResource: "events", ofType: "plist")
        // 获取属性列表文件中的全部数据
        self.events = NSArray(contentsOfFile: plistPath!)
        
        self.setupCollectionView()
    }
    
    func setupCollectionView(){
        // 1. 创建流式布局
        let layout = UICollectionViewFlowLayout()
        // 2.设置每个单元格的尺寸
        layout.itemSize = CGSize(width:150, height:150)
        // 3.设置整个collectionView的内边距
        layout.sectionInset = UIEdgeInsets(top:0, left:0, bottom:0, right:0)
        // 4.设置每一行之间的间距
        layout.minimumLineSpacing = 10
        // 5.设置单元格
        layout.minimumInteritemSpacing = 10
        
        self.collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        
        // 设置可重用单元格标识与单元格类型
        self.collectionView.register(EventCollectionViewCell.self, forCellWithReuseIdentifier: "cellIdentifier")
        
        self.collectionView.backgroundColor = UIColor.white
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        self.view.addSubview(self.collectionView)
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

