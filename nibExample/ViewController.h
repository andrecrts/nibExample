//
//  ViewController.h
//  nibExample
//
//  Created by Centrikal 3 on 1/27/16.
//  Copyright © 2016 Andre. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property(strong, nonatomic) NSMutableArray *views;
@property(weak, nonatomic) NSNumber *selectedDetail;


- (IBAction) showCompanyDetail:(UIButton *)senderl;
@end

