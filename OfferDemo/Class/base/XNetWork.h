//
//  XNetWork.h
//  OfferDemo
//
//  Created by xuewuguojie on 16/8/16.
//  Copyright © 2016年 xuewuguojie. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void ( ^APIClientSuccessBlock ) ( NSInteger statusCode , id response );
typedef void ( ^APIClientFailureBlock ) ( NSInteger statusCode , NSError *error );

@interface XNetWork : NSObject
+ (XNetWork *)defaultNetWork;

- (void)getDataSourceWithpath:(NSString *)path parameters:(id)parameters success:(APIClientSuccessBlock)successBlock failure:(APIClientFailureBlock)failureBlock;
//-(void)method:(NSString *)method Path:(NSString *)path parameters:(id)parameters  success:(APIClientSuccessBlock)successBlock failure:(APIClientFailureBlock)failureBlock;
//- (void)postDataSourceWithpath:(NSString *)path parameters:(id)parameters success:(APIClientSuccessBlock)successBlock failure:(APIClientFailureBlock)failureBlock;


@end
