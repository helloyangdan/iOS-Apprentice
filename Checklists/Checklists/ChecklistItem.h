//
//  ChecklistItem.h
//  Checklists
//
//  Created by danyang on 15/5/4.
//  Copyright (c) 2015年 dan yang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ChecklistItem : NSObject<NSCoding>

@property (nonatomic, copy) NSString *text;
@property (nonatomic, assign) BOOL checked;

@property (nonatomic, copy) NSDate *dueDate;
@property (nonatomic, assign) BOOL shouldRemind;
@property (nonatomic, assign) NSInteger itemId;

- (void)toggleChecked;
- (void)scheduleNotification;

@end
