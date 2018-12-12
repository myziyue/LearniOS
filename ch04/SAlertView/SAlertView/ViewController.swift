//
//  ViewController.swift
//  SAlertView
//
//  Created by MyZiyue on 2018/12/12.
//  Copyright © 2018 MyZiyue.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let screen = UIScreen.main.bounds
        let buttonAlertView = UIButton(type: UIButton.ButtonType.system)
        buttonAlertView.setTitle("Test警告框", for: UIControl.State.normal)
        
        let buttonAlertViewWidth: CGFloat = 100
        let buttonAlertViewHeight: CGFloat = 30
        let buttonAlertViewTopView: CGFloat = 130
        
        buttonAlertView.frame = CGRect(x:(screen.size.width - buttonAlertViewWidth)/2, y:buttonAlertViewTopView, width:buttonAlertViewWidth, height:buttonAlertViewHeight)
        // 指定事件处理方法
        buttonAlertView.addTarget(self, action: #selector(testAlertView), for: UIControl.Event.touchUpInside)
        self.view.addSubview(buttonAlertView)
    }
    
    @objc func testAlertView(sender: AnyObject) {
        let alertController: UIAlertController = UIAlertController(title: "Alert", message: "Alert text goes here", preferredStyle: UIAlertController.Style.alert)
        
        let noAction = UIAlertAction(title: "No", style: .cancel) {
            (alertAction) -> Void in  NSLog("Tap No Button")
        }
        
        let yesAction = UIAlertAction(title: "Yes", style: .default) {
            (alertAction) -> Void in  NSLog("Tap Yes Button")
        }
        
        alertController.addAction(noAction)
        alertController.addAction(yesAction)
        
        // 显示
        self.present(alertController, animated: true, completion: nil)
    }


}

