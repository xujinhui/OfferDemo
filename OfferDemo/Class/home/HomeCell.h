//
//  HomeCell.h
//  OfferDemo
//
//  Created by xuewuguojie on 16/8/17.
//  Copyright © 2016年 xuewuguojie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeCell : UITableViewCell
@property(nonatomic,strong)NSDictionary *item;
+(instancetype)cellWithTableView:(UITableView *)tableView;
@end
