//
//  FourthViewController.m
//  AKTabBarController-BadgeValue
//
//  Created by doujingxuan on 13-12-4.
//  Copyright (c) 2013年 doujingxuan. All rights reserved.
//

#import "FourthViewController.h"

@interface FourthViewController ()

@end

@implementation FourthViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Fourth";
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
	return @"image-4";
}

- (NSString *)activeTabImageName
{
	return @"image-4-active";
}

- (NSString *)tabTitle
{
	return self.title;
}

@end
