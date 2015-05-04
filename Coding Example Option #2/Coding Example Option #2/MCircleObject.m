//
//  MCircleObject.m
//  Coding Example Option #2
//
//  Created by Nathanial Larson on 4/30/15.
//  Copyright (c) 2015 Nathanial Larson. All rights reserved.
//

#import "MCircleObject.h"

@implementation MCircleObject

// Custom initializer class, creates a colored circle.
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
- (id)initWithSize:(CGSize)size color:(UIColor *)color
{
    self = [self init];
    if (self) {
        self.size = size;
        self.color = color;
        
        self.frame = CGRectMake(0.0, 0.0, self.size.width, self.size.height);
        self.backgroundColor = self.color;
        self.layer.cornerRadius = self.size.width / 2.0;
        self.layer.masksToBounds = YES;
    }
    return self;
}

@end
