//
//  RootViewController.swift
//  SUIView1
//
//  Created by MyZiyue on 2018/12/10.
//  Copyright © 2018 MyZiyue.com. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let screen = UIScreen.main.bounds;
        let labelWidth:CGFloat = 90;
        let labelHeight:CGFloat = 20;
        let labelTopView:CGFloat = 150;
        
        let label = UILabel(frame: CGRect(x:(screen.size.width - labelWidth)/2, y:labelTopView, width:labelWidth, height:labelHeight))
        
        label.text = "HelloWorld"
        // 字体左右居中
        label.textAlignment = .center
        self.view.addSubview(label)
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
