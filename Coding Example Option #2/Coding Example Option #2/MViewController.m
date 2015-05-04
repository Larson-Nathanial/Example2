//
//  MViewController.m
//  Coding Example Option #2
//
//  Created by Nathanial Larson on 4/30/15.
//  Copyright (c) 2015 Nathanial Larson. All rights reserved.
//

#import "MViewController.h"
#import "MInteractor.h"

@interface MViewController ()

// Array to hold the selected UIColor objects.
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
@property (nonatomic) NSMutableArray *colors;

@end

@implementation MViewController

// Assign Delegate for textfields, assign keyboard type for mobile.
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
- (void)viewDidLoad
{
    _rowsTextField.delegate = self;
    _columnsTextField.delegate = self;
    
    if (!(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)) {
        _rowsTextField.keyboardType = UIKeyboardTypeNumberPad;
        _columnsTextField.keyboardType = UIKeyboardTypeNumberPad;
    }
    
    [self styleAppearance];
}

// Set the color options that can be chosen.
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
- (void)styleAppearance
{
    _colorOne.backgroundColor = [UIColor colorWithRed:76.0 / 255.0 green:217.0 / 255.0 blue:100.0 / 255.0 alpha:1.0];
    _colorTwo.backgroundColor = [UIColor colorWithRed:0.0 / 255.0 green:122.0 / 255.0 blue:255.0 / 255.0 alpha:1.0];
    _colorThree.backgroundColor = [UIColor colorWithRed:255.0 / 255.0 green:59.0 / 255.0 blue:48.0 / 255.0 alpha:1.0];
    _colorFour.backgroundColor = [UIColor colorWithRed:255.0 / 255.0 green:149.0 / 255.0 blue:0.0 / 255.0 alpha:1.0];
}

// Animates the color choices and input fields up so they are not hidden
// by the keyboard.
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    _finalImageView.image = nil;
    [UIView animateWithDuration:0.3 animations:^{
        if (!(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)) {
            if ([[UIDevice currentDevice] orientation] == UIDeviceOrientationLandscapeLeft || [[UIDevice currentDevice] orientation] == UIDeviceOrientationLandscapeRight) {
                _colorBarOutlet.frame = CGRectMake(0.0, self.view.bounds.size.height - 310.0, self.view.bounds.size.width, 60.0);
                _inputBarOutlet.frame = CGRectMake(0.0, self.view.bounds.size.height - 250.0, self.view.bounds.size.width, 60.0);
            }else {
                _colorBarOutlet.frame = CGRectMake(0.0, self.view.bounds.size.height - 340.0, self.view.bounds.size.width, 60.0);
                _inputBarOutlet.frame = CGRectMake(0.0, self.view.bounds.size.height - 280.0, self.view.bounds.size.width, 60.0);
            }
        }else {
            if ([[UIDevice currentDevice] orientation] == UIDeviceOrientationLandscapeLeft || [[UIDevice currentDevice] orientation] == UIDeviceOrientationLandscapeRight) {
                _colorBarOutlet.frame = CGRectMake(0.0, self.view.bounds.size.height - 500.0, self.view.bounds.size.width, 60.0);
                _inputBarOutlet.frame = CGRectMake(0.0, self.view.bounds.size.height - 440.0, self.view.bounds.size.width, 60.0);
            }else {
                _colorBarOutlet.frame = CGRectMake(0.0, self.view.bounds.size.height - 400.0, self.view.bounds.size.width, 60.0);
                _inputBarOutlet.frame = CGRectMake(0.0, self.view.bounds.size.height - 340.0, self.view.bounds.size.width, 60.0);
            }
        }
    }];
}

// If the image is not nil, it will write it to the photo album.
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
- (IBAction)saveButtonAction:(id)sender {
    if (_finalImageView.image != nil) {
        UIImageWriteToSavedPhotosAlbum(_finalImageView.image, nil, @selector(finishedWrite), nil);
    }
}

// iOS8+ only, will display an alert when the image has finished saving.
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
- (void)finishedWrite
{
    UIAlertController * alert= [UIAlertController
                                  alertControllerWithTitle:@"Save Complete"
                                  message:@"Your image is now saved in your photos album"
                                  preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* ok = [UIAlertAction
                         actionWithTitle:@"OK"
                         style:UIAlertActionStyleDefault
                         handler:^(UIAlertAction * action)
                         {
                             [alert dismissViewControllerAnimated:YES completion:nil];
                             
                         }];
    
    [alert addAction:ok];
    
    [self presentViewController:alert animated:YES completion:nil];

}

// Called whenever a color is tapped. It adds/removes UIColor objects.
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
- (IBAction)selectedColor:(id)sender {
    if (_colors == nil) {
        _colors = [NSMutableArray new];
    }
    
    UIColor *selectedColor = [[MInteractor interactor] returnColorForButton:sender];
    
    if ([_colors containsObject:selectedColor]) {
        UIButton *button = (UIButton *)sender;
        [button setTitle:@"" forState:UIControlStateNormal];
        [_colors removeObject:selectedColor];
    }else {
        UIButton *button = (UIButton *)sender;
        [button setTitle:@"Selected" forState:UIControlStateNormal];
        [_colors addObject:selectedColor];
    }
}

// Animates color choices and input fields to the buttom of the screen,
// hids keyboard and calls method to draw circles.
// Also validates and cleans the textual input.
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
- (IBAction)goButtonAction:(id)sender {
    
    _rowsTextField.text = [[MInteractor interactor] filterInput:_rowsTextField.text];
    _columnsTextField.text = [[MInteractor interactor] filterInput:_columnsTextField.text];
    
    [UIView animateWithDuration:0.3 animations:^{
        if ([[UIDevice currentDevice] orientation] == UIDeviceOrientationLandscapeLeft || [[UIDevice currentDevice] orientation] == UIDeviceOrientationLandscapeRight) {
            _colorBarOutlet.frame = CGRectMake(0.0, self.view.bounds.size.height - 120.0, self.view.bounds.size.width, 60.0);
            _inputBarOutlet.frame = CGRectMake(0.0, self.view.bounds.size.height - 60.0, self.view.bounds.size.width, 60.0);
        }else {
            _colorBarOutlet.frame = CGRectMake(0.0, self.view.bounds.size.height - 120.0, self.view.bounds.size.width, 60.0);
            _inputBarOutlet.frame = CGRectMake(0.0, self.view.bounds.size.height - 60.0, self.view.bounds.size.width, 60.0);
        }
    }];
    
    [_rowsTextField resignFirstResponder];
    [_columnsTextField resignFirstResponder];

    [self drawCircles];
}

// Calls a method within the interactor class to draw circles and puts the
// returned image on the imageView.
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
- (void)drawCircles
{
    if (_colors.count > 0 && _rowsTextField.text.length > 0 && _columnsTextField.text.length > 0) {
        CGSize size = _finalImageView.bounds.size;
        _finalImageView.image = [[MInteractor interactor] finalImageInSize:size withRows:_rowsTextField.text andCols:_columnsTextField.text andColors:_colors];
    }
}

// Recreates the image when rotated, also hides keyboard and moves color
// choices and input fields back to the bottom of the screen.
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
- (BOOL)shouldAutorotate
{
    [UIView animateWithDuration:0.3 animations:^{
        if (!(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)) {
            if ([[UIDevice currentDevice] orientation] == UIDeviceOrientationLandscapeLeft || [[UIDevice currentDevice] orientation] == UIDeviceOrientationLandscapeRight) {
                _colorBarOutlet.frame = CGRectMake(0.0, self.view.bounds.size.height - 120.0, self.view.bounds.size.width, 60.0);
                _inputBarOutlet.frame = CGRectMake(0.0, self.view.bounds.size.height - 60.0, self.view.bounds.size.width, 60.0);
            }else {
                _colorBarOutlet.frame = CGRectMake(0.0, self.view.bounds.size.height - 120.0, self.view.bounds.size.width, 60.0);
                _inputBarOutlet.frame = CGRectMake(0.0, self.view.bounds.size.height - 60.0, self.view.bounds.size.width, 60.0);
            }
        }
    }];
    
    [_columnsTextField resignFirstResponder];
    [_rowsTextField resignFirstResponder];
    
    [self drawCircles];
    
    return YES;
}

@end
