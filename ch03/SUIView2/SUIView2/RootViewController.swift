//
//  RootViewController.swift
//  SUIView2
//
//  Created by MyZiyue on 2018/12/10.
//  Copyright © 2018 MyZiyue.com. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // 创建视图viewA
        let viewA = UIView()
        viewA.backgroundColor = UIColor.gray
        // 设置viewA的frame属性
        viewA.frame = CGRect(x:0, y:0, width:300, height:400)
        // 将viewA添加到根视图中
        self.view.addSubview(viewA)
        
        // 创建视图viewB
        let viewB = UIView()
        viewB.backgroundColor = UIColor.green
        // 设置viewB的frame属性
        viewB.frame = CGRect(x:50, y:100, width:100, height:200)
        // 将viewB添加到viewA视图中
        viewA.addSubview(viewB)
        
        NSLog("frame_x: %.2f, frame_y: %.2f", viewB.frame.origin.x, viewB.frame.origin.y)
        NSLog("frame_w: %.2f, frame_h: %.2f", viewB.frame.size.width, viewB.frame.size.height)
        
        NSLog("bounds_x: %.2f, bounds_y: %.2f", viewB.bounds.origin.x, viewB.bounds.origin.y)
        NSLog("bounds_w: %.2f, bounds_h: %.2f", viewB.bounds.size.width, viewB.bounds.size.height)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
