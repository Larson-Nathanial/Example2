//
//  MViewController.h
//  Coding Example Option #2
//
//  Created by Nathanial Larson on 4/30/15.
//  Copyright (c) 2015 Nathanial Larson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MViewController : UIViewController<UITextFieldDelegate>

// ImageView on the screen where the final image will be.
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
@property (weak, nonatomic) IBOutlet UIImageView *finalImageView;

// Bar & buttons for color choices.
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
@property (weak, nonatomic) IBOutlet UIView *colorBarOutlet;
@property (weak, nonatomic) IBOutlet UIButton *colorOne;
@property (weak, nonatomic) IBOutlet UIButton *colorTwo;
@property (weak, nonatomic) IBOutlet UIButton *colorThree;
@property (weak, nonatomic) IBOutlet UIButton *colorFour;

// Bar & buttons for rows and columns input, saving to photo album and
// creating the image.
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
@property (weak, nonatomic) IBOutlet UIView *inputBarOutlet;
@property (weak, nonatomic) IBOutlet UITextField *rowsTextField;
@property (weak, nonatomic) IBOutlet UITextField *columnsTextField;
@property (weak, nonatomic) IBOutlet UIButton *saveButton;
@property (weak, nonatomic) IBOutlet UIButton *goButton;

// Save button to save image to photo album.
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
- (IBAction)saveButtonAction:(id)sender;

// Starts process of creating the image.
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
- (IBAction)goButtonAction:(id)sender;


@end
