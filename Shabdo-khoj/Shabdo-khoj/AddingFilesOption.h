//
//  AddingFilesOption.h
//  Shabdo-khoj
//
//  Created by technicise on 4/28/15.
//  Copyright (c) 2015 technicise.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImageFile.h"
#import "ViewController.h"

@class ViewController;
@class ImageFile;
@interface AddingFilesOption : UIViewController<UIImagePickerControllerDelegate,UINavigationControllerDelegate>


@property (strong, nonatomic) UIWindow *window;
@property(strong, nonatomic) UINavigationController *navigationController;
@property (strong, nonatomic) ImageFile *ImageFile;
@property (strong, nonatomic) ViewController *ViewController;
- (IBAction)AddPhotos:(id)sender;

- (IBAction)AddVideo:(id)sender;

- (IBAction)AddDocuments:(id)sender;

- (IBAction)back:(id)sender;

- (IBAction)btn4:(id)sender;
@property (strong,nonatomic) UIPopoverController *popOver;

@end
