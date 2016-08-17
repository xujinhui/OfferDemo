//
//  tempAViewController.m
//  MyDemo
//
//  Created by xuewuguojie on 16/8/15.
//  Copyright © 2016年 xuewuguojie. All rights reserved.
//

#import "tempAViewController.h"
#import "tempBViewController.h"

@interface tempAViewController ()

@end

@implementation tempAViewController

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    
    
}



- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"tempA";

    
    UIButton *test =[[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    test.center = self.view.center;
    [test setTitle:@"Next" forState:UIControlStateNormal];
    test.backgroundColor =[UIColor blackColor];
    [self.view addSubview:test];
    [test addTarget:self action:@selector(nextPage) forControlEvents:UIControlEventTouchUpInside];
}



-(void)nextPage{
    
//    [self.navigationController pushViewController:[[tempBViewController alloc] init] animated:YES];
    
}




@end
