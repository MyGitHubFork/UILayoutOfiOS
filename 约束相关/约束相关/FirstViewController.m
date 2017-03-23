//
//  FirstViewController.m
//  约束相关
//
//  Created by huangchengdu on 17/3/22.
//  Copyright © 2017年 huangchengdu. All rights reserved.
//

#import "FirstViewController.h"
#import "UIView+Layout.h"
@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(10, 50, 100, 100)];
    view1.backgroundColor = [UIColor redColor];
    view1.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:view1];
    
    
    [view1 addConstraint:[NSLayoutConstraint constraintWithItem:view1 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:300]];
    [view1 addConstraint:[NSLayoutConstraint constraintWithItem:view1 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:300]];
    
    
    //
    //
    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(100,200 , 33, 33)];
    view2.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:view2];
    view2.translatesAutoresizingMaskIntoConstraints = NO;
    
    //    // 宽度  高度
    NSLayoutConstraint *heightConstrait = [NSLayoutConstraint constraintWithItem:view2 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:view1 attribute:NSLayoutAttributeHeight multiplier:1  constant:0];
    // 宽度
    NSLayoutConstraint *widthConstrait = [NSLayoutConstraint constraintWithItem:view2 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual
                                                                         toItem:view1 attribute:NSLayoutAttributeWidth  multiplier:1 constant:0];
    
    NSLayoutConstraint *constraintTop = [NSLayoutConstraint constraintWithItem:view2 attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:view1 attribute:NSLayoutAttributeLeading multiplier:1 constant:0];
    NSLayoutConstraint *constraintBottom = [NSLayoutConstraint constraintWithItem:view2 attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:view1 attribute:NSLayoutAttributeBottom multiplier:1 constant:40];
    
    [self.view addConstraints:@[heightConstrait,widthConstrait]];
    [self.view addConstraint:constraintTop];
    [self.view addConstraint:constraintBottom];
    
    
    [self.view testAmbiguity];
    
    NSArray *arr = [self.view allConstraints];
    NSLog(@"%@",arr);
    //
    UIImageView *imageview = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"a.png"]];
    imageview.backgroundColor = [UIColor greenColor];
//    [self.view addSubview:imageview];
//    NSLayoutConstraint *iamgeHeightConstrait = [NSLayoutConstraint constraintWithItem:imageview attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:view1 attribute:NSLayoutAttributeHeight multiplier:1  constant:0];
//    NSLayoutConstraint *imagewidthConstrait = [NSLayoutConstraint constraintWithItem:imageview attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual
//                                                                         toItem:view1 attribute:NSLayoutAttributeWidth  multiplier:1 constant:0];
//    [self.view addConstraints:@[iamgeHeightConstrait,imagewidthConstrait]];
    
    
    [imageview setContentCompressionResistancePriority:300 forAxis:UILayoutConstraintAxisHorizontal];
    NSLog(@"a.png需要内容空间大小%@",NSStringFromCGSize(imageview.intrinsicContentSize));
    
    
}



@end
