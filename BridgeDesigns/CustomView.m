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
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTapped:)];
    [self addGestureRecognizer:tap];
    self.userInteractionEnabled = YES;
    
    [self configureSize];
    [self configureBackgroundColor];
    [self configureShape];
}

- (void)configureSize
{
    CGFloat frameBuffer;
    
    switch (self.currentViewSize) {
        case ViewSizeSmall:
            frameBuffer = 40;
            break;
        case ViewSizeMedium:
            frameBuffer = 24;
            break;
        case ViewSizeLarge:
        default:
            frameBuffer = 0;
            break;
    }
    
    CGSize newSize = CGSizeMake(superFrame.size.width - frameBuffer, superFrame.size.height - frameBuffer);
    CGRect newFrame = CGRectMake(superFrame.size.width/2 - newSize.width/2, superFrame.size.height/2 - newSize.height/2, newSize.width, newSize.height);
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
    [self.containerView setBackgroundColor:color];
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

- (void)viewTapped:(id)sender
{
    [UIView animateWithDuration:0.25 animations:^{
        [self.containerView setBackgroundColor:[self darkerColorForColor:self.containerView.backgroundColor]];
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.25 animations:^{
            [self.containerView setBackgroundColor:[self lighterColorForColor:self.containerView.backgroundColor]];
        } completion:nil];
    }];
}

- (UIColor *)lighterColorForColor:(UIColor *)c
{
    CGFloat r, g, b, a;
    if ([c getRed:&r green:&g blue:&b alpha:&a])
        return [UIColor colorWithRed:MIN(r + 0.35, 1.0)
                               green:MIN(g + 0.35, 1.0)
                                blue:MIN(b + 0.35, 1.0)
                               alpha:a];
    return nil;
}

- (UIColor *)darkerColorForColor:(UIColor *)c
{
    CGFloat r, g, b, a;
    if ([c getRed:&r green:&g blue:&b alpha:&a])
        return [UIColor colorWithRed:MAX(r - 0.35, 0.0)
                               green:MAX(g - 0.35, 0.0)
                                blue:MAX(b - 0.35, 0.0)
                               alpha:a];
    return nil;
}

@end
