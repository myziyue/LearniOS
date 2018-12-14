//
//  ViewController.swift
//  SPickerView1
//
//  Created by MyZiyue on 2018/12/14.
//  Copyright © 2018 MyZiyue.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var label: UILabel!
    var pickerView: UIPickerView!
    
    var pickerData: NSDictionary!
    var pickerProvincesData: NSArray!
    var pickerCitiesData: NSArray!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let plistPath = Bundle.main.path(forResource: "provices_cities", ofType: "plist")
        // 获取属性列表文件中的全部数据
        let dict = NSDictionary(contentsOfFile: plistPath as! String)
        self.pickerData = dict
        
        // 省份名数据
        self.pickerProvincesData = self.pickerData.allKeys as! NSArray
        
        // 默认获取出第一个省的所有市的数据
        let selectedProvince = self.pickerProvincesData[0] as! Int
        self.pickerCitiesData = self.pickerCitiesData?[selectedProvince] as? NSArray
        
        let screen = UIScreen.main.bounds
        
        // 1. 选择器
        let pickerViewWidth:CGFloat = 320
        let pickerViewHeight: CGFloat = 162
        self.pickerView = UIPickerView(frame: CGRect(x:0, y:60, width:pickerViewWidth, height:pickerViewHeight))
        self.view.addSubview(self.pickerView)
        
        // 2. 添加标签
        let labelWidth:CGFloat = 200
        let labelHeight:CGFloat = 21
        let labelTopView:CGFloat = 273
        self.label = UILabel(frame: CGRect(x:(screen.size.width - labelWidth)/2, y:labelTopView, width:labelWidth, height:labelHeight))
        self.label.text = "Label"
        self.label.textAlignment = .center
        self.view.addSubview(self.label)
        
        // 3. Button按钮
        let button = UIButton(type: UIButton.ButtonType.system)
        button.setTitle("Button", for: UIControl.State.normal)
        
        let buttonWidth:CGFloat = 46
        let buttonHeight:CGFloat = 30
        let buttonTopView:CGFloat = 374
        
        button.frame = CGRect(x: (screen.size.width - buttonWidth)/2, y: buttonTopView, width:buttonWidth, height:buttonHeight)
        button.addTarget(self, action: #selector(onClick), for: UIControl.Event.touchUpInside)
        
        self.view.addSubview(button)
    }
    
    @objc func onClick(_ sender: Any) {
        let row1 = self.pickerView.selectedRow(inComponent: 0)
        let row2 = self.pickerView.selectedRow(inComponent: 1)
        let selected1 = self.pickerProvincesData[row1] as! String
        let selected2 = self.pickerCitiesData[row2] as! String
        
        let title = NSString(format: "%@, %@市", selected1, selected2)
        
        self.label.text = title as String
    }


}

