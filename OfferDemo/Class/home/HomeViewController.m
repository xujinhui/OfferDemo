//
//  OneViewController.m
//  MyDemo
//
//  Created by xuewuguojie on 16/8/15.
//  Copyright © 2016年 xuewuguojie. All rights reserved.
//

#import "HomeViewController.h"
#import "tempAViewController.h"
#import <sys/utsname.h>

@interface HomeViewController ()
@property(nonatomic,strong)AFHTTPRequestOperationManager *manager;

@end

@implementation HomeViewController
- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
     self.title = @"首页";
    
    UIButton *test =[[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    test.center = self.view.center;
    [test setTitle:@"Next" forState:UIControlStateNormal];
    test.backgroundColor =[UIColor blackColor];
    [self.view addSubview:test];
    [test addTarget:self action:@selector(nextPage) forControlEvents:UIControlEventTouchUpInside];
    
    
    NSString *keyWord = [@"留学生活"  stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSString *path =[NSString stringWithFormat:@"http://www.myoffer.cn/api/article/search?category=%@&page=1&size=10",keyWord];
    
    
    [self.networkManager getDataSourceWithpath:path parameters:nil success:^(NSInteger statusCode, id response) {
        
                NSLog(@"[成功] %ld  %@",statusCode,response);
        

    } failure:^(NSInteger statusCode, NSError *error) {
 
                NSLog(@"失败 %ld  %@",statusCode,error);

    }];

}



-(void)nextPage{

    [self.navigationController pushViewController:[[tempAViewController alloc] init] animated:YES];
}



@end
