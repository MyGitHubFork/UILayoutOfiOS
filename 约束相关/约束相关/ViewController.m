//
//  ViewController.m
//  约束相关
//
//  Created by huangchengdu on 17/3/22.
//  Copyright © 2017年 huangchengdu. All rights reserved.
//

#import "ViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}


- (IBAction)one:(id)sender {
    [self.navigationController pushViewController:[[FirstViewController alloc]init] animated:YES];
}

- (IBAction)two:(id)sender {
    [self.navigationController pushViewController:[[SecondViewController alloc]init] animated:YES];
}

- (IBAction)three:(id)sender {
}

- (IBAction)four:(id)sender {
}

- (IBAction)five:(id)sender {
}

- (IBAction)six:(id)sender {
}

- (IBAction)seven:(id)sender {
}

- (IBAction)eight:(id)sender {
}

- (IBAction)nine:(id)sender {
}





@end
