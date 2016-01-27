//
//  sliderView.h
//  nibExample
//
//  Created by Centrikal 3 on 1/27/16.
//  Copyright © 2016 Andre. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface sliderView : UIViewController


@property (strong, nonatomic) IBOutlet UIView *view;
@property (weak, nonatomic) IBOutlet UILabel *gtitle;
@property (weak, nonatomic) NSString *nameSlider;
@property (weak, nonatomic) IBOutlet UIButton *buttonSlider;

@end
