//
//  ViewController.swift
//  SLabelButton
//
//  Created by MyZiyue on 2018/12/11.
//  Copyright © 2018 MyZiyue.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    @IBAction func onClick(_ sender: Any) {
        NSLog("OK Button onClick")
        self.label.text = "HelloWorld"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

