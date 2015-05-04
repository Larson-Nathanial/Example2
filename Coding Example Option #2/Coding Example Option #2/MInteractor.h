//
//  MInteractor.h
//  Coding Example Option #2
//
//  Created by Nathanial Larson on 4/30/15.
//  Copyright (c) 2015 Nathanial Larson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MInteractor : NSObject

// This is a singleton class, only created 1x
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+ (MInteractor *)interactor;

// Method for creating the image.
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
- (UIImage *)finalImageInSize:(CGSize)size withRows:(NSString *)rows andCols:(NSString *)cols andColors:(NSArray *)colors;

// Filters the input fields to only allow integers.
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
- (NSString *)filterInput:(NSString *)input;

// Returns the color to be stored in the array of colors.
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
- (UIColor *)returnColorForButton:(UIButton *)button;

@end
