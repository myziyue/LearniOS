//
//  ViewController.m
//  UploadDownload1
//
//  Created by MyZiyue on 2018/12/13.
//  Copyright © 2018 MyZiyue.com. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) UIActivityIndicatorView *activityIndicatorView;
@property (strong, nonatomic) UIProgressView *progressView;
@property (nonatomic, strong) NSTimer *timer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor blackColor];
    
    CGRect screen = [[UIScreen mainScreen] bounds];
    
    // 1. 获得指示器
    self.activityIndicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    
    CGRect frame = self.activityIndicatorView.frame;
    frame.origin = CGPointMake((screen.size.width - frame.size.width)/2, 84);
    // 重新设置控件的位置
    self.activityIndicatorView.frame = frame;
    
    self.activityIndicatorView.hidesWhenStopped = true;
    [self.view addSubview:self.activityIndicatorView];
    
    // 2. upload按钮
    UIButton* buttonUpload = [UIButton buttonWithType:UIButtonTypeSystem];
    [buttonUpload setTitle:@"Upload" forState:UIControlStateNormal];
    
    CGFloat buttonUploadWidth = 50;
    CGFloat buttonUploadHeight = 30;
    CGFloat buttonUploadTopView = 190;
    
    buttonUpload.frame = CGRectMake((screen.size.width - buttonUploadWidth)/2, buttonUploadTopView, buttonUploadWidth, buttonUploadHeight);
    
    // 指定事件处理方法
    [buttonUpload addTarget:self action:@selector(startToMove:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttonUpload];
    
    // 3. 进度条
    CGFloat progressViewWidth = 200;
    CGFloat progressViewHeight = 2;
    CGFloat progressViewTopView = 283;
    
    self.progressView = [[UIProgressView alloc] initWithFrame:CGRectMake((screen.size.width - progressViewWidth)/2, progressViewTopView, progressViewWidth, progressViewHeight)];
    [self.view addSubview:self.progressView];
    
    // 4. Download按钮
    UIButton* buttonDownload = [UIButton buttonWithType:UIButtonTypeSystem];
    [buttonDownload setTitle:@"Download" forState:UIControlStateNormal];
    
    CGFloat buttonDownloadWidth = 69;
    CGFloat buttonDownloadHeight = 30;
    CGFloat buttonDownloadTopView = 384;
    
    buttonDownload.frame = CGRectMake((screen.size.width - buttonDownloadWidth)/2, buttonDownloadTopView, buttonDownloadWidth, buttonDownloadHeight);
    // 指定事件处理方法
    [buttonDownload addTarget:self action:@selector(downloadProgress:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttonDownload];
}

-(void)startToMove:(id)sender {
    if(self.activityIndicatorView.isAnimating) {
        [self.activityIndicatorView stopAnimating];
    } else {
        [self.activityIndicatorView startAnimating];
    }
}
-(void)downloadProgress:(id)sender {
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(download) userInfo:nil repeats:true];
}

-(void)download {
    self.progressView.progress = self.progressView.progress + 0.1;
    if(self.progressView.progress == 1.0) {
        [self.timer invalidate];
        
        UIAlertController* alertController = [UIAlertController alertControllerWithTitle:@"Download completed!" message:@"" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil];;
        [alertController addAction:okAction];
        
        // 显示
        [self presentViewController:alertController animated:true completion:nil];
    }
}

@end
