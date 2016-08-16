//
//  XNavigationController.m
//  MyDemo
//
//  Created by xuewuguojie on 16/8/15.
//  Copyright © 2016年 xuewuguojie. All rights reserved.
//

#import "XNavigationController.h"

@interface XNavigationController ()<UIGestureRecognizerDelegate>

@end

@implementation XNavigationController

- (void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    
    self.navigationController.interactivePopGestureRecognizer.enabled = YES;
  
 
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.interactivePopGestureRecognizer.delegate =  self;

    
//    self.navigationBar.tintColor =  [UIColor whiteColor];
//    self.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor whiteColor]
//    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"nav_bg"] forBarMetrics:UIBarMetricsDefault];
//    self.navigationBar.shadowImage = [[UIImage alloc] init];
    

}


/**   ——————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————
 *  能拦截所有push进来的子控制器
 */
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    
    if (self.viewControllers.count > 0) { // 如果现在push的不是栈底控制器(最先push进来的那个控制器)
        
        viewController.hidesBottomBarWhenPushed = YES;
    }
    
    [super pushViewController:viewController animated:animated];
    
    
    if (self.viewControllers.count > 1) {
        
        // 设置返回按钮的背景图片
        UIImage *backImage = [UIImage imageNamed:@"back"];
        
        if (self.viewControllers.count > 1) { // 如果现在push的不是栈底控制器(最先push进来的那个控制器)
            
            // 设置导航栏按钮
            viewController.navigationItem.leftBarButtonItem =[[UIBarButtonItem alloc] initWithImage:backImage style:UIBarButtonItemStylePlain target:self action:@selector(back)];
            viewController.navigationItem.leftBarButtonItem.imageInsets = UIEdgeInsetsMake(0, -5, 0, 0);
        }
        
     }
    
}



- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    
    if (self.viewControllers.count <= 1 ) {
        
        
        return NO;
    }
    
    return YES;
}


-(void)back{

    [self popViewControllerAnimated:YES];
}


//- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
//{
//    if (self.childViewControllers.count == 1)
//    {
//        return NO;
//    }
//    
//    return YES;
//}



@end
