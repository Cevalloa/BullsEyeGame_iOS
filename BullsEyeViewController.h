//
//  BullsEyeViewController.h
//  BullsEye
//
//  Created by Alex Cevallos on 1/31/14.
//  Copyright (c) 2014 com.AlexCevallos. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BullsEyeViewController : UIViewController <UIAlertViewDelegate>

@property (nonatomic, weak) IBOutlet UISlider *slider;
@property (nonatomic, weak) IBOutlet UILabel *targetLabel;
@property (nonatomic, weak) IBOutlet UILabel *scoreLabel;
@property (nonatomic, weak) IBOutlet UILabel *roundLabel;

-(IBAction)showAlert;
-(IBAction)sliderMoved:(UISlider *)slider;
-(IBAction)startOver;

@end
