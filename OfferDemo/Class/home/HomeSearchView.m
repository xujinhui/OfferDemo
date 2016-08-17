//
//  HomeSearchView.m
//  myOffer
//
//  Created by xuewuguojie on 16/4/13.
//  Copyright © 2016年 UVIC. All rights reserved.
//

#import "HomeSearchView.h"

@implementation HomeSearchView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.LeftBtn =[self makeButtonWithImageName:@"search_darkgrey"  andTitle:@""];
        self.LeftBtn.imageView.contentMode = UIViewContentModeScaleAspectFit;
        self.LeftBtn.hidden = YES;
        
        self.RightBtn =[self makeButtonWithImageName:@"search_darkgrey"  andTitle:@"搜索名校"];
        self.RightBtn.titleEdgeInsets = UIEdgeInsetsMake(0,0, 0, 0);
        self.layer.cornerRadius = 5;
        self.backgroundColor = [UIColor whiteColor];
        
    }
    return self;
}

-(UIButton *)makeButtonWithImageName:(NSString *)imageName andTitle:(NSString *)title
{
    UIButton *sender =[[UIButton alloc] init];
    [sender setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [sender setTitle:title forState:UIControlStateNormal];
    [sender setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    sender.titleLabel.font = [UIFont systemFontOfSize:13];
    [sender addTarget:self action:@selector(tap) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:sender];
    
    return sender;
}

-(void)tap{
   
    if (self.actionBlock) {
        
        self.actionBlock();
        
    }
}

+(instancetype)View
{
    CGFloat searchX = 20;
    CGFloat searchH = 44;
    CGFloat searchW = SCREEN_WIDTH - 40;
    CGFloat searchY = 64;
    return [[self alloc] initWithFrame:CGRectMake(searchX,searchY,searchW, searchH)];
}


-(void)layoutSubviews
{
    [super layoutSubviews];
    
    
    CGFloat LeftH = self.bounds.size.height;
    CGFloat LeftW = LeftH;
    self.LeftBtn.frame = CGRectMake(0, 0, LeftW, LeftH);
    
    CGFloat RightX = 0;
    CGFloat RightY = 0;
    CGFloat RightW = self.bounds.size.width - RightX;
    CGFloat RightH = LeftH;
    self.RightBtn.frame = CGRectMake(RightX, RightY, RightW, RightH);
    
    
}

-(void)searchViewWithScrollViewDidScrollContentOffsetY:(CGFloat)contentOffsetY;
{

    CGFloat contant = 64 - contentOffsetY;
    
    if (contant > 64) {
        
        self.top = contant;
        
        [self searchViewWithAnimation:YES];
        
    }else{
        
        
        self.top = 64;
        
        if (self.frame.origin.y == 64) {
            
            [self  searchViewWithAnimation:NO];
        }
    }
    
}


-(void)searchViewWithAnimation:(BOOL)animated
{
    self.LeftBtn.hidden  = animated;
    self.RightBtn.hidden = !animated;
    [UIView animateWithDuration:0.25 animations:^{
        
        self.width = animated ? (SCREEN_WIDTH - 40) : 44;
        
        self.layer.cornerRadius = animated ? 5.0f : 22.0f;
    }];
    
}


@end
