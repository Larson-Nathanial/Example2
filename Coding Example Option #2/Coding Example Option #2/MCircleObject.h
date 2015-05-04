//
//  MCircleObject.h
//  Coding Example Option #2
//
//  Created by Nathanial Larson on 4/30/15.
//  Copyright (c) 2015 Nathanial Larson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MCircleObject : UIView

// Size of the circle
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
@property (nonatomic) CGSize size;

// Color of the circle
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
@property (nonatomic) UIColor *color;

// Custom initializer method
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
- (id)initWithSize:(CGSize)size color:(UIColor *)color;

@end
