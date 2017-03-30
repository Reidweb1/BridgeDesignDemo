//
//  CustomView.m
//  BridgeDesigns
//
//  Created by Reid Weber on 3/29/17.
//  Copyright © 2017 Reid Weber. All rights reserved.
//

#import "CustomView.h"

@interface CustomView ()

@property (strong, nonatomic) UIView *containerView;

@property (nonatomic) ViewColor currentViewColor;
@property (nonatomic) ViewSize currentViewSize;
@property (nonatomic) ViewShape currentViewShape;

@end

@implementation CustomView {
    CGRect superFrame;
}

- (instancetype)initWithFrame:(CGRect)frame andStyle:(ViewStyle)style {
    self = [super initWithFrame:frame];
    if (self) {
        superFrame = frame;
        self.currentViewColor = style.color;
        self.currentViewSize = style.size;
        self.currentViewShape = style.shape;
        [self configureUIWithFrame];
    }
    return self;
}

- (void)configureUIWithFrame
{
    [self configureSize];
    [self configureBackgroundColor];
    
}

- (void)configureSize
{
    CGFloat frameBuffer;
    
    switch (self.currentViewSize) {
        case ViewSizeSmall:
            frameBuffer = 32;
            break;
        case ViewSizeMedium:
            frameBuffer = 16;
            break;
        case ViewSizeLarge:
        default:
            frameBuffer = 0;
            break;
    }
    
    CGRect newFrame = CGRectInset(superFrame, frameBuffer, frameBuffer);
    self.containerView = [[UIView alloc] initWithFrame:newFrame];
    [self addSubview:self.containerView];
}

- (void)configureBackgroundColor
{
    UIColor *color;
    switch (self.currentViewColor) {
        case ViewColorBlue:
            color = [UIColor blueColor];
            break;
        case ViewColorGreen:
            color = [UIColor greenColor];
            break;
        case ViewColorRed:
        default:
            color = [UIColor redColor];
            break;
    }
    [self setBackgroundColor:color];
}

- (void)configureShape
{
    CGFloat cornerRadius;
    switch (self.currentViewShape) {
        case ViewShapeCircle:
            cornerRadius = self.containerView.frame.size.width/2;
            break;
        case ViewShapeRounded:
            cornerRadius = self.containerView.frame.size.width/4;
            break;
        case ViewShapeSquare:
        default:
            cornerRadius = 0;
            break;
    }
    [self.containerView layer].cornerRadius = cornerRadius;
}

@end
