//
//  XNetWork.m
//  OfferDemo
//
//  Created by xuewuguojie on 16/8/16.
//  Copyright © 2016年 xuewuguojie. All rights reserved.
//

#import "XNetWork.h"
#import <sys/utsname.h>

@interface XNetWork ()
@property(nonatomic,strong)AFHTTPRequestOperationManager *manager;

@end

@implementation XNetWork

+ (XNetWork *)defaultNetWork {
    static dispatch_once_t pred;
    __strong static id sharedInstance = nil;
    
    dispatch_once(&pred, ^{
        
        sharedInstance = [[XNetWork alloc] init];
        
        
    });
    
    return sharedInstance;
}


- (instancetype)init
{
    self = [super init];
    if (self) {
        
         [self makeManager];
    }
    return self;
}


-(void)makeManager
{
    
    // 1.获得请求管理者
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    self.manager = manager;
    manager.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingMutableContainers];
    
    
    [manager.requestSerializer setValue:@"UTF-8" forHTTPHeaderField:@"Accept-Charset"];
    
    NSString *bundleName = [[NSBundle mainBundle] infoDictionary][@"CFBundleName"];
    
    bundleName = [bundleName stringByReplacingOccurrencesOfString:@" " withString:@"_"];
    
    NSString *version = [[NSBundle mainBundle] infoDictionary][@"CFBundleShortVersionString"];
    
    struct utsname systemInfo;
    
    uname(&systemInfo);
    
    NSString *userAgent = [NSString stringWithFormat:@"%@/%@ %@/%@", bundleName, version,
                           @(systemInfo.machine), [[UIDevice currentDevice] systemVersion]];
    
    [manager.requestSerializer setValue:userAgent forHTTPHeaderField:@"User-Agent"];
    
    
}


- (void)getDataSourceWithpath:(NSString *)path parameters:(id)parameters success:(APIClientSuccessBlock)successBlock failure:(APIClientFailureBlock)failureBlock{

    [self.manager GET:path parameters:parameters
     
              success:^(AFHTTPRequestOperation *operation, id respont) {
                  
                  NSLog(@"请求成功  forHTTPHeaderField : %@ ", operation.response);
                  
                  successBlock(operation.response.statusCode,respont);
                  
              }
              failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                  
                  NSLog(@"请求失败    forHTTPHeaderField : %@   error : %@", operation.response,error);
                  
              }];
    
}





@end


