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
    UIImage *thumbImageNormal = [UIImage imageNamed:@"SliderThumb-Normal"];
    [self.slider setThumbImage:thumbImageNormal forState:UIControlStateNormal];
    
    UIImage *thumbImageHighlighted = [UIImage imageNamed:@"SliderThumb-Highlighted"];
    [self.slider setThumbImage:thumbImageHighlighted forState:UIControlStateHighlighted];
    
    UIImage *trackLeftImage = [[UIImage imageNamed:@"SliderTrackLeft"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 14, 0, 14)];
    [self.slider setMinimumTrackImage:trackLeftImage forState:UIControlStateNormal];
    
    UIImage *trackRightImage = [[UIImage imageNamed:@"SliderTrackRight"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 14, 0, 14)];
    [self.slider setMaximumTrackImage:trackRightImage forState:UIControlStateNormal];
    
    [super viewDidLoad];
    [self startNewGame];
    [self updateLabels];
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
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
    
    NSString *title;
    if(difference == 0) {
        title = @"Perfect!";
        points += 100;
    }else if(difference < 5) {
        title = @"You almost did it!";
        if(difference == 1) {
            points += 50;
        }
    }else if (difference < 10) {
        title = @"Pretty good!";
    }else {
        title = @"Not event close..";
    }
    
    _score += points;
    
    NSString *message = [NSString stringWithFormat:@"You scored %d points", points];
    UIAlertView *alertView = [[UIAlertView alloc]
                              initWithTitle:title
                              message:message
                              delegate:self
                              cancelButtonTitle:@"OK"
                              otherButtonTitles:nil];
    
    [alertView show];
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{

    [self startNewRound];
    [self updateLabels];
}

- (IBAction)sliderMoved:(UISlider *)slider
{
    _currentValue = lroundf(slider.value);
}
- (IBAction)startOver
{
    [self startNewGame];
    [self updateLabels];
}

- (void)startNewGame
{
    _score = 0;
    _round = 0;
    [self startNewRound];
}

@end
