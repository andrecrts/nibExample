//
//  ViewController.m
//  nibExample
//
//  Created by Centrikal 3 on 1/27/16.
//  Copyright © 2016 Andre. All rights reserved.
//

#import "ViewController.h"
#import "MyViewController.h"
#import "sliderView.h"
#import "detailVC.h"

@interface ViewController ()

@end

@implementation ViewController


- (void)loadView{
    [super loadView];
    
    self.views = [[NSMutableArray alloc]init];
    
    for(int i =0; i <9; i++)
    {
       sliderView *nibContents = [[sliderView alloc] initWithNibName:@"sliderView" bundle:nil];
        [self.views addObject:nibContents];
    }
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
    
    UIScrollView *scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(5, 10, self.view.frame.size.width-10, self.view.frame.size.height-10)];
    scroll.backgroundColor = [UIColor whiteColor];
    scroll.pagingEnabled = NO;
    int separationX = 0;
    int separationY = 0;
    int numberOfViews = self.views.count;
    int column = 2;
    int row = (numberOfViews % column == 0)? (numberOfViews/column) : ((numberOfViews/column) + 1);
    
    int count = 1;
    int xMax = 0;
    int yMax = 0;
    
    sliderView *thumbnailVC = nil;
    for (int i = 1; i <= row; i++) {
        for (int j = 1; j <= column; j++) {
            if (count <= numberOfViews) {
                thumbnailVC = (sliderView*)[self.views objectAtIndex:count-1];
                int x = (j-1)*thumbnailVC.view.frame.size.width + separationX;
                int y = (i-1)*thumbnailVC.view.frame.size.height + separationY;
                xMax = (xMax>x)?xMax:x;
                yMax = (yMax>y)?yMax:y;
                thumbnailVC.gtitle.text =[NSString stringWithFormat:@"thumb %d",count];
                thumbnailVC.nameSlider =[NSString stringWithFormat:@"thumb %d",count];
                thumbnailVC.buttonSlider.tag = count;
                [thumbnailVC.buttonSlider addTarget:self
                                             action:@selector(showCompanyDetail:)
                   forControlEvents:UIControlEventTouchUpInside];
                
                [scroll addSubview:thumbnailVC.view];
                thumbnailVC.view.frame	= CGRectMake(x, y, thumbnailVC.view.frame.size.width, thumbnailVC.view.frame.size.height);
            } else {
                break;
            }
            count++;
        }
    }
    
    scroll.contentSize = CGSizeMake(xMax + thumbnailVC.view.frame.size.width, yMax + thumbnailVC.view.frame.size.height);
    [self.view addSubview:scroll];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/*- (IBAction)showViewControllerPressed:(id)sender {
    NSLog(@"Show view Controller Pressed");
    MyViewController *myViewController =[[MyViewController alloc]init];
    myViewController.dataArray = [@[@"Bob",@"Sue",@"Joseph"] mutableCopy];
    [self presentViewController:myViewController animated:TRUE completion:nil];
}*/


- (IBAction) showCompanyDetail:(UIButton *)senderl{
    
    
    
    NSInteger test = senderl.tag;
    self.selectedDetail = [NSNumber numberWithInteger:test];
    NSLog(@"lfksdl %@",self.selectedDetail);
    [self performSegueWithIdentifier:@"segueToDetail" sender:self];
    
    
    
    /*detailVC *viewController = [[detailVC alloc] init];
    viewController.nameDetail = @"kdks";//self.nameSlider;
    [self presentViewController:viewController animated:YES completion:nil];*/
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"segueToDetail"]) {
        detailVC* detailViewController = [segue destinationViewController];
        detailViewController.codeDetail = self.selectedDetail;
    }
}

@end
