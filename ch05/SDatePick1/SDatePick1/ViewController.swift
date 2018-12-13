//
//  ViewController.swift
//  SDatePick1
//
//  Created by MyZiyue on 2018/12/13.
//  Copyright © 2018 MyZiyue.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var datePicker: UIDatePicker!
    var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let screen = UIScreen.main.bounds
        
        // 1. 日期选择器
        let datePickerWidth: CGFloat = 320
        let datePickerHeight: CGFloat = 167
        
        self.datePicker = UIDatePicker(frame: CGRect(x:0, y:60, width:datePickerWidth, height:datePickerHeight))
        // zh-Hans简体中文
        self.datePicker.locale = Locale(identifier: "zh-Hans")
        // 设置日期时间模式
        self.datePicker.datePickerMode = .dateAndTime
        self.view.addSubview(self.datePicker)
        
        // 2. 添加标签
        let labelWidth:CGFloat = 200
        let labelHeight:CGFloat = 21
        let labelTopView:CGFloat = 281
        self.label = UILabel(frame: CGRect(x:(screen.size.width - labelWidth)/2, y:labelTopView, width:labelWidth, height:labelHeight))
        
        self.label.text = "Label"
        self.label.textAlignment = .center
        self.view.addSubview(self.label)
        
        // 3. Button按钮
        let button = UIButton(type: UIButton.ButtonType.system)
        button.setTitle("Button", for: UIControl.State.normal)
        
        let buttonWidth:CGFloat = 46
        let buttonHeight:CGFloat = 30
        let buttonTopView:CGFloat = 379
        
        button.frame = CGRect(x:(screen.size.width - buttonWidth)/2, y:buttonTopView, width:buttonWidth, height:buttonHeight)
        // 指定事件处理方法
        button.addTarget(self, action: #selector(onClick), for: UIControl.Event.touchUpInside)
        self.view.addSubview(button)
    }

    @objc func onClick(sender: Any) {
        let theDate: Date = self.datePicker.date
        let desc = theDate.description(with: Locale.current)
        NSLog("The date picked is : %@", desc)
        
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd HH:mm:ss"
        NSLog("The date formate is : %@", dateFormatter.string(from: theDate))
        
        self.label.text = dateFormatter.string(from: theDate)
    }

}

