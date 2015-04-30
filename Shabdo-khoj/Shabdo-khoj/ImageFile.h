//
//  ImageFile.h
//  Shabdo-khoj
//
//  Created by technicise on 4/28/15.
//  Copyright (c) 2015 technicise.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
#import "AddingFilesOption.h"

@class AddingFilesOption;
@class ViewController;
@interface ImageFile : UIViewController<UINavigationControllerDelegate, UIImagePickerControllerDelegate>




@property (strong, nonatomic) IBOutlet UIImageView *image_view;

- (IBAction)imageSave:(id)sender;
- (IBAction)GalleryOpen:(id)sender;
- (IBAction)CameraOpen:(id)sender;

@property (strong, nonatomic) UIImagePickerController *imagePicker;

@property (strong, nonatomic) UIWindow *window;
@property(strong, nonatomic) UINavigationController *navigationController;
@property (strong, nonatomic) ViewController *ViewController;
@property (strong, nonatomic) AddingFilesOption *AddingFilesOption;
- (IBAction)back:(id)sender;

@end
