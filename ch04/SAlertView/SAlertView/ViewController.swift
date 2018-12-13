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
        
        // 1. AlertView
        let buttonAlertView = UIButton(type: UIButton.ButtonType.system)
        buttonAlertView.setTitle("Test警告框", for: UIControl.State.normal)
        
        let buttonAlertViewWidth: CGFloat = 100
        let buttonAlertViewHeight: CGFloat = 30
        let buttonAlertViewTopView: CGFloat = 130
        
        buttonAlertView.frame = CGRect(x:(screen.size.width - buttonAlertViewWidth)/2, y:buttonAlertViewTopView, width:buttonAlertViewWidth, height:buttonAlertViewHeight)
        // 指定事件处理方法
        buttonAlertView.addTarget(self, action: #selector(testAlertView), for: UIControl.Event.touchUpInside)
        self.view.addSubview(buttonAlertView)
        
        // 2. AlertViewSheet
        let buttonActionSheet = UIButton(type: UIButton.ButtonType.system)
        buttonActionSheet.setTitle("Test操作表", for: UIControl.State.normal)
        
        let buttonActionSheetWidth: CGFloat = 100
        let buttonActionSheetHeight: CGFloat = 30
        let buttonActionSheetTopView: CGFloat = 260
        
        buttonActionSheet.frame = CGRect(x:(screen.size.width - buttonActionSheetWidth)/2, y:buttonActionSheetTopView, width:buttonActionSheetWidth, height:buttonActionSheetHeight)
        // 指定事件处理方法
        buttonActionSheet.addTarget(self, action: #selector(testActionSheet), for: UIControl.Event.touchUpInside)
        self.view.addSubview(buttonActionSheet)
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
    
    @objc func testActionSheet(sender: AnyObject) {
        let actionSheetController: UIAlertController = UIAlertController()
        
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel) { (alertAction) -> Void in
            NSLog("Tap Cancel Button")
        }
        let destructiveAction = UIAlertAction(title: "破坏性按钮", style: UIAlertAction.Style.destructive) { (alertAction) -> Void in
            NSLog("Tap Destructive Button")
        }
        let otherAction = UIAlertAction(title: "其他按钮", style: UIAlertAction.Style.default) { (alertAction) -> Void in
            NSLog("Tap Others Button")
        }
        
        actionSheetController.addAction(cancelAction)
        actionSheetController.addAction(destructiveAction)
        actionSheetController.addAction(otherAction)
        
        self.present(actionSheetController, animated: true, completion: nil)
    }


}

