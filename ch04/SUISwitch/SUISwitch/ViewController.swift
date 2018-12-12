//
//  ViewController.swift
//  SUISwitch
//
//  Created by MyZiyue on 2018/12/12.
//  Copyright © 2018 MyZiyue.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var leftSwitch: UISwitch!
    @IBOutlet weak var rightSwitch: UISwitch!
    @IBOutlet weak var sliderValue: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func switchValueChanged(_ sender: Any) {
        let withSwitch = sender as! UISwitch
        let setting = withSwitch.isOn
        self.leftSwitch.setOn(setting, animated: true)
        self.rightSwitch.setOn(setting, animated: true)
        
    }

    @IBAction func touchDown(_ sender: Any) {
        let segmentedControl = sender as! UISegmentedControl
        NSLog("选择的段：%li", segmentedControl.selectedSegmentIndex)
        
        if(self.leftSwitch.isHidden == true) {
            self.leftSwitch.isHidden = false
            self.rightSwitch.isHidden = false
        } else {
            self.rightSwitch.isHidden = true
            self.leftSwitch.isHidden = true
        }
    }
    @IBAction func sliderValueChange(_ sender: Any) {
        let slider = sender as! UISlider
        let progressAsInt = Int(slider.value)
        let newText = NSString(format: "%d", progressAsInt)
        self.sliderValue.text = newText as String
    }
}

