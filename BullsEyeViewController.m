//
//  BullsEyeViewController.m
//  BullsEye
//
//  Created by Alex Cevallos on 1/31/14.
//  Copyright (c) 2014 com.AlexCevallos. All rights reserved.
//

#import "BullsEyeViewController.h"

@interface BullsEyeViewController ()

@end

@implementation BullsEyeViewController

{
    int _currentValue;
    int _targetValue;
    int _score;
    int _round;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(IBAction)showAlert
{
    
    int difference = abs(_targetValue - _currentValue);
    int points = 100 - difference;
    
    NSString *title;
    if (difference == 0){
        title = @"Perfect!";
        points += 100;
    }else if(difference < 5){
        title = @"You almost had it!";
        if (difference == 1){
            points += 50;
        }
    }else if(difference < 10){
        title = @"Pretty good!";
    }else{
        title = @"Not even close..";
    }
    
    _score += points;
    
    NSString *message = [NSString stringWithFormat:@"You scored %d points!", points];
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title message:message delegate:self cancelButtonTitle:@"awesome" otherButtonTitles:nil];
    [alertView show];
   
}

-(IBAction)sliderMoved:(UISlider *)slider
{
    _currentValue = lroundf(slider.value);
}

-(void)startNewRound
{
    _round += 1;
    _targetValue = 1 + arc4random_uniform(100);
    _currentValue = 50;
    self.slider.value = _currentValue;
}

-(void)updateLabels
{
    self.targetLabel.text = [NSString stringWithFormat:@"%d", _targetValue];
    self.scoreLabel.text = [NSString stringWithFormat:@"%d", _score];
    self.roundLabel.text = [NSString stringWithFormat:@"%d", _round];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self startNewGame];
    [self updateLabels];
}

-(IBAction)startOver
{
    [self startNewGame];
    [self updateLabels];
}

-(void)startNewGame
{
    _score = 0;
    _round = 0;
    [self startNewRound];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    [self startNewRound];
    [self updateLabels];
}


@end
