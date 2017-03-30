//
//  CustomView.h
//  BridgeDesigns
//
//  Created by Reid Weber on 3/29/17.
//  Copyright © 2017 Reid Weber. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, ViewColor) {
    ViewColorGreen,
    ViewColorBlue,
    ViewColorRed,
};

typedef NS_ENUM(NSUInteger, ViewSize) {
    ViewSizeSmall,
    ViewSizeMedium,
    ViewSizeLarge,
};

typedef NS_ENUM(NSUInteger, ViewShape) {
    ViewShapeCircle,
    ViewShapeRounded,
    ViewShapeSquare,
};

@interface CustomView : UIView

@end
