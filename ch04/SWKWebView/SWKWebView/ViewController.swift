//
//  ViewController.swift
//  SWKWebView
//
//  Created by MyZiyue on 2018/12/12.
//  Copyright © 2018 MyZiyue.com. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController,WKNavigationDelegate {
    var webView: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let screen = UIScreen.main.bounds
        
        // 按钮栏
        // 按钮栏宽
        let buttonBarWidth:CGFloat = 316
        let buttonBar = UIView(frame: CGRect(x:(screen.size.width - buttonBarWidth)/2, y: 20, width:buttonBarWidth, height:30))
        self.view.addSubview(buttonBar)
        
        // 1. 添加LoadHTML String按钮
        let buttonLoadHTMLString = UIButton(type: UIButton.ButtonType.system)
        buttonLoadHTMLString.setTitle("LoadingHTMLString", for: UIControl.State.normal)
        buttonLoadHTMLString.frame = CGRect(x:0, y:0, width:117, height:30)
        // 指定事件处理方法
        buttonLoadHTMLString.addTarget(self, action: #selector(testLoadHTMLString), for: UIControl.Event.touchUpInside)
        buttonBar.addSubview(buttonLoadHTMLString)
        
        // 2. 添加LoadData按钮
        let buttonLoadData = UIButton(type: UIButton.ButtonType.system)
        buttonLoadData.setTitle("LoadData", for: UIControl.State.normal)
        buttonLoadData.frame = CGRect(x:137, y:0, width:67, height: 30)
        // 指定事件处理方法
        buttonLoadData.addTarget(self, action: #selector(testLoadData), for: UIControl.Event.touchUpInside)
        buttonBar.addSubview(buttonLoadData)
        
        // 3. 添加LoadRequest按钮
        let buttonLoadRequest = UIButton(type: UIButton.ButtonType.system)
        buttonLoadRequest.setTitle("LoadRequest", for: UIControl.State.normal)
        buttonLoadRequest.frame = CGRect(x:224, y:0, width: 92, height: 30)
        // 指定事件处理方法
        buttonLoadRequest.addTarget(self, action: #selector(testLoadRequest), for: UIControl.Event.touchUpInside)
        buttonBar.addSubview(buttonLoadRequest)
        
        // 4. 添加WKWebView
        self.webView = WKWebView(frame: CGRect(x:0, y:60, width:screen.size.width, height:(screen.size.height - 80)))
        self.view.addSubview(self.webView)
    }
    
    @IBAction func testLoadHTMLString(sender: AnyObject) {
        let htmlPath = Bundle.main.path(forResource: "index", ofType: "html")
        let bundleUrl = NSURL.fileURL(withPath: Bundle.main.bundlePath)
        
        do {
            let html = try NSString(contentsOfFile: htmlPath!, encoding: String.Encoding.utf8.rawValue)
            self.webView.loadHTMLString(html as String, baseURL: bundleUrl)
        } catch let err as NSError {
            NSLog(err.description)
        }
        NSLog("testLoadHTMLString")
    }

    @IBAction func testLoadData(sender: AnyObject) {
        let htmlPath = Bundle.main.path(forResource: "index", ofType: "html")
        let bundleUrl = NSURL.fileURL(withPath: Bundle.main.bundlePath)
        let htmlData = NSData(contentsOfFile: htmlPath!)
        
        self.webView.load(htmlData! as Data, mimeType: "text/html", characterEncodingName: "UTF-8", baseURL: bundleUrl)
        
        NSLog("testLoadData")
    }
    
    @IBAction func testLoadRequest(sender: AnyObject) {
        let url = NSURL(string: "https://www.baidu.com")
        let request = NSURLRequest(url: url! as URL)
        self.webView.load(request as URLRequest)
        NSLog("testLoadRequest")
    }
    
    // 实现WKNavigationDelegate委托协议
    // 开始加载时调用
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        NSLog("开始加载")
    }
    
    // 当内容开始返回时调用
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        NSLog("内容开始返回")
    }
    
    // 加载完成之后调用
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        NSLog("内容加载完成")
    }
    
    // 加载失败d时调用
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        NSLog("内容加载失败 error: %@", error.localizedDescription)
    }
}

