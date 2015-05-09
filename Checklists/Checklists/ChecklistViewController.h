//
//  ViewController.h
//  Checklists
//
//  Created by danyang on 15/5/4.
//  Copyright (c) 2015年 dan yang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ItemDetailViewController.h"

@class Checklist;

@interface ChecklistViewController : UITableViewController<ItemDetailViewControllerDelegate>

@property (nonatomic, strong) Checklist *checklist;

@end

