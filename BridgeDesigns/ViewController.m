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

@property (strong, nonatomic) CustomView *customView;

@property (nonatomic) ViewColor currentViewColor;
@property (nonatomic) ViewSize currentViewSize;
@property (nonatomic) ViewShape currentViewShape;

@property (strong, nonatomic) UIColor *defaultGrey;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.currentViewColor = ViewColorBlue;
    self.currentViewSize = ViewSizeMedium;
    self.currentViewShape = ViewShapeRounded;
    
    self.defaultGrey = [UIColor colorWithWhite:0.25 alpha:1.0];
    
    [self highlightButton:self.blueButton];
    [self highlightButton:self.mediumButton];
    [self highlightButton:self.middleButton];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)createNewView:(id)sender
{
    if (self.customView) {
        [self.customView removeFromSuperview];
        self.customView = nil;
    }
    
    CGFloat defaultSize = 200;
    CGRect viewFrame = CGRectMake(self.view.frame.size.width/2 - defaultSize/2, self.view.frame.size.height/2 - defaultSize/2, defaultSize, defaultSize);
    ViewStyle newStyle;
    newStyle.color = self.currentViewColor;
    newStyle.shape = self.currentViewShape;
    newStyle.size = self.currentViewSize;
    
    self.customView = [[CustomView alloc] initWithFrame:viewFrame andStyle:newStyle];
    [self.view addSubview:self.customView];
}

- (IBAction)greenButtonPressed:(id)sender
{
    [self highlightButton:self.greenButton];
    [self unhighlightButton:self.blueButton];
    [self unhighlightButton:self.redButton];
    
    self.currentViewColor = ViewColorGreen;
}

- (IBAction)blueButtonPressed:(id)sender
{
    [self highlightButton:self.blueButton];
    [self unhighlightButton:self.greenButton];
    [self unhighlightButton:self.redButton];
    
    self.currentViewColor = ViewColorBlue;
}

- (IBAction)redButtonPressed:(id)sender
{
    [self highlightButton:self.redButton];
    [self unhighlightButton:self.blueButton];
    [self unhighlightButton:self.greenButton];
    
    self.currentViewColor = ViewColorRed;
}

- (IBAction)smallButtonPressed:(id)sender
{
    [self highlightButton:self.smallButton];
    [self unhighlightButton:self.largeButton];
    [self unhighlightButton:self.mediumButton];
    
    self.currentViewSize = ViewSizeSmall;
}

- (IBAction)mediumButtonPressed:(id)sender
{
    [self highlightButton:self.mediumButton];
    [self unhighlightButton:self.largeButton];
    [self unhighlightButton:self.smallButton];
    
    self.currentViewSize = ViewSizeMedium;
}

- (IBAction)largeButtonPressed:(id)sender
{
    [self highlightButton:self.largeButton];
    [self unhighlightButton:self.smallButton];
    [self unhighlightButton:self.mediumButton];
    
    self.currentViewSize = ViewSizeLarge;
}

- (IBAction)squareButtonPressed:(id)sender
{
    [self highlightButton:self.squareButton];
    [self unhighlightButton:self.middleButton];
    [self unhighlightButton:self.circleButton];
    
    self.currentViewShape = ViewShapeSquare;
}

- (IBAction)middleButtonPressed:(id)sender
{
    [self highlightButton:self.middleButton];
    [self unhighlightButton:self.squareButton];
    [self unhighlightButton:self.circleButton];
    
    self.currentViewShape = ViewShapeRounded;
}

- (IBAction)circleButtonPressed:(id)sender
{
    [self highlightButton:self.circleButton];
    [self unhighlightButton:self.middleButton];
    [self unhighlightButton:self.squareButton];
    
    self.currentViewShape = ViewShapeCircle;
}

- (void)highlightButton:(UIButton *)sender
{
    [sender setBackgroundColor:self.defaultGrey];
}

- (void)unhighlightButton:(UIButton *)sender
{
    [sender setBackgroundColor:[UIColor whiteColor]];
}

@end
