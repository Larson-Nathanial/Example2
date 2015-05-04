//
//  MInteractor.m
//  Coding Example Option #2
//
//  Created by Nathanial Larson on 4/30/15.
//  Copyright (c) 2015 Nathanial Larson. All rights reserved.
//

#import "MInteractor.h"
#import "MCircleObject.h"
#import <QuartzCore/QuartzCore.h>

@implementation MInteractor

// Creation of this class.
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+ (MInteractor *)interactor
{
    static MInteractor *interactor = nil;
    
    if (!interactor) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            interactor = [[self alloc] initPrivate];
        });
    }
    return interactor;
}

// Custom Instance method, additional setup can be included here.
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
- (instancetype)initPrivate
{
    self = [super init];
    return self;
}

// Create the image.
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
- (UIImage *)finalImageInSize:(CGSize)size withRows:(NSString *)rows andCols:(NSString *)cols andColors:(NSArray *)colors
{
    CGSize newSize = [self calculateSizeOfCircle:size withRows:rows andCols:cols];
    
    UIView *imageView = [UIView new];
    imageView.frame = CGRectMake(0.0, 0.0, size.width, size.height);
    
    int colorMax = (int)colors.count - 1;
    int currentColor = 0;
    float y = 5.0;
    float x = 5.0;
    
    for (int i = 0; i < rows.intValue; i++) {
        x = 5.0;
        for (int j = 0; j < cols.intValue; j++) {
            MCircleObject *circle = [[MCircleObject alloc] initWithSize:newSize color:colors[currentColor]];
            
            circle.frame = CGRectMake(x, y, circle.frame.size.width, circle.frame.size.height);
            
            [imageView addSubview:circle];
            
            if (currentColor == colorMax) {
                currentColor = 0;
            }else {
                currentColor++;
            }
            x = x + newSize.width + 5.0;
        }
        y = y + newSize.height + 5.0;
    }
    
    
    
    return [self imageWithView:imageView];
}

// Change the uiview into an uiimage
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
- (UIImage *) imageWithView:(UIView *)view
{
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, view.opaque, 0.0);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    UIImage * img = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return img;
}

// Figure out how big the circles are going to be.
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
- (CGSize)calculateSizeOfCircle:(CGSize)size withRows:(NSString *)rows andCols:(NSString *)cols
{
    float height = (size.height / rows.floatValue) - 10.0;
    float width = (size.width / cols.floatValue) - 10.0;
    
    if (height > width) {
        return CGSizeMake(width, width);
    }else {
        return CGSizeMake(height, height);
    }
}

// Called when the textfield is done editing. replaces textfield with correct
// input.
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
- (NSString *)filterInput:(NSString *)input
{
    NSString *newInput = [[input componentsSeparatedByCharactersInSet:
                            [[NSCharacterSet decimalDigitCharacterSet] invertedSet]]
                           componentsJoinedByString:@""];
    if (newInput.length > 2) {
        newInput = [newInput substringToIndex:2];
    }
    
    return newInput;
}

// Returns a UIColor Object depending on which color choice was tapped.
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
- (UIColor *)returnColorForButton:(UIButton *)button
{
    if (button.tag == 1) {
        return [UIColor colorWithRed:76.0 / 255.0 green:217.0 / 255.0 blue:100.0 / 255.0 alpha:1.0];
    }else if (button.tag == 2) {
        return [UIColor colorWithRed:0.0 / 255.0 green:122.0 / 255.0 blue:255.0 / 255.0 alpha:1.0];
    }else if (button.tag == 3) {
        return [UIColor colorWithRed:255.0 / 255.0 green:59.0 / 255.0 blue:48.0 / 255.0 alpha:1.0];
    }else if (button.tag == 4) {
        return [UIColor colorWithRed:255.0 / 255.0 green:149.0 / 255.0 blue:0.0 / 255.0 alpha:1.0];
    }else {
        return nil;
    }
}

@end
