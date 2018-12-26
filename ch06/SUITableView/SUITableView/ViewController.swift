//
//  ViewController.swift
//  SUITableView
//
//  Created by MyZiyue on 2018/12/26.
//  Copyright © 2018 MyZiyue.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var listTeams: NSArray!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let plistPath = Bundle.main.path(forResource: "team", ofType: "plist")
        self.listTeams = NSArray(contentsOfFile: (plistPath ?? nil)!)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listTeams.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellIdentifier", for: indexPath)
        
        let row = indexPath.row
        
        let rowDict = self.listTeams[row] as! NSDictionary
        cell.textLabel?.text = rowDict["name"] as? String
        
        let imagePath = String(format: "%@.png", rowDict["image"] as! String)
        cell.imageView?.image = UIImage(named: imagePath)
        
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }

}

