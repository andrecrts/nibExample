//
//  detailVC.m
//  nibExample
//
//  Created by Centrikal 3 on 1/27/16.
//  Copyright © 2016 Andre. All rights reserved.
//

#import "detailVC.h"

@interface detailVC ()
@property (weak, nonatomic) IBOutlet UILabel *lblName;

@end

@implementation detailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.lblName.text = [NSString stringWithFormat:@"Nombre: %@",self.codeDetail];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
