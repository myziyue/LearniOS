//
//  ViewController.swift
//  SPickerView
//
//  Created by MyZiyue on 2018/12/13.
//  Copyright © 2018 MyZiyue.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var label: UILabel!
    
    var pickerData: NSDictionary!
    var pickerProvincesData: NSArray!
    var pickerCitiesData: NSArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let plistPath = Bundle.main.path(forResource: "provinces_cities", ofType: "plist")
        // 获取属性列表文件中的全部数据
        self.pickerData = NSDictionary(contentsOfFile: plistPath!)
        
        
        // 省份名数据
        self.pickerProvincesData = self.pickerData.allKeys as NSArray
        
        // 默认获取出第一个省的所有市的数据
        let selectedProvince = self.pickerProvincesData[0] as! String
        self.pickerCitiesData = self.pickerData?[selectedProvince] as! NSArray
    }

    @IBAction func onClick(_ sender: Any) {
        let row1 = self.pickerView.selectedRow(inComponent: 0)
        let row2 = self.pickerView.selectedRow(inComponent: 1)
        let selected1 = self.pickerProvincesData[row1] as! String
        let selected2 = self.pickerCitiesData[row2] as! String
        
        let title = NSString(format: "%@, %@市", selected1, selected2)
        
        self.label.text = title as String
    }
    
    // 实现协议UIPickerDataSource方法
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        NSLog("numberOfRowsInComponent is ", component)
        if(component == 0 ) { // 省份个数
            return self.pickerProvincesData.count;
        } else {
            return self.pickerCitiesData.count;
        }
    }
    
    // 实现协议UIPickerViewDelegate方法
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if(component == 0) { // 省份数据
            return self.pickerProvincesData[row] as? String
        } else {
            return self.pickerCitiesData[row] as? String
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if(component == 0) {
            let selectedProvince = self.pickerProvincesData[row] as! String
            self.pickerCitiesData = self.pickerData[selectedProvince] as! NSArray
            self.pickerView.reloadComponent(1)
            self.pickerView.selectRow(0, inComponent: 1, animated: true)
        }
    }
    
}

