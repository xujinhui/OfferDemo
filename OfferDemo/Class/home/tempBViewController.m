//
//  tempBViewController.m
//  MyDemo
//
//  Created by xuewuguojie on 16/8/15.
//  Copyright © 2016年 xuewuguojie. All rights reserved.
//

#import "tempBViewController.h"

@interface tempBViewController ()

@end

@implementation tempBViewController


- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    
    
}


- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = @"tempB";

}




@end
