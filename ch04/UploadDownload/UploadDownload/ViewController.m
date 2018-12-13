//
//  ViewController.m
//  UploadDownload
//
//  Created by MyZiyue on 2018/12/13.
//  Copyright © 2018 MyZiyue.com. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicatorView;
@property (weak, nonatomic) IBOutlet UIProgressView *progressView;
@property (nonatomic, strong) NSTimer *time;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)startToMove:(id)sender {
    if(self.activityIndicatorView.isAnimating){
        [self.activityIndicatorView stopAnimating];
    } else {
        [self.activityIndicatorView startAnimating];
    }
}
- (IBAction)downloadProgress:(id)sender {
    self.time = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(download) userInfo:nil repeats:YES];
}

-(void)download {
    self.progressView.progress = self.progressView.progress + 0.1;
    if(self.progressView.progress == 1.0) {
        [self.time invalidate];
        
        UIAlertController* alertController = [UIAlertController alertControllerWithTitle:@"Download completed!" message:@"" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler: nil];
        
        [alertController addAction:okAction];
        
        // 显示
        [self presentViewController:alertController animated:true completion:nil];
    }
}

@end
