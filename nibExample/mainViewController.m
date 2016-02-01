//
//  mainViewController.m
//  nibExample
//
//  Created by Centrikal 3 on 1/28/16.
//  Copyright © 2016 Andre. All rights reserved.
//

#import "mainViewController.h"
#import "AppDelegate.h"


@interface mainViewController ()
//@property (weak, nonatomic) IBOutlet UINavigationItem *navItem;
@property (assign, nonatomic) BOOL isComboOpen;

@end

@implementation mainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.isComboOpen = NO;
    // Do any additional setup after loading the view.
    //UIImageView* img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"user_mini.png"]];
    //self.navItem.titleView = img;
    
    self.data = [[NSArray alloc] initWithObjects:@"Value1",@"Value2",@"Value3",@"Value4", nil];
    self.tableCombo.delegate = self;
    self.tableCombo.dataSource = self;
    
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)showDrawer:(id)sender {
    
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];

    [appDelegate.drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [self.data count];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    
    
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
        
    }
    
    
    cell.textLabel.text = [self.data objectAtIndex:indexPath.row] ;
    
    //cell.textLabel.font = [UIFont systemFontOfSize:11.0];
    
    
    return cell;
    
    
    
}





- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    UITableViewCell *cell = [self.tableCombo cellForRowAtIndexPath:indexPath];
    [self.btnCombo setTitle:cell.textLabel.text forState:UIControlStateNormal];
    
    
    [UIView animateWithDuration:0.33 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            self.tableCombo.frame = CGRectMake(self.btnCombo.frame.origin.x, self.btnCombo.frame.origin.y+ self.btnCombo.frame.size.height, self.btnCombo.frame.size.width, 0);
        
        
    }completion:nil];
    
    self.isComboOpen = NO;
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)btnAction:(id)sender {
    
    
    NSLog(self.isComboOpen ? @"TRUE" : @"False");
    
    
    [UIView animateWithDuration:0.33 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
        if(self.isComboOpen){
            NSLog(@"Cerrando");
            self.tableCombo.frame = CGRectMake(self.btnCombo.frame.origin.x, self.btnCombo.frame.origin.y+ self.btnCombo.frame.size.height, self.btnCombo.frame.size.width, 0);
        }else{
            NSLog(@"Abriendo");
            self.tableCombo.frame = CGRectMake(self.btnCombo.frame.origin.x, self.btnCombo.frame.origin.y+ self.btnCombo.frame.size.height, self.btnCombo.frame.size.width, 130);
        }
        
    }completion:nil];
    
    [self.view bringSubviewToFront:self.tableCombo];
    
    /**/
    
    
    
    self.isComboOpen = !self.isComboOpen;
    
}
@end
