//
//  AddingFilesOption.h
//  Shabdo-khoj
//
//  Created by technicise on 4/28/15.
//  Copyright (c) 2015 technicise.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImageFile.h"

@class ImageFile;
@interface AddingFilesOption : UIViewController


@property (strong, nonatomic) UIWindow *window;
@property(strong, nonatomic) UINavigationController *navigationController;
@property (strong, nonatomic) ImageFile *ImageFile;

- (IBAction)AddPhotos:(id)sender;

- (IBAction)AddVideo:(id)sender;

- (IBAction)AddDocuments:(id)sender;


@end
