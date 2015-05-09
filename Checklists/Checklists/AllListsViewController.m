//
//  AllListsViewController.m
//  Checklists
//
//  Created by danyang on 15/5/9.
//  Copyright (c) 2015年 dan yang. All rights reserved.
//

#import "AllListsViewController.h"
#import "Checklist.h"
#import "ChecklistItem.h"
#import "ChecklistViewController.h"
#import "DataModel.h"

@interface AllListsViewController ()

@end

@implementation AllListsViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.delegate = self;
    NSInteger index = [self.dataModel indexOfSelectedChecklist];
    if (index >=0 && index < [self.dataModel.lists count]) {
        Checklist *checklist = self.dataModel.lists[index];
        [self performSegueWithIdentifier:@"ShowChecklist" sender:checklist];
    }
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataModel.lists count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    Checklist *checklist = self.dataModel.lists[indexPath.row];
    cell.textLabel.text = checklist.name;
    cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    
    int count = [checklist countUncheckedItems];
    
    if ([checklist.items count] == 0) {
        cell.detailTextLabel.text = @"(No Items)";
    } else if (count == 0) {
        cell.detailTextLabel.text = @"All Done";
    } else {
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%d Remaining", [checklist countUncheckedItems]];
    }
    
    cell.imageView.image = [UIImage imageNamed:checklist.iconName];

    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.dataModel setIndexOfSelectedChecklist:indexPath.row];
    
    Checklist *checklist = self.dataModel.lists[indexPath.row];
    [self performSegueWithIdentifier:@"ShowChecklist" sender:checklist];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"ShowChecklist"]) {
         ChecklistViewController *controller = segue.destinationViewController;
         controller.checklist = sender;
    }
    else if ([segue.identifier isEqualToString:@"AddChecklist"]) {
        UINavigationController *navigationController = segue.destinationViewController;
        ListDetailViewController *controller = (ListDetailViewController *)navigationController.topViewController;
        
        controller.delegate = self;
        controller.checklistToEdit = nil;
    }
}


- (void)listDetailViewControllerDidCancel:(ListDetailViewController *)controller
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)listDetailViewControllerDidCancel:(ListDetailViewController *)controller didFinishAddingChecklist:(Checklist *)checklist
{
    
    [self.dataModel.lists addObject:checklist];
    
    [self.dataModel sortChecklists];
    [self.tableView reloadData];
    

    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)listDetailViewControllerDidCancel:(ListDetailViewController *)controller didFinishEditingChecklist:(Checklist *)checklist
{
    [self.dataModel sortChecklists];
    [self.tableView reloadData];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.dataModel.lists removeObjectAtIndex:indexPath.row];
    
    NSArray *indexPaths = @[indexPath];
    [tableView deleteRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationAutomatic];
}

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    UINavigationController *navigationController = [self.storyboard instantiateViewControllerWithIdentifier:@"ListNavigationController"];
    
    ListDetailViewController *controller = (ListDetailViewController *)navigationController.topViewController;
    controller.delegate = self;
    
    Checklist *checklist = self.dataModel.lists[indexPath.row];
    controller.checklistToEdit = checklist;
    
    [self presentViewController:navigationController animated:YES completion:nil];
}

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (viewController == self) {
        [self.dataModel setIndexOfSelectedChecklist:-1];
    }
}

@end
