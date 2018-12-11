//
//  ViewController.swift
//  STextFieldTextView
//
//  Created by MyZiyue on 2018/12/11.
//  Copyright © 2018 MyZiyue.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate,UITextViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning();
    }

    // 实现UITextFieldDelegate委托协议方法
    func textFieldShouldReturn(_ textField: UITextField) ->Bool {
        NSLog("TextField获得焦点, 点击Return按键")
        textField.resignFirstResponder()
        return true
    }
    
    // 实现UITextViewDelegate委托协议方法
    func textView(_ textView: UITextView, shouldChangeTextIn shouldChangeTextInRangerange: NSRange, replacementText text: String) -> Bool {
        if(text == "\n"){
            NSLog("TextView获得焦点, 点击Return按键")
            textView.resignFirstResponder()
            return false
        }
        return true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // 注册键盘出现通知
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidShow), name: UIResponder.keyboardDidShowNotification, object: nil)
        // 注册键盘关闭通知
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidHide), name: UIResponder.keyboardDidHideNotification, object:nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // 注销键盘出现通知
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardDidShowNotification, object: nil)
        // 注销键盘隐藏通知
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardDidHideNotification, object: nil)
    }
    
    @objc func keyboardDidShow(notification: NSNotification) {
        NSLog("键盘打开")
    }
    
    @objc func keyboardDidHide(notification: Notification) {
        NSLog("键盘关闭")
    }
}

