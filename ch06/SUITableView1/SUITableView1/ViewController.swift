//
//  ViewController.swift
//  SUITableView1
//
//  Created by MyZiyue on 2018/12/26.
//  Copyright © 2018 MyZiyue.com. All rights reserved.
//

import UIKit

let CellIdentifier = "CellIndentifier"

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var listTeams: NSArray!
    var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let plistPath = Bundle.main.path(forResource: "team", ofType: "plist")
        // 获取属性列表文件中的全部数据
        self.listTeams = NSArray(contentsOfFile: plistPath!)
        
        self.tableView = UITableView(frame: self.view.frame, style: .plain)
        
        // 设置表视图委托对象为self
        self.tableView.delegate = self
        // 设置表视图数据对象为self
        self.tableView.dataSource = self
        
        self.view.addSubview(self.tableView)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listTeams.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell! = tableView.dequeueReusableCell(withIdentifier: CellIdentifier)
        if(cell == nil) {
            cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: CellIdentifier)
        }
        
        let row = indexPath.row
        
        let rowDict = self.listTeams[row] as! NSDictionary
        cell.textLabel?.text = rowDict["name"] as? String
        
        let imagePath = String(format: "%@.png", rowDict["image"] as! String)
        cell.imageView?.image = UIImage(named: imagePath)
        
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
}

