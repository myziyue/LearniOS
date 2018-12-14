//
//  ViewController.swift
//  SPickerView
//
//  Created by MyZiyue on 2018/12/13.
//  Copyright © 2018 MyZiyue.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var label: UILabel!
    
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
    }

    @IBAction func onClick(_ sender: Any) {
        let row1 = self.pickerView.selectedRow(inComponent: 0)
        let row2 = self.pickerView.selectedRow(inComponent: 1)
        let selected1 = self.pickerProvincesData[row1] as! String
        let selected2 = self.pickerCitiesData[row2] as! String
        
        let title = NSString(format: "%@, %@市", selected1, selected2)
        
        self.label.text = title as String
    }
    
}

