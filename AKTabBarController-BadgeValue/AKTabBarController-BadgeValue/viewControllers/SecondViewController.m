//
//  SecondViewController.m
//  AKTabBarController-BadgeValue
//
//  Created by doujingxuan on 13-12-4.
//  Copyright (c) 2013年 doujingxuan. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Second";
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
	return @"image-2";
}

- (NSString *)activeTabImageName
{
	return @"image-2-active";
}

- (NSString *)tabTitle
{
	return self.title;
}

@end
