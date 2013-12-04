//
//  UIView+UU.h
//  XFTIOSClinet
//
//  Created by doujingxuan on 13-11-11.
//  Copyright (c) 2013年 doujingxuan. All rights reserved.
//

//
//  UIView+UU.h
//  UUIphoneClientFrame
//
//  Created by YTF YUTONGFEI on 12-1-24.
//  Copyright 2012年 NO. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface UIView (UIView_UU)
/**
 * Shortcut for frame.origin.x.
 *
 * Sets frame.origin.x = left
 */
@property (nonatomic) CGFloat left;

/**
 * Shortcut for frame.origin.y
 *
 * Sets frame.origin.y = top
 */
@property (nonatomic) CGFloat top;

/**
 * Shortcut for frame.origin.x + frame.size.width
 *
 * Sets frame.origin.x = right - frame.size.width
 */
@property (nonatomic) CGFloat right;

/**
 * Shortcut for frame.origin.y + frame.size.height
 *
 * Sets frame.origin.y = bottom - frame.size.height
 */
@property (nonatomic) CGFloat bottom;

/**
 * Shortcut for frame.size.width
 *
 * Sets frame.size.width = width
 */
@property (nonatomic) CGFloat width;

/**
 * Shortcut for frame.size.height
 *
 * Sets frame.size.height = height
 */
@property (nonatomic) CGFloat height;

/**
 * Shortcut for center.x
 *
 * Sets center.x = centerX
 */
@property (nonatomic) CGFloat centerX;

/**
 * Shortcut for center.y
 *
 * Sets center.y = centerY
 */
@property (nonatomic) CGFloat centerY;

//// 创建透明背景的view
//+(UIView*) createTransparentViewWithFrame:(CGRect) frame;
//
//// 创建一个包含边框以及背景图片的view
//+(UIView*) createBorderViewWithFrame:(CGRect) frame WithBorderWidth:(CGFloat)boderWidth withBorderColor:(UIColor *) borderColor withAngle:(CGFloat) angle withBackgroundImage:(UIImage*) backgroundImage withBackgroundColor:(UIColor*) backgroundColor;
//
//// 创建一个包含边框样式的view
//+(UIView*) createBorderViewWithFrame:(CGRect) frame withBorderWidth:(CGFloat) borderWidth withBorderColor:(UIColor*) borderColor withAngle:(CGFloat) angle;
//
//// 创建一个包含背景颜色的view
//+(UIView*) createViewWithFrame:(CGRect) frame WithBackgroundColor:(UIColor*) backgroundColor;
//
//// 创建一个包含背景图片的view
//+(UIView*) createViewWithFrame:(CGRect) frame WithBackgroundImage:(UIImage*) backgroundImage;
//
//-(void) updateControlsPerpertyAndLayout:(id) object;

@end
