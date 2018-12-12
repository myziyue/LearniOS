//
//  ViewController.swift
//  STextFieldTextView1
//
//  Created by MyZiyue on 2018/12/11.
//  Copyright © 2018 MyZiyue.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate,UITextViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let screen = UIScreen.main.bounds
        
        let textFieldWidth:CGFloat = 223
        let textFieldHeight:CGFloat = 30
        let textFieldTopView:CGFloat = 150
        let textField = UITextField(frame: CGRect(x:(screen.size.width - textFieldWidth)/2, y:textFieldTopView, width:textFieldWidth, height:textFieldHeight))
        
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.delegate = self
        textField.returnKeyType = UIReturnKeyType.next
        textField.keyboardType = UIKeyboardType.asciiCapable
        
        self.view.addSubview(textField)
        
        // labelName标签与textField之间距离
        let labelNameTextFieldSpace:CGFloat = 30
        let labelName = UILabel(frame: CGRect(x:textField.frame.origin.x, y:(textField.frame.origin.y-labelNameTextFieldSpace), width:51, height:21))
        labelName.text = "Name:"
        self.view.addSubview(labelName)
        
        let textViewWidth:CGFloat = 236
        let textViewHeight:CGFloat = 198
        let textViewTopView:CGFloat = 240
        let textView = UITextView(frame: CGRect(x:(screen.size.width - textViewWidth)/2, y:textViewTopView, width:textViewWidth, height:textViewHeight))
        
        textView.text = "Lorem ipsum dolor sit er elit lamet, ..."
        textView.delegate = self
        textView.returnKeyType = UIReturnKeyType.go
        textView.keyboardType = UIKeyboardType.asciiCapable
        
        self.view.addSubview(textView)
        
        // labelAbstract标签与textView之间的距离
        let labelAbstractTextViewSpace:CGFloat = 30
        let labelAbstract = UILabel(frame: CGRect(x:textView.frame.origin.x, y:(textView.frame.origin.y-labelAbstractTextViewSpace), width:103, height:21))
        
        labelAbstract.text = "Abstract:"
        self.view.addSubview(labelAbstract)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        NSLog("TextField获得焦点，点击Return按键")
        textField.resignFirstResponder()
        return true
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if(text == "\n"){
            NSLog("TextView获得焦点，点击Return按键")
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

