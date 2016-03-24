//
//  ViewController.m
//  NSLayoutConstraint基础篇
//
//  Created by huangchengdu on 16/3/23.
//
//

#import "ViewController.h"

#warning 参考博客地址：http://www.cnblogs.com/xieyajie/p/4612697.html

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *Label1;
@property (weak, nonatomic) IBOutlet UILabel *Label2;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view .translatesAutoresizingMaskIntoConstraints = NO;
    self.Label1.translatesAutoresizingMaskIntoConstraints = NO;
    
    self.Label2.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_Label1 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:20]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_Label1 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:20]];
    
}

- (IBAction)clickButton:(id)sender {
    
    
    
    
}


@end
