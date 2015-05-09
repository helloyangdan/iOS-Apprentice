//
//  ListDetailViewController.h
//  Checklists
//
//  Created by danyang on 15/5/9.
//  Copyright (c) 2015年 dan yang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IconPickerViewController.h"

@class ListDetailViewController;
@class Checklist;

@protocol ListDetailViewControllerDelegate <NSObject>

- (void)listDetailViewControllerDidCancel:(ListDetailViewController *)controller;

- (void)listDetailViewControllerDidCancel:(ListDetailViewController *)controller didFinishAddingChecklist:(Checklist *)checklist;

- (void)listDetailViewControllerDidCancel:(ListDetailViewController *)controller didFinishEditingChecklist:(Checklist *)checklist;

@end

@interface ListDetailViewController : UITableViewController<UITextFieldDelegate ,IconPickerViewControllerDelegate>

@property (nonatomic, weak) IBOutlet UITextField *textField;
@property (nonatomic, weak) IBOutlet UIBarButtonItem *doneBarButton;

@property (nonatomic, weak) id<ListDetailViewControllerDelegate> delegate;
@property (nonatomic, strong) Checklist *checklistToEdit;
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;

- (IBAction)cancel;
- (IBAction)done;

@end
