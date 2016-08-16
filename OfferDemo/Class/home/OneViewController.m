//
//  OneViewController.m
//  MyDemo
//
//  Created by xuewuguojie on 16/8/15.
//  Copyright © 2016年 xuewuguojie. All rights reserved.
//

#import "OneViewController.h"
#import "tempAViewController.h"

@interface OneViewController ()

@end

@implementation OneViewController
- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
     self.title = @"onePage";
    
    
    UIButton *test =[[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    test.center = self.view.center;
    [test setTitle:@"Next" forState:UIControlStateNormal];
    test.backgroundColor =[UIColor blackColor];
    [self.view addSubview:test];
    [test addTarget:self action:@selector(nextPage) forControlEvents:UIControlEventTouchUpInside];
}



-(void)nextPage{

    [self.navigationController pushViewController:[[tempAViewController alloc] init] animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
