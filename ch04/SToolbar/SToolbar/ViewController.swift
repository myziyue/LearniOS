//
//  ViewController.swift
//  SToolbar
//
//  Created by MyZiyue on 2018/12/13.
//  Copyright © 2018 MyZiyue.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func save(_ sender: Any) {
        self.label.text = "点击Save";
    }
    
    @IBAction func open(_ sender: Any) {
        self.label.text = "点击Open";
    }
}

