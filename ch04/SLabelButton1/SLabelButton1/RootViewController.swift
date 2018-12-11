//
//  RootViewController.swift
//  SLabelButton1
//
//  Created by MyZiyue on 2018/12/11.
//  Copyright © 2018 MyZiyue.com. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let screen = UIScreen.main.bounds
        
        let labelWidth:CGFloat = 90
        let labelHeight:CGFloat = 20
        let labelTopView:CGFloat = 150
        let label = UILabel(frame: CGRect(x:(screen.size.width - labelWidth)/2, y:labelTopView, width:labelWidth, height:labelHeight))
        
        label.text = "Label"
        label.textAlignment = .center
        self.view.addSubview(label)
        
        let button = UIButton(type: UIButton.ButtonType.system)
        button.setTitle("OK", for: UIControl.State.normal)
        
        let buttonWidth:CGFloat = 60
        let buttonHeight:CGFloat = 20
        let buttonTopView:CGFloat = 240
        
        button.frame = CGRect(x:(screen.size.width - buttonWidth)/2, y:buttonTopView, width:buttonWidth, height:buttonHeight)
        
        button.addTarget(self, action: #selector(onClick), for: .touchUpInside)
        
        self.view.addSubview(button)
    }
    
    @objc func onClick(sender: Any) {
        NSLog("OK Button onClick.")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
