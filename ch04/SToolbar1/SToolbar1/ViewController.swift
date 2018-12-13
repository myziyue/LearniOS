//
//  ViewController.swift
//  SToolbar1
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
        
        let toolbarHeight:CGFloat = 44
        
        // 1. 添加Toolbar
        let toolbar = UIToolbar(frame: CGRect(x:0, y:(screen.size.height - toolbarHeight), width:screen.size.width, height:toolbarHeight))
        
        let saveButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.save, target: self, action: #selector(save))
        let openButtonItem = UIBarButtonItem(title: "Open", style: UIBarButtonItem.Style.plain, target: self, action: #selector(open))
        let flexibleButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: self, action: nil)
        toolbar.items = [saveButtonItem, flexibleButtonItem, openButtonItem]
        
        self.view.addSubview(toolbar)
        
        // 2. 添加标签
        let labelWidth: CGFloat = 84
        let labelHeight: CGFloat = 21
        let labelTopView: CGFloat = 250
        
        self.label = UILabel(frame: CGRect(x:(screen.size.width - labelWidth)/2, y:labelTopView, width:labelWidth, height:labelHeight))
        self.label.text = "Label"
        // 字体左右居中
        self.label.textAlignment = .center
        self.view.addSubview(self.label)
    }

    @objc func save(sender: Any) {
        self.label.text = "点击Save"
    }
    @objc func open(sender: Any) {
        self.label.text = "点击Open"
    }

}

