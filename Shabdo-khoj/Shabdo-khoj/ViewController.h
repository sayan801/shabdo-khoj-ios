//
//  ViewController.h
//  Shabdo-khoj
//
//  Created by technicise on 4/28/15.
//  Copyright (c) 2015 technicise.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddingFilesOption.h"
#import "SWTableViewCell.h"
#import "NSMutableArray+SWUtilityButtons.h"
#import "ImageFile.h"
#import <MediaPlayer/MediaPlayer.h>
#import <AVFoundation/AVFoundation.h>
#import <MobileCoreServices/MobileCoreServices.h>
@class AddingFilesOption;

@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,SWTableViewCellDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate>



@property (strong, nonatomic) UIWindow *window;
@property(strong, nonatomic) UINavigationController *navigationController;
@property (strong, nonatomic) AddingFilesOption *AddingFilesOption;

@property(strong,nonatomic) MPMoviePlayerController *moviePlayer;


- (IBAction)AddFiles:(id)sender;


@property (strong, nonatomic) IBOutlet UITableView *tableView;


- (IBAction)playMovie;
//- (IBAction)playMovie:(id)sender;


@end

