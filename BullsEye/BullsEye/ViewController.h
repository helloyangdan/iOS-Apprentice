//
//  ViewController.h
//  BullsEye
//
//  Created by danyang on 15/5/3.
//  Copyright (c) 2015年 dan yang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic, weak) IBOutlet UISlider *slider;
@property (nonatomic, weak) IBOutlet UILabel *targetLabel;
@property (nonatomic, weak) IBOutlet UILabel *scoreLabel;
@property (nonatomic, weak) IBOutlet UILabel *roundLabel;

- (IBAction)showAlert;
- (IBAction)sliderMoved:(UISlider *)slider;

@end

