//
//  BaseViewController.m
//  MyDemo
//
//  Created by xuewuguojie on 16/8/15.
//  Copyright © 2016年 xuewuguojie. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
     self.view.backgroundColor = [UIColor colorWithRed:(arc4random()%250 + 1)/255.0 green:(arc4random()%250 + 1)/255.0 blue:(arc4random()%250 + 1)/255.0 alpha:1];
    
}



@end
