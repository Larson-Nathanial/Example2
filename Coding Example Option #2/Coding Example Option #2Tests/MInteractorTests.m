//
//  MInteractorTests.m
//  Coding Example Option #2
//
//  Created by Nathanial Larson on 4/30/15.
//  Copyright (c) 2015 Nathanial Larson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "MInteractor.h"

@interface MInteractorTests : XCTestCase

@end

@implementation MInteractorTests

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

// Test the filter to make sure it is returning the correct results.
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
- (void)testFilter {
    
    NSString *string = @"@#$%543@)-+";
    NSString *result = [[MInteractor interactor] filterInput:string];
    XCTAssert([result isEqualToString:@"54"], @"Pass");
    
    string = @"-2345.0954";
    result = [[MInteractor interactor] filterInput:string];
    XCTAssert([result isEqualToString:@"23"], @"Pass");
    
    string = @"Happy5.09Four4";
    result = [[MInteractor interactor] filterInput:string];
    XCTAssert([result isEqualToString:@"50"], @"Pass");
}

// Test the colors to make sure it is returning the correct results.
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
- (void)testColor {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    button.tag = 0;
    UIColor *color = [[MInteractor interactor] returnColorForButton:button];
    XCTAssert(color == nil, @"Pass");
    
    button.tag = 1;
    color = [[MInteractor interactor] returnColorForButton:button];
    XCTAssert([color isEqual:[UIColor colorWithRed:76.0 / 255.0 green:217.0 / 255.0 blue:100.0 / 255.0 alpha:1.0]], @"Pass");
    
    button.tag = 2;
    color = [[MInteractor interactor] returnColorForButton:button];
    XCTAssert([color isEqual:[UIColor colorWithRed:0.0 / 255.0 green:122.0 / 255.0 blue:255.0 / 255.0 alpha:1.0]], @"Pass");
    
    button.tag = 3;
    color = [[MInteractor interactor] returnColorForButton:button];
    XCTAssert([color isEqual:[UIColor colorWithRed:255.0 / 255.0 green:59.0 / 255.0 blue:48.0 / 255.0 alpha:1.0]], @"Pass");
    
    button.tag = 4;
    color = [[MInteractor interactor] returnColorForButton:button];
    XCTAssert([color isEqual:[UIColor colorWithRed:255.0 / 255.0 green:149.0 / 255.0 blue:0.0 / 255.0 alpha:1.0]], @"Pass");
    
    button.tag = 5;
    color = [[MInteractor interactor] returnColorForButton:button];
    XCTAssert(color == nil, @"Pass");
}

@end
