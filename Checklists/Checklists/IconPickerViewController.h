//
//  IconPickerViewController.h
//  Checklists
//
//  Created by danyang on 15/5/9.
//  Copyright (c) 2015年 dan yang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class IconPickerViewController;

@protocol IconPickerViewControllerDelegate <NSObject>

- (void)iconPicker:(IconPickerViewController *)picker didPickIcon:(NSString *)iconName;

@end

@interface IconPickerViewController : UITableViewController

@property (nonatomic, weak) id <IconPickerViewControllerDelegate> delegate;

@end
