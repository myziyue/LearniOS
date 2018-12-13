//
//  ViewController.swift
//  SDatePick
//
//  Created by MyZiyue on 2018/12/13.
//  Copyright © 2018 MyZiyue.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    @IBAction func onClick(_ sender: Any) {
        let theDate: Date = self.datePicker.date as Date
        let desc = theDate.description(with: NSLocale.current)
        NSLog("The date picked is : %@", desc)
        
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd HH:mm:ss"
        NSLog("The date formate is : %@", dateFormatter.string(from: theDate as Date))
        
        self.label.text = dateFormatter.string(from: theDate as Date)
    }
}

