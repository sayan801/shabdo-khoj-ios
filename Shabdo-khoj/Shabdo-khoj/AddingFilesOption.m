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
#import "AppDelegate.h"

@interface AddingFilesOption ()

@property (nonatomic, strong) ALAssetsLibrary *assetsLibrary;
@property (nonatomic, strong) NSURL *videoURL;
@property (nonatomic, strong) MPMoviePlayerController *mpVideoPlayer;
@property (nonatomic, strong) NSMutableArray *videoURLArray;
@property (nonatomic, strong) NSMutableArray *assetItems;
@property (nonatomic, strong) NSMutableDictionary *dic;

@end

@implementation AddingFilesOption{

UIImageView *image_view;
UIImagePickerController *imagePicker;
}
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
   /*
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.ImageFile = [[ImageFile alloc] initWithNibName:@"ImageFile" bundle:nil];
    self.window.rootViewController = self.ImageFile;
    [self.window makeKeyAndVisible];
    */
}

- (IBAction)AddVideo:(id)sender {
    
    /*
    imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.delegate = self;
    imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    imagePicker.mediaTypes = [[NSArray alloc] initWithObjects:(NSString *)kUTTypeMovie, nil];
    [self presentModalViewController:imagePicker animated:YES];
    */
    
    
     imagePicker = [[UIImagePickerController alloc] init];
     imagePicker.delegate = self;
     imagePicker.sourceType =UIImagePickerControllerSourceTypePhotoLibrary;
     imagePicker.mediaTypes = [[NSArray alloc] initWithObjects:(NSString *)kUTTypeMovie, nil];
     
     if( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
     {
     
     UIPopoverController *popController=[[UIPopoverController alloc] initWithContentViewController:imagePicker];
     [popController presentPopoverFromRect:CGRectMake(0, 600, 160, 300) inView:self.view permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
     self.popOver=popController;
     
     }
     else
     {
     [self presentViewController:imagePicker animated:YES completion:nil];
     }
    
    /////////////////////////PREVIOUS CODE///////////
  /*
   // [self buildAssetsLibrary];
    imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.delegate = self;
    imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    imagePicker.mediaTypes = [[NSArray alloc] initWithObjects:(NSString *)kUTTypeMovie, nil];
    [self presentModalViewController:imagePicker animated:YES];
     NSString *documentDir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
     NSString *filePath = [documentDir stringByAppendingPathComponent:documentDir.lastPathComponent];
    NSLog(@"filePath=%@",filePath);
    [self presentViewController:imagePicker animated:YES completion:nil];
   */
   /*
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *filePath = [documentsDirectory stringByAppendingPathComponent:fileName];
    
    NSFileManager *manager = [NSFileManager defaultManager];
    // 1st, This funcion could allow you to create a file with initial contents.
    // 2nd, You could specify the attributes of values for the owner, group, and permissions.
    // Here we use nil, which means we use default values for these attibutes.
    // 3rd, it will return YES if NSFileManager create it successfully or it exists already.
    if ([manager createFileAtPath:filePath contents:nil attributes:nil]) {
        NSLog(@"Created the File Successfully.");
    } else {
        NSLog(@"Failed to Create the File");
    }
    */
    /*
    // Fetch directory path of document for local application.
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    // NSFileManager is the manager organize all the files on device.
    NSFileManager *manager = [NSFileManager defaultManager];
    // This function will return all of the files' Name as an array of NSString.
    NSArray *files = [manager contentsOfDirectoryAtPath:documentsDirectory error:nil];
    // Log the Path of document directory.
    NSLog(@"Directory: %@", documentsDirectory);
    // For each file, log the name of it.
    for (NSString *file in files) {
        NSLog(@"File at: %@", file);
    }
     */
    /*
    imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.delegate = self;
    imagePicker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    // NSArray *documentsDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    
    //    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"self.lastPathComponent == %@", searchFilename];
    //    NSArray *matchingPaths = [[[NSFileManager defaultManager] supbathsAtPath:documentsDirectory] filterUsingPredicate:predicate];
    
    // NSLog(@"%@", matchingPaths);
    [self presentViewController:imagePicker animated:YES completion:nil];
     */
}


/*
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    
    
    NSString *type = [info objectForKey:UIImagePickerControllerMediaType];
    //NSLog(@"type=%@",type);
    if ([type isEqualToString:(NSString *)kUTTypeVideo] ||
        [type isEqualToString:(NSString *)kUTTypeMovie])
    {// movie != video
        NSURL *urlvideo = [info objectForKey:UIImagePickerControllerMediaURL];
        NSLog(@"urlvideo %@",urlvideo);
    }
    
    
    NSURL *imageURL = [info valueForKey:UIImagePickerControllerReferenceURL];
    
    ALAssetsLibrary *assetsLibrary1 = [[ALAssetsLibrary alloc] init];
    [assetsLibrary1 assetForURL:imageURL resultBlock:^(ALAsset *asset) {
        ALAssetRepresentation *assetRep = [asset defaultRepresentation];
        NSLog(@"Image filename: %@", [assetRep filename]);
        NSString *string=[NSString stringWithFormat:@"%@",[assetRep filename]];
        NSLog(@"string %@",string);
        [tableData addObject:string];
    } failureBlock:^(NSError *error) {
        NSLog(@"Error: %@", error.localizedDescription);
    }];
    
    //
    
    //  NSLog(@"imageURL %@",imageURL);
    NSLog(@"TableData %@",tableData);
    
    [self dismissModalViewControllerAnimated:YES];
    
     NSString *mediaType = [info objectForKey: UIImagePickerControllerMediaType];
     
     if (CFStringCompare ((__bridge CFStringRef) mediaType, kUTTypeMovie, 0) == kCFCompareEqualTo) {
     NSURL *videoUrl=(NSURL*)[info objectForKey:UIImagePickerControllerMediaURL];
     NSString *moviePath = [videoUrl path];
     
     if (UIVideoAtPathIsCompatibleWithSavedPhotosAlbum (moviePath)) {
     UISaveVideoAtPathToSavedPhotosAlbum (moviePath, nil, nil, nil);
     }
     NSLog(@"videoUrl %@",videoURL);
     }
     NSLog(@"mediaType %@",mediaType);
     [self dismissModalViewControllerAnimated:YES];
    
    //[picker release];
}
*/
/*
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
*/

- (IBAction)AddDocuments:(id)sender {
    /*
    NSString *documentDir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    NSString *filePath = [documentDir stringByAppendingPathComponent:@"GoogleLogo.png"];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"https://www.google.com/images/srpr/logo11w.png"]];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue currentQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        if (error) {
            NSLog(@"Download Error:%@",error.description);
        }
        if (data) {
            [data writeToFile:filePath atomically:YES];
            NSLog(@"File is saved to %@",filePath);
        }
    }];
     */
   // id document = self.view.window.windowController.document;
}

- (IBAction)back:(id)sender {
    ViewController *urViewController = (ViewController *)[[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"ViewController"];
   // urViewController.user_id=GlobalUserId;
    [self presentViewController:urViewController animated:YES completion:nil];
 
}

- (IBAction)btn4:(id)sender {
    
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.ImageFile = [[ImageFile alloc] initWithNibName:@"ImageFile" bundle:nil];
    self.window.rootViewController = self.ImageFile;
    [self.window makeKeyAndVisible];
    /*
    imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.delegate = self;
   // imagePicker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentViewController:imagePicker animated:YES completion:nil];
     */
}
/*
- (NSMutableArray *)showFiles {
    NSError *err = nil;
    NSArray *myPathList = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *myPath = [myPathList objectAtIndex:0];
    NSArray *dirContent = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:myPath error:&err];
    if(err)
        NSLog(@"showFiles() - ERROR: %@",[err localizedDescription]);
    NSMutableArray *filePaths = nil;
    int count = (int)[dirContent count];
    for(int i=0; i<count; i++)
    { [filePaths addObject:[dirContent objectAtIndex:i]];
    } return filePaths;
}
 */



#pragma mark - UIImagePickerControllerDelegate methods

/*
 Open PECropViewController automattically when image selected.
 */
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    image_view.image = image;
    NSLog(@"bbbbbbbbb=%@",info.description);
    NSURL *url=[info
                objectForKey:UIImagePickerControllerReferenceURL];
    NSLog(@"yyyyyyy=%@",url.description);
       [tableData addObject:[NSString stringWithFormat:@"%@",url.description]];
    NSURL *url1=[info
                 objectForKey:UIImagePickerControllerMediaURL];
    NSLog(@"nnnn=%s",url1.fileSystemRepresentation);
    
    
    NSURL *imageURL = [info valueForKey:UIImagePickerControllerReferenceURL];
    
    assetsLibrary = [[ALAssetsLibrary alloc] init];
    [assetsLibrary assetForURL:imageURL resultBlock:^(ALAsset *asset) {
        ALAssetRepresentation *assetRep = [asset defaultRepresentation];
        NSLog(@"Image filename: %@", [assetRep filename]);
         [fileName addObject:[NSString stringWithFormat:@"%@",[assetRep filename]]];
    } failureBlock:^(NSError *error) {
        NSLog(@"Error: %@", error.localizedDescription);
    }];
    
    
    NSLog(@"imageURL %@",imageURL);

    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        
    } else {
        [picker dismissViewControllerAnimated:YES completion:^{
            //[self openEditor:nil];
        }];
    }
    ViewController *urViewController = (ViewController *)[[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"ViewController"];
    // urViewController.user_id=GlobalUserId;
    [self presentViewController:urViewController animated:YES completion:nil];
    
}



///
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo
{
    [imagePicker dismissModalViewControllerAnimated:YES];
    [image_view setImage:image];
}

//  On cancel, only dismiss the picker controller
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [imagePicker dismissModalViewControllerAnimated:YES];
}
@end
