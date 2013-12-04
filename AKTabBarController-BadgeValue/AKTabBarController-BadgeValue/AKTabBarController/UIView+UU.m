//
//  UIView+UU.m
//  XFTIOSClinet
//
//  Created by doujingxuan on 13-11-11.
//  Copyright (c) 2013年 doujingxuan. All rights reserved.
//

#import "UIView+UU.h"

@implementation UIView (UIView_UU)

///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGFloat)left {
    return self.frame.origin.x;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setLeft:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGFloat)top {
    return self.frame.origin.y;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setTop:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGFloat)right {
    return self.frame.origin.x + self.frame.size.width;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setRight:(CGFloat)right {
    CGRect frame = self.frame;
    frame.origin.x = right - frame.size.width;
    self.frame = frame;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGFloat)bottom {
    return self.frame.origin.y + self.frame.size.height;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setBottom:(CGFloat)bottom {
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGFloat)centerX {
    return self.center.x;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setCenterX:(CGFloat)centerX {
    self.center = CGPointMake(centerX, self.center.y);
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGFloat)centerY {
    return self.center.y;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setCenterY:(CGFloat)centerY {
    self.center = CGPointMake(self.center.x, centerY);
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGFloat)width {
    return self.frame.size.width;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setWidth:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGFloat)height {
    return self.frame.size.height;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setHeight:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}


// 创建透明背景的view
+(UIView*) createTransparentViewWithFrame:(CGRect) frame
{
    UIView* shbView = [self createBorderViewWithFrame:frame WithBorderWidth:0 withBorderColor:nil withAngle:0 withBackgroundImage:nil withBackgroundColor:[UIColor clearColor]];
    return shbView;
}


+(UIView*) createBorderViewWithFrame:(CGRect)frame WithBorderWidth:(CGFloat)boderWidth withBorderColor:(UIColor *)borderColor withAngle:(CGFloat)angle withBackgroundImage:(UIImage *)backgroundImage withBackgroundColor:(UIColor *)backgroundColor
{
    UIView* shbView = [[self alloc] initWithFrame:frame];
    if(shbView)
    {
        // 设置图层相关
        [shbView.layer setMasksToBounds:YES];
        if(boderWidth > 0)
            [shbView.layer setBorderWidth:boderWidth];
        if(angle > 0)
            [shbView.layer setCornerRadius:angle];
        if(borderColor)
            [shbView.layer setBorderColor:borderColor.CGColor];
        // 设置背景相关
        if(backgroundColor)
            [shbView setBackgroundColor:backgroundColor];
        if(backgroundImage)
        {
            UIImageView* backgroundImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, shbView.frame.size.width, shbView.frame.size.height)] ;
            [backgroundImageView setBackgroundColor:[UIColor clearColor]];
            [backgroundImageView setImage:backgroundImage];
            [backgroundImageView setTag:9001];
            [shbView addSubview:backgroundImageView];
            UIColor* color = [UIColor colorWithPatternImage:backgroundImage];
            [shbView setBackgroundColor:color];
        }
    }
    return shbView;
}

//////////////////////////////////////////////////////////////////////////////////////////
+(UIView*) createBorderViewWithFrame:(CGRect)frame withBorderWidth:(CGFloat)borderWidth withBorderColor:(UIColor *)borderColor withAngle:(CGFloat)angle
{
    UIView* shbView = [self createBorderViewWithFrame:frame WithBorderWidth:borderWidth withBorderColor:borderColor withAngle:angle withBackgroundImage:nil withBackgroundColor:[UIColor whiteColor]];
    return shbView;
}

//////////////////////////////////////////////////////////////////////////////////////////
+(UIView*) createViewWithFrame:(CGRect)frame WithBackgroundColor:(UIColor *)backgroundColor
{
    UIView* shbView = [self createBorderViewWithFrame:frame WithBorderWidth:0 withBorderColor:nil withAngle:0 withBackgroundImage:nil withBackgroundColor:backgroundColor];
    return shbView;
}

//////////////////////////////////////////////////////////////////////////////////////////
+(UIView*) createViewWithFrame:(CGRect)frame WithBackgroundImage:(UIImage *)backgroundImage
{
    UIView* shbView = [self createBorderViewWithFrame:frame WithBorderWidth:0 withBorderColor:nil withAngle:0 withBackgroundImage:backgroundImage withBackgroundColor:nil];
    return shbView;
}

//////////////////////////////////////////////////////////////////////////////////////////
-(void) updateControlsPerpertyAndLayout:(id)object{
}
//////////////////////////////////////////////////////////////////////////////////////////
#pragma mark ==========||CreateControlsDelegate||=========
-(void) createControlsWithView
{
}

//////////////////////////////////////////////////////////////////////////////////////////
#pragma mark ==========||UpdateControlsDelegate||=========

@end
