//
//  AddingFilesOption.m
//  Shabdo-khoj
//
//  Created by technicise on 4/28/15.
//  Copyright (c) 2015 technicise.com. All rights reserved.
//

#import "AddingFilesOption.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import <MediaPlayer/MediaPlayer.h>
#import <AVFoundation/AVFoundation.h>
#import <MobileCoreServices/MobileCoreServices.h>
#import "AssetBrowserItem.h"

@interface AddingFilesOption ()

@property (nonatomic, strong) ALAssetsLibrary *assetsLibrary;
@property (nonatomic, strong) NSURL *videoURL;
@property (nonatomic, strong) MPMoviePlayerController *mpVideoPlayer;
@property (nonatomic, strong) NSMutableArray *videoURLArray;
@property (nonatomic, strong) NSMutableArray *assetItems;
@property (nonatomic, strong) NSMutableDictionary *dic;

@end

@implementation AddingFilesOption
@synthesize assetsLibrary, assetItems,dic;
@synthesize videoURL,videoURLArray, mpVideoPlayer;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)AddPhotos:(id)sender {
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.ImageFile = [[ImageFile alloc] initWithNibName:@"ImageFile" bundle:nil];
    self.window.rootViewController = self.ImageFile;
    [self.window makeKeyAndVisible];
}

- (IBAction)AddVideo:(id)sender {
   // [self buildAssetsLibrary];
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.delegate = self;
    imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    imagePicker.mediaTypes = [[NSArray alloc] initWithObjects:(NSString *)kUTTypeMovie, nil];
    [self presentModalViewController:imagePicker animated:YES];
}

- (void)buildAssetsLibrary
{
    assetsLibrary = [[ALAssetsLibrary alloc] init];
    ALAssetsLibrary *notificationSender = nil;
    
    videoURLArray = [[NSMutableArray alloc] init];
    
    NSString *minimumSystemVersion = @"4.1";
    NSString *systemVersion = [[UIDevice currentDevice] systemVersion];
    if ([systemVersion compare:minimumSystemVersion options:NSNumericSearch] != NSOrderedAscending)
        notificationSender = assetsLibrary;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(assetsLibraryDidChange:) name:ALAssetsLibraryChangedNotification object:notificationSender];
    [self updateAssetsLibrary];
}

- (void)assetsLibraryDidChange:(NSNotification*)changeNotification
{
    [self updateAssetsLibrary];
}

- (void)updateAssetsLibrary
{
    assetItems = [NSMutableArray arrayWithCapacity:0];
    ALAssetsLibrary *assetLibrary = assetsLibrary;
    
    [assetLibrary enumerateGroupsWithTypes:ALAssetsGroupAll usingBlock:^(ALAssetsGroup *group, BOOL *stop)
     {
         if (group)
         {
             [group setAssetsFilter:[ALAssetsFilter allVideos]];
             [group enumerateAssetsUsingBlock:^(ALAsset *asset, NSUInteger index, BOOL *stop)
              {
                  if (asset)
                  {
                      dic = [[NSMutableDictionary alloc] init];
                      ALAssetRepresentation *defaultRepresentation = [asset defaultRepresentation];
                      NSString *uti = [defaultRepresentation UTI];
                      videoURL = [[asset valueForProperty:ALAssetPropertyURLs] valueForKey:uti];
                      
                      mpVideoPlayer = [[MPMoviePlayerController alloc] initWithContentURL:videoURL];
                      
                      NSString *title = [NSString stringWithFormat:@"%@ %lu", NSLocalizedString(@"Video", nil), [assetItems count]+1];
                      
                      [self performSelector:@selector(imageFromVideoURL)];
                      [dic setValue:title forKey:@"VideoTitle"];//kName
                      [dic setValue:videoURL forKey:@"VideoUrl"];//kURL
                      
                      AssetBrowserItem *item = [[AssetBrowserItem alloc] initWithURL:videoURL title:title];
                      [assetItems addObject:item];
                      [videoURLArray addObject:dic];
                      
                      NSLog(@"Video has info:%@",videoURLArray);
                  }
                  NSLog(@"Values of dictonary==>%@", dic);
                  
                  //NSLog(@"assetItems:%@",assetItems);
                  NSLog(@"Videos Are:%@",videoURLArray);
              } ];
         }
         // group == nil signals we are done iterating.
         else
         {
             dispatch_async(dispatch_get_main_queue(), ^{
                 //[self updateBrowserItemsAndSignalDelegate:assetItems];
                 //                loadImgView.hidden = NO;
                 //                [spinner stopAnimating];
                 //                [loadImgView removeFromSuperview];
                 //selectVideoBtn .userInteractionEnabled = YES;
             });
         }
     }
                              failureBlock:^(NSError *error)
     {
         NSLog(@"error enumerating AssetLibrary groups %@\n", error);
     }];
}

- (UIImage *)imageFromVideoURL
{
    
    UIImage *image = nil;
    AVAsset *asset = [[AVURLAsset alloc] initWithURL:videoURL options:nil];;
    AVAssetImageGenerator *imageGenerator = [[AVAssetImageGenerator alloc] initWithAsset:asset];
    imageGenerator.appliesPreferredTrackTransform = YES;
    
    // calc midpoint time of video
    Float64 durationSeconds = CMTimeGetSeconds([asset duration]);
    CMTime midpoint = CMTimeMakeWithSeconds(durationSeconds/2.0, 600);
    
    // get the image from
    NSError *error = nil;
    CMTime actualTime;
    CGImageRef halfWayImage = [imageGenerator copyCGImageAtTime:midpoint actualTime:&actualTime error:&error];
    
    if (halfWayImage != NULL)
    {
        // cgimage to uiimage
        image = [[UIImage alloc] initWithCGImage:halfWayImage];
        [dic setValue:image forKey:@"ImageThumbnail"];//kImage
        NSLog(@"Values of dictonary==>%@", dic);
        NSLog(@"Videos Are:%@",videoURLArray);
        CGImageRelease(halfWayImage);
    }
    return image;
}


- (IBAction)AddDocuments:(id)sender {
}
@end
