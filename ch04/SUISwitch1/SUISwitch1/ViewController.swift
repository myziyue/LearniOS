//
//  ViewController.swift
//  SUISwitch1
//
//  Created by MyZiyue on 2018/12/12.
//  Copyright © 2018 MyZiyue.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var leftSwitch:UISwitch!
    var rightSwitch:UISwitch!
    var sliderValue: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let screen = UIScreen.main.bounds
        
        // 1. 添加rightSwitch控件
        // rightSwitch与屏幕左边距
        // lefitSwitch与屏幕右边距
        let switchScreenSpace:CGFloat = 39
        
        self.rightSwitch = UISwitch()
        var frame = self.rightSwitch.frame
        frame.origin = CGPoint(x:switchScreenSpace, y:98)
        // 重新设置控件的位置
        self.rightSwitch.frame = frame
        // 设置控件状态
        self.rightSwitch.isOn = true
        // 指定事件处理方法
        self.rightSwitch.addTarget(self, action: #selector(switchValueChanged), for: UIControl.Event.valueChanged)
        
        self.view.addSubview(self.rightSwitch)
        
        // 2.添加leftSwitch控件
        self.leftSwitch = UISwitch()
        frame = self.leftSwitch.frame
        frame.origin = CGPoint(x:(screen.size.width - (frame.size.width + switchScreenSpace)), y:98)
        // 重新设置控件的位置
        self.leftSwitch.frame = frame
        // 设置控件状态
        self.leftSwitch.isOn = true
        // 指定事件处理方法
        self.leftSwitch.addTarget(self, action: #selector(switchValueChanged), for: UIControl.Event.valueChanged)
        
        self.view.addSubview(self.leftSwitch)
    }

    @IBAction func switchValueChanged(sender: AnyObject) {
        let withSwitch = sender as! UISwitch
        let setting = withSwitch.isOn
        self.leftSwitch.setOn(setting, animated: true)
        self.rightSwitch.setOn(setting, animated: true)
    }
}

