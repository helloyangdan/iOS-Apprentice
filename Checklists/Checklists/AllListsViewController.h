//
//  AllListsViewController.h
//  Checklists
//
//  Created by danyang on 15/5/9.
//  Copyright (c) 2015年 dan yang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ListDetailViewController.h"

@class DataModel;

@interface AllListsViewController : UITableViewController<ListDetailViewControllerDelegate,
        UINavigationControllerDelegate>

@property (nonatomic, strong) DataModel *dataModel;

@end
