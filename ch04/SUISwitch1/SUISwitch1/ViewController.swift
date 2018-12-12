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
        
        // 3. 添加segmentedController控件
        let segments = ["Right", "Left"]
        let segmentedControl = UISegmentedControl(items: segments)
        
        let scWidth:CGFloat = 220
        let scHeight:CGFloat = 29
        let scTopView:CGFloat = 186
        frame = CGRect(x:(screen.size.width - scWidth)/2, y:scTopView, width:scWidth, height:scHeight)
        // 重新设置控件的位置
        segmentedControl.frame = frame
        // 设置控件状态
        segmentedControl.selectedSegmentIndex = 0
        // 指定事件处理方法
        segmentedControl.addTarget(self, action: #selector(touchDown), for: UIControl.Event.valueChanged)
        self.view.addSubview(segmentedControl)
        
        // 4.添加slider控件
        let sliderWidth:CGFloat = 300;
        let sliderHeight:CGFloat = 31;
        let sliderTopView:CGFloat = 298;
        let slider = UISlider(frame: CGRect(x:(screen.size.width - sliderWidth)/2, y:sliderTopView, width:sliderWidth, height:sliderHeight))
        
        slider.minimumValue = 0.0
        slider.maximumValue = 100.0
        slider.value = 50.0
        
        // 指定事件处理方法
        slider.addTarget(self, action: #selector(sliderValueChanged), for: UIControl.Event.valueChanged)
        
        self.view.addSubview(slider)
        
        // 5. 添加sliderValue：标签
        // sliderValue:标签与slider之间的距离
        let labelSliderValueSliderSpace:CGFloat = 30
        let labelSliderValue = UILabel(frame: CGRect(x:slider.frame.origin.x, y:(slider.frame.origin.y - labelSliderValueSliderSpace), width:103, height:21))
        
        labelSliderValue.text = "Slider Value:"
        self.view.addSubview(labelSliderValue)
        
        // 6. 添加sliderValue标签
        self.sliderValue = UILabel(frame: CGRect(x:(labelSliderValue.frame.origin.x + 120), y:labelSliderValue.frame.origin.y, width:50, height:21))
        self.sliderValue.text = "50"
        self.view.addSubview(self.sliderValue)
    }

    @IBAction func switchValueChanged(sender: AnyObject) {
        let withSwitch = sender as! UISwitch
        let setting = withSwitch.isOn
        self.leftSwitch.setOn(setting, animated: true)
        self.rightSwitch.setOn(setting, animated: true)
    }
    
    @IBAction func touchDown(sender: AnyObject) {
        let segmentedControl = sender as! UISegmentedControl
        NSLog("选择的段：%li", segmentedControl.selectedSegmentIndex)
        
        if(self.leftSwitch.isHidden == true) {
            self.leftSwitch.isHidden = false
            self.rightSwitch.isHidden = false
        } else {
            self.leftSwitch.isHidden = true
            self.rightSwitch.isHidden = true
        }
    }
    
    @IBAction func sliderValueChanged(sender: AnyObject) {
        let slider = sender as! UISlider
        let progresssAsInt = Int(slider.value)
        let newText = String(format: "%d", progresssAsInt)
        NSLog("滑块的值：%@", newText)
        self.sliderValue.text = newText
    }
}

