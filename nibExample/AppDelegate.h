//
//  AppDelegate.h
//  nibExample
//
//  Created by Centrikal 3 on 1/27/16.
//  Copyright © 2016 Andre. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MMDrawerController.h"
#import "mainViewController.h"
#import "sideViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) MMDrawerController* drawerController;
@property (strong, nonatomic) UINavigationController* mainController;
@property (strong, nonatomic) sideViewController* sideController;


@end

