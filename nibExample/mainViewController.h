//
//  mainViewController.h
//  nibExample
//
//  Created by Centrikal 3 on 1/28/16.
//  Copyright © 2016 Andre. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface mainViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UIButton *btnCombo;
@property (weak, nonatomic) IBOutlet UITableView *tableCombo;
@property (strong, nonatomic) NSArray *data;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *comboHeight;

- (IBAction)btnAction:(id)sender;

@end
