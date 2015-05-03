//
//  ViewController.m
//  BullsEye
//
//  Created by danyang on 15/5/3.
//  Copyright (c) 2015年 dan yang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
{
    int _currentValue; // instance variable or ivar for short
    int _targetValue;
    int _score;
    int _round;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self startNewRound];
    [self updateLabels];
}



- (void)startNewRound
{
    _round += 1;
    _targetValue = 1 + arc4random_uniform(100);
    _currentValue = 50;
    self.slider.value = _currentValue;
}

- (void)updateLabels
{
    self.targetLabel.text = [NSString stringWithFormat:@"%d", _targetValue];
    self.scoreLabel.text = [NSString stringWithFormat:@"%d", _score];
    self.roundLabel.text = [NSString stringWithFormat:@"%d", _round];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)showAlert
{
    int difference = abs(_targetValue - _currentValue);
    int points = 100 - difference;
    _score += points;
    
    NSString *message = [NSString stringWithFormat:@"You scored %d points", points];
    UIAlertView *alertView = [[UIAlertView alloc]
                              initWithTitle:@"Hello World"
                              message:message
                              delegate:nil
                              cancelButtonTitle:@"OK"
                              otherButtonTitles:nil];
    
    [alertView show];
    
    [self startNewRound];
    [self updateLabels];
}

- (IBAction)sliderMoved:(UISlider *)slider
{
    _currentValue = lroundf(slider.value);
}

@end
