//
//  SecondViewController.m
//  约束相关
//
//  Created by huangchengdu on 17/3/23.
//  Copyright © 2017年 huangchengdu. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

-(void)awakeFromNib{
    [super awakeFromNib];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImage *image = [[UIImage imageNamed:@"a.png"] imageWithAlignmentRectInsets:UIEdgeInsetsMake(0, 0, 50, 20)];
    UIImageView *imageView = [[UIImageView alloc]initWithImage:image];
    imageView.frame = CGRectMake(0, 64, 100, 100);
    imageView.backgroundColor = [UIColor greenColor];
    NSLog(@"%@------%@",NSStringFromCGRect(imageView.frame),NSStringFromCGSize(imageView.intrinsicContentSize));
    [self.view addSubview:imageView];
    
}


@end
