//
//  ViewController.swift
//  SUploadDownload
//
//  Created by MyZiyue on 2018/12/13.
//  Copyright © 2018 MyZiyue.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    @IBOutlet weak var progressView: UIProgressView!
    var time: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func startToMove(_ sender: Any) {
        if(self.activityIndicatorView.isAnimating) {
            self.activityIndicatorView.stopAnimating()
        } else {
            self.activityIndicatorView.startAnimating()
        }
    }
    
    @IBAction func downloadProgress(_ sender: Any) {
        self.time = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(download), userInfo: nil, repeats: true)
    }
    
    @objc func download() {
        self.progressView.progress = self.progressView.progress + 0.1
        
        if(self.progressView.progress == 1.0) {
            self.time.invalidate()
            
            let alertController: UIAlertController = UIAlertController(title: "Download completed!", message: "", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(okAction)
            
            // 显示
            self.present(alertController, animated: true, completion: nil)
        }
    }
}

