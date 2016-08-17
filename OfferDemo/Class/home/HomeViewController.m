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
#import "HomeSearchView.h"
#import "HomeCell.h"
#import "RegistViewController.h"


@interface HomeViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSArray *unversities;
@property(nonatomic,strong)HomeSearchView *searchView;
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
    
    [self makeUI];
    
    [self data];

}



-(void)nextPage{

//    [self.navigationController pushViewController:[[tempAViewController alloc] init] animated:YES];
    
      [self.navigationController pushViewController:[[LoginViewController alloc] init] animated:YES];

}


-(void)data{

    [self.networkManager getDataSourceWithpath:@"api/app/mobile" parameters:nil success:^(NSInteger statusCode, id response) {
        
        NSLog(@"[成功] %ld  %@",statusCode,response);
        self.unversities = (NSArray *)response;
        
        [self.tableView reloadData];
        
    } failure:^(NSInteger statusCode, NSError *error) {
        
        NSLog(@"[失败] %ld  %@",statusCode,error);
        
    }];
}

-(void)makeUI{

    [self makeTableView];
    
    
    UIButton *test =[[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 40)];
    test.backgroundColor = [UIColor blackColor];
    [test setTitle:@"Next" forState:UIControlStateNormal];
    [test addTarget:self action:@selector(nextPage) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:test];
    
    [self makeSearchView];
    
    
}

-(void)makeTableView
{
    self.tableView =[[UITableView alloc] initWithFrame:CGRectMake(0,0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.tableFooterView =[[UIView alloc] init];
    [self.view addSubview:self.tableView];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.contentInset = UIEdgeInsetsMake(10, 0, 0, 0);
    self.tableView.allowsSelection = NO;
}


-(void)makeSearchView
{
    self.searchView = [HomeSearchView View];
    XWEAKSELF
    self.searchView.actionBlock = ^{
        
        [weakSelf CaseSearchPage];
    };
    [self.view addSubview: self.searchView];
    
}

#pragma mark —————— UITableViewDelegate,UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.unversities.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    HomeCell *cell =[HomeCell cellWithTableView:tableView];
    
    cell.item  = self.unversities[indexPath.row];

    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return   indexPath.row == 0 ? 0  : XPERCENT * 160;
}


//超出cell的bounds范围，不能显示
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    cell.clipsToBounds = YES;
}


//跳转搜索功能
-(void)CaseSearchPage
{
 //    [self presentViewController:[[XWGJNavigationController alloc] initWithRootViewController:[[SearchViewController alloc] init]] animated:YES completion:nil];
}

#pragma mark ———————— UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    [self.searchView searchViewWithScrollViewDidScrollContentOffsetY:scrollView.contentOffset.y];
  
    
}


@end
