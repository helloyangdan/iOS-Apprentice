//
//  HudView.h
//  MyLocations
//
//  Created by danyang on 15/5/14.
//  Copyright (c) 2015年 dan yang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HudView : UIView

+ (instancetype)hudInView:(UIView *)view animated:(BOOL)animated;

@property (nonatomic, strong) NSString *text;

@end
