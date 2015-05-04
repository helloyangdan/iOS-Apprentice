//
//  ChecklistItem.m
//  Checklists
//
//  Created by danyang on 15/5/4.
//  Copyright (c) 2015年 dan yang. All rights reserved.
//

#import "ChecklistItem.h"

@implementation ChecklistItem

- (void)toggleChecked
{
    self.checked = !self.checked;
}

@end
