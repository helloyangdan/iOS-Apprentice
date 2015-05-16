//
//  LocationDetailsViewController.h
//  MyLocations
//
//  Created by danyang on 15/5/12.
//  Copyright (c) 2015年 dan yang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface LocationDetailsViewController : UITableViewController

@property (nonatomic, assign) CLLocationCoordinate2D coordinate;
@property (nonatomic, assign) CLPlacemark *placemark;

@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;
@end
