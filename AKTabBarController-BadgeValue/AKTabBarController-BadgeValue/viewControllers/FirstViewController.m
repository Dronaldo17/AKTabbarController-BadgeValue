//
//  FirstViewController.m
//  AKTabBarController-BadgeValue
//
//  Created by doujingxuan on 13-12-4.
//  Copyright (c) 2013年 doujingxuan. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"First";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSString *)tabImageName
{
	return @"image-1";
}

- (NSString *)activeTabImageName
{
	return @"image-1-active";
}

- (NSString *)tabTitle
{
	return self.title;
}

@end
