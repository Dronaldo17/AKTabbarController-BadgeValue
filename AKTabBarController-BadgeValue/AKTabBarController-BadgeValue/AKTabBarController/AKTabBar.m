// AKTabBar.m
//
// Copyright (c) 2012 Ali Karagoz (http://alikaragoz.net)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "AKTabBar.h"

static int kInterTabMargin = 1;
static int kTopEdgeWidth   = 1;

@implementation AKTabBar

#pragma mark - Initialization

- (id)initWithFrame:(CGRect)frame
        fixedHeight:(BOOL)hasFixedHeight
           position:(AKTabBarPosition)position
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.userInteractionEnabled = YES;
        self.contentMode = UIViewContentModeRedraw;
        self.opaque = YES;
        
        int mask = UIViewAutoresizingFlexibleWidth;
        if(!hasFixedHeight) {
            mask |= UIViewAutoresizingFlexibleHeight;
        }
        if(position == AKTabBarPositionBottom) {
            mask |= UIViewAutoresizingFlexibleTopMargin;
        } else {
            mask |= UIViewAutoresizingFlexibleBottomMargin;
        }
        self.autoresizingMask = mask;
    }
    return self;
}

#pragma mark - Setters and Getters

- (void)setTabs:(NSArray *)array
{
    if (_tabs != array) {
        for (AKTab *tab in _tabs) {
            [tab removeFromSuperview];
        }
        
        _tabs = array;
        
        for (AKTab *tab in _tabs) {
            tab.userInteractionEnabled = YES;
            [tab addTarget:self action:@selector(tabSelected:) forControlEvents:UIControlEventTouchUpInside];
        }
    }
    [self setNeedsLayout];
}

- (void)setSelectedTab:(AKTab *)selectedTab
{
    if (selectedTab != _selectedTab) {
        [_selectedTab setSelected:NO];
        _selectedTab = selectedTab;
        [_selectedTab setSelected:YES];
    }
}

#pragma mark - Delegate notification

- (void)tabSelected:(AKTab *)sender
{
    [self setNeedsDisplay];
    [_delegate tabBar:self didSelectTabAtIndex:[_tabs indexOfObject:sender]];
}


#pragma mark - Drawing & Layout

- (void)drawRect:(CGRect)rect
{
    // Drawing the tab bar background
	CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // Draw individual backgrounds
    for (AKTab *tab in _tabs) {
        CGRect tabRect = CGRectMake(tab.frame.origin.x, kTopEdgeWidth, tab.frame.size.width, rect.size.height);
        [tab drawBackground:ctx inRect:tabRect];
    }
    
    // Drawing the gradient
    CGContextSaveGState(ctx);
    {
        // We set the parameters of the gradient multiply blend
        size_t num_locations = 2;
        CGFloat locations[2] = {0.0, 1.0};
        CGFloat components[8] = {0.9, 0.9, 0.9, 1.0,    // Start color
            0.2, 0.2, 0.2, 0.8};    // End color
        
        CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
        CGGradientRef gradient = _tabColors ? CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)_tabColors, locations) : CGGradientCreateWithColorComponents (colorSpace, components, locations, num_locations);
        CGContextSetBlendMode(ctx, kCGBlendModeMultiply);
        CGContextDrawLinearGradient(ctx, gradient, CGPointMake(0, 0), CGPointMake(0, rect.size.height), kCGGradientDrawsAfterEndLocation);
        
        CGColorSpaceRelease(colorSpace);
        CGGradientRelease(gradient);
    }
    CGContextRestoreGState(ctx);
    
    // Drawing the top dark emboss
    UIColor *topEdgeColor = _topEdgeColor;
    if (!topEdgeColor) {
        topEdgeColor = _edgeColor ?: [UIColor colorWithRed:.1f green:.1f blue:.1f alpha:.8f];
    }
    
    CGContextSaveGState(ctx);
    {
        CGContextSetFillColorWithColor(ctx, topEdgeColor.CGColor);
        CGContextFillRect(ctx, CGRectMake(0, 0, rect.size.width, kTopEdgeWidth));
    }
    CGContextRestoreGState(ctx);
    
    // Drawing the top bright emboss
    if(topEdgeColor != [UIColor clearColor]) {
        CGContextSaveGState(ctx);
        {
            CGContextSetBlendMode(ctx, kCGBlendModeOverlay);
            CGContextSetRGBFillColor(ctx, 0.9, 0.9, 0.9, 0.7);
            CGContextFillRect(ctx, CGRectMake(0, 1, rect.size.width, 1));
        }
        CGContextRestoreGState(ctx);
    }
    
    // Drawing the edge border lines
    CGContextSetFillColorWithColor(ctx, _edgeColor ? [_edgeColor CGColor] : [[UIColor colorWithRed:.1f green:.1f blue:.1f alpha:.8f] CGColor]);
    for (AKTab *tab in _tabs) {
        CGRect tabRect = CGRectMake(tab.frame.origin.x - kInterTabMargin, kTopEdgeWidth, kInterTabMargin, rect.size.height);
        CGContextFillRect(ctx, tabRect);
    }
    
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat screenWidth = self.bounds.size.width;
    
    CGFloat tabNumber = _tabs.count;
    
    // Calculating the tabs width.
    CGFloat tabWidth;
    
    CGRect rect = self.bounds;
    
	//Override the tab width if possible
	if ([self tabWidth] > 0) {
        tabWidth = [self tabWidth];
        
        //Calucate the starting x value, to center the buttons
        rect.origin.x = (screenWidth - ([self tabWidth]*tabNumber))/2.0f;
	}
    else {
        // Calculating the tabs width.
        tabWidth = floorf(((screenWidth + 1) / tabNumber) - 1);
    }
    
    // Because of the screen size, it is impossible to have tabs with the same
    // width. Therefore we have to increase each tab width by one until we spend
    // of the spaceLeft counter.
    CGFloat spaceLeft = screenWidth - (tabWidth * tabNumber) - (tabNumber - 1);
    
    rect.size.width = tabWidth;
    
    CGFloat dTabWith;
	
    for (AKTab *tab in _tabs) {
        
        // Here is the code that increment the width until we use all the space left
        
        dTabWith = tabWidth;
        
        if (spaceLeft != 0) {
            dTabWith = tabWidth + 1;
            spaceLeft--;
        }
        
        if ([_tabs indexOfObject:tab] == 0) {
            tab.frame = CGRectMake(rect.origin.x, rect.origin.y, dTabWith, rect.size.height);
        } else {
            tab.frame = CGRectMake(rect.origin.x + kInterTabMargin, rect.origin.y, dTabWith, rect.size.height);
        }
        
        [self addSubview:tab];
        rect.origin.x = tab.frame.origin.x + tab.frame.size.width;
    }
}

@end