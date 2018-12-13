//
//  ViewController.swift
//  SNavigationBar1
//
//  Created by MyZiyue on 2018/12/13.
//  Copyright © 2018 MyZiyue.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let screen = UIScreen.main.bounds
        
        // 1. 创建NavigationBar
        let navigationBarHeight:CGFloat = 44
        let navigationBar = UINavigationBar(frame: CGRect(x:0, y:20, width:screen.size.width, height:navigationBarHeight))
        
        let saveButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.save, target: self, action: #selector(save))
        let addButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(add))
        let navigationItem = UINavigationItem(title: "Home")
        navigationItem.leftBarButtonItem = saveButtonItem
        navigationItem.rightBarButtonItem = addButtonItem
        
        navigationBar.items = [navigationItem]
        self.view.addSubview(navigationBar)
        
        // 2. 添加label
        let labelWidth:CGFloat = 84
        let labelHeight:CGFloat = 21
        let labelTopView:CGFloat = 198
        
        self.label = UILabel(frame: CGRect(x:(screen.size.width - labelWidth)/2, y:labelTopView, width:labelWidth, height:labelHeight))
        self.label.text = "Label"
        // 字体左右居中
        self.label.textAlignment = .center
        self.view.addSubview(self.label)
    }
    
    @objc func save(sender: Any) {
        self.label.text = "点击Save"
    }
    @objc func add(sender:Any) {
        self.label.text = "点击Add"
    }


}

