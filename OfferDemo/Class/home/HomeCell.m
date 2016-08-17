//
//  HomeCell.m
//  OfferDemo
//
//  Created by xuewuguojie on 16/8/17.
//  Copyright © 2016年 xuewuguojie. All rights reserved.
//

#import "HomeCell.h"

@interface HomeCell ()
@property (strong, nonatomic)UIImageView *iconView;

@end

static NSString *identify = @"home";

@implementation HomeCell

+(instancetype)cellWithTableView:(UITableView *)tableView
{
    HomeCell *cell =[tableView dequeueReusableCellWithIdentifier:identify];
    
    if (!cell) {
        
        cell = [[HomeCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
    }
    
    return cell;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self =[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        self.iconView = [[UIImageView alloc] init];
        self.iconView.contentMode = UIViewContentModeScaleToFill;
        [self.contentView addSubview:self.iconView];
        self.iconView.userInteractionEnabled = YES;
        self.iconView.layer.cornerRadius = 6;
        self.iconView.layer.masksToBounds = YES;
        self.iconView.layer.shouldRasterize = YES;
        self.iconView.layer.rasterizationScale = [UIScreen mainScreen].scale;
        
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(click)];
        [self.iconView addGestureRecognizer:tap];
        
    }
    return self;
}

-(void)layoutSubviews{

    [super layoutSubviews];
    
     self.iconView.frame = CGRectMake(10, 0, SCREEN_WIDTH - 20, self.bounds.size.height - 10);
}


-(void)setItem:(NSDictionary *)item{
    
    _item  = item;
    
    
    [self.iconView sd_setImageWithURL:item[@"image"] placeholderImage:[UIImage imageNamed:@"placeHolder"] options:SDWebImageDelayPlaceholder progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
    }];
    
}

-(void)click{
    
    NSLog(@"---------%@--",self.item[@"search"]);
}



@end
