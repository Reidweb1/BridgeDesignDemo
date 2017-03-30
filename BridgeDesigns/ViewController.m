//
//  ViewController.m
//  BridgeDesigns
//
//  Created by Reid Weber on 3/29/17.
//  Copyright © 2017 Reid Weber. All rights reserved.
//

#import "ViewController.h"
#import "CustomView.h"


@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *createViewButton;
@property (weak, nonatomic) IBOutlet UIButton *greenButton;
@property (weak, nonatomic) IBOutlet UIButton *blueButton;
@property (weak, nonatomic) IBOutlet UIButton *redButton;
@property (weak, nonatomic) IBOutlet UIButton *smallButton;
@property (weak, nonatomic) IBOutlet UIButton *mediumButton;
@property (weak, nonatomic) IBOutlet UIButton *largeButton;
@property (weak, nonatomic) IBOutlet UIButton *squareButton;
@property (weak, nonatomic) IBOutlet UIButton *middleButton;
@property (weak, nonatomic) IBOutlet UIButton *circleButton;

@property (nonatomic) ViewColor currentViewColor;
@property (nonatomic) ViewSize currentViewSize;
@property (nonatomic) ViewShape currentViewShape;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.currentViewColor = ViewColorBlue;
    self.currentViewSize = ViewSizeMedium;
    self.currentViewShape = ViewShapeRounded;
    
    [self.greenButton.titleLabel setTextColor:[self lighterColorForColor:self.greenButton.backgroundColor]];
    [self.redButton.titleLabel setTextColor:[self lighterColorForColor:self.redButton.backgroundColor]];
    [self.smallButton.titleLabel setTextColor:[self lighterColorForColor:self.smallButton.backgroundColor]];
    [self.largeButton.titleLabel setTextColor:[self lighterColorForColor:self.largeButton.backgroundColor]];
    [self.squareButton.titleLabel setTextColor:[self lighterColorForColor:self.squareButton.backgroundColor]];
    [self.circleButton.titleLabel setTextColor:[self lighterColorForColor:self.circleButton.backgroundColor]];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)createNewView:(id)sender
{
    
}

- (IBAction)greenButtonPressed:(id)sender
{
    [self.greenButton setTintColor:[self darkerColorForColor:self.greenButton.backgroundColor]];
    [self.blueButton setTintColor:[self lighterColorForColor:self.blueButton.backgroundColor]];
    [self.redButton setTintColor:[self lighterColorForColor:self.redButton.backgroundColor]];
    self.currentViewColor = ViewColorGreen;
}

- (IBAction)blueButtonPressed:(id)sender
{
    [self.blueButton setTintColor:[self darkerColorForColor:self.blueButton.backgroundColor]];
    [self.greenButton setTintColor:[self lighterColorForColor:self.greenButton.backgroundColor]];
    [self.redButton setTintColor:[self lighterColorForColor:self.redButton.backgroundColor]];
    self.currentViewColor = ViewColorBlue;
}

- (IBAction)redButtonPressed:(id)sender
{
    [self.redButton setTintColor:[self darkerColorForColor:self.redButton.backgroundColor]];
    [self.blueButton setTintColor:[self lighterColorForColor:self.blueButton.backgroundColor]];
    [self.greenButton setTintColor:[self lighterColorForColor:self.greenButton.backgroundColor]];
    self.currentViewColor = ViewColorRed;
}

- (IBAction)smallButtonPressed:(id)sender
{
    [self.smallButton setTintColor:[self darkerColorForColor:self.smallButton.backgroundColor]];
    [self.mediumButton setTintColor:[self lighterColorForColor:self.mediumButton.backgroundColor]];
    [self.largeButton setTintColor:[self lighterColorForColor:self.largeButton.backgroundColor]];
    self.currentViewSize = ViewSizeSmall;
}

- (IBAction)mediumButtonPressed:(id)sender
{
    [self.mediumButton setTintColor:[self darkerColorForColor:self.mediumButton.backgroundColor]];
    [self.smallButton setTintColor:[self lighterColorForColor:self.smallButton.backgroundColor]];
    [self.largeButton setTintColor:[self lighterColorForColor:self.largeButton.backgroundColor]];
    self.currentViewSize = ViewSizeMedium;
}

- (IBAction)largeButtonPressed:(id)sender
{
    [self.largeButton setTintColor:[self darkerColorForColor:self.largeButton.backgroundColor]];
    [self.mediumButton setTintColor:[self lighterColorForColor:self.mediumButton.backgroundColor]];
    [self.smallButton setTintColor:[self lighterColorForColor:self.smallButton.backgroundColor]];
    self.currentViewSize = ViewSizeLarge;
}

- (IBAction)squareButtonPressed:(id)sender
{
    [self.squareButton setTintColor:[self darkerColorForColor:self.squareButton.backgroundColor]];
    [self.middleButton setTintColor:[self lighterColorForColor:self.middleButton.backgroundColor]];
    [self.circleButton setTintColor:[self lighterColorForColor:self.circleButton.backgroundColor]];
    self.currentViewShape = ViewShapeSquare;
}

- (IBAction)middleButtonPressed:(id)sender
{
    [self.middleButton setTintColor:[self darkerColorForColor:self.middleButton.backgroundColor]];
    [self.squareButton setTintColor:[self lighterColorForColor:self.squareButton.backgroundColor]];
    [self.circleButton setTintColor:[self lighterColorForColor:self.circleButton.backgroundColor]];
    self.currentViewShape = ViewShapeRounded;
}

- (IBAction)circleButtonPressed:(id)sender
{
    [self.circleButton setTintColor:[self darkerColorForColor:self.circleButton.backgroundColor]];
    [self.middleButton setTintColor:[self lighterColorForColor:self.middleButton.backgroundColor]];
    [self.squareButton setTintColor:[self lighterColorForColor:self.squareButton.backgroundColor]];
    self.currentViewShape = ViewShapeCircle;
}

- (UIColor *)lighterColorForColor:(UIColor *)c
{
    CGFloat r, g, b, a;
    if ([c getRed:&r green:&g blue:&b alpha:&a])
        return [UIColor colorWithRed:MIN(r + 0.2, 1.0)
                               green:MIN(g + 0.2, 1.0)
                                blue:MIN(b + 0.2, 1.0)
                               alpha:a];
    return nil;
}

- (UIColor *)darkerColorForColor:(UIColor *)c
{
    CGFloat r, g, b, a;
    if ([c getRed:&r green:&g blue:&b alpha:&a])
        return [UIColor colorWithRed:MAX(r - 0.2, 0.0)
                               green:MAX(g - 0.2, 0.0)
                                blue:MAX(b - 0.2, 0.0)
                               alpha:a];
    return nil;
}

@end
