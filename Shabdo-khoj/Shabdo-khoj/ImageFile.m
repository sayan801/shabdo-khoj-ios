//
//  ImageFile.m
//  Shabdo-khoj
//
//  Created by technicise on 4/28/15.
//  Copyright (c) 2015 technicise.com. All rights reserved.
//

#import "ImageFile.h"
#import "AppDelegate.h"
#import <AssetsLibrary/AssetsLibrary.h>


@interface ImageFile ()

@end

@implementation ImageFile
@synthesize imagePicker;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
  /*  UIImageView *image ;
    [image setAccessibilityIdentifier:@"file name"] ;
    
    NSString *file_name = [image accessibilityIdentifier] ;
    NSLog(@"image name=%@",file_name);
    */
    
    
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

- (IBAction)imageSave:(id)sender {
    //self.image_view *image ;
   /* [self.image_view setAccessibilityIdentifier:@"file name"] ;
    
    NSString *file_name = [self.image_view accessibilityIdentifier] ;
    NSLog(@"image name=%@",file_name);
    */
    id delegate7 = [UIApplication sharedApplication].delegate;
    NSManagedObjectContext *context = [delegate7 managedObjectContext];
    NSManagedObject *dataRecord7 = [NSEntityDescription
                                    insertNewObjectForEntityForName:@"ImageSets" inManagedObjectContext:context];
    
    
     NSError *error;
   
        if (self.image_view.image)
        {
            // Resize and save a smaller version for the table
            float resize = 74.0;
            float actualWidth = self.image_view.image.size.width;
            float actualHeight = self.image_view.image.size.height;
            float divBy, newWidth, newHeight;
            if (actualWidth > actualHeight)
            {
                divBy = (actualWidth / resize);
                newWidth = resize;
                newHeight = (actualHeight / divBy);
            } else
            {
                divBy = (actualHeight / resize);
                newWidth = (actualWidth / divBy);
                newHeight = resize;
            }
            CGRect rect = CGRectMake(
                                     0.0, 0.0, actualWidth, actualHeight);
            UIGraphicsBeginImageContext(rect.size);
            [self.image_view.image drawInRect:rect];
            UIImage *smallImage = UIGraphicsGetImageFromCurrentImageContext();
             NSLog(@"smallImage=%@",smallImage);
            UIGraphicsEndImageContext();
            
            // Save the small image version
            NSData *smallImageData = UIImageJPEGRepresentation(smallImage, 1.0);
             [dataRecord7 setValue:smallImageData forKey:@"image"];
           // [matches setValue:smallImageData forKey:@"image"];
            NSLog(@"end");
        }
    
        if (![context save:&error])
        {
            NSLog(@"Failed to add new picture with error: %@", [error domain]);
        }
        else
        {
            NSLog(@"inserted");
        }

}

- (IBAction)GalleryOpen:(id)sender {
    imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.delegate = self;
    imagePicker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
   // NSArray *documentsDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    
//    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"self.lastPathComponent == %@", searchFilename];
//    NSArray *matchingPaths = [[[NSFileManager defaultManager] supbathsAtPath:documentsDirectory] filterUsingPredicate:predicate];
    
   // NSLog(@"%@", matchingPaths);
    [self presentViewController:imagePicker animated:YES completion:nil];

    //[self openPhotoAlbum];
}

- (IBAction)CameraOpen:(id)sender {
    //If you use real device then open the code.But if you open it for test in simulator it will crash because simulator have no camera.
    
    
     imagePicker = [[UIImagePickerController alloc] init];
     imagePicker.delegate = self;
     imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
     imagePicker.cameraDevice = UIImagePickerControllerCameraDeviceRear;
     [self presentViewController:imagePicker animated:YES completion:nil];
     
    

    
//[self showCamera];
}



- (IBAction)back:(id)sender {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.AddingFilesOption = [[AddingFilesOption alloc] initWithNibName:@"AddingFilesOption" bundle:nil];
    self.window.rootViewController = self.AddingFilesOption;
    [self.window makeKeyAndVisible];
}
/*
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info;
{
    // get the ref url
    NSURL *refURL = [info valueForKey:UIImagePickerControllerReferenceURL];
    
    // define the block to call when we get the asset based on the url (below)
    ALAssetsLibraryAssetForURLResultBlock resultblock = ^(ALAsset *imageAsset)
    {
        ALAssetRepresentation *imageRep = [imageAsset defaultRepresentation];
        NSLog(@"[imageRep filename] : %@", [imageRep filename]);
    };
    
    // get the asset library and fetch the asset based on the ref url (pass in block above)
    ALAssetsLibrary* assetslibrary = [[ALAssetsLibrary alloc] init];
    [assetslibrary assetForURL:refURL resultBlock:resultblock failureBlock:nil];
    
}
 */
#pragma mark - UIImagePickerControllerDelegate methods

/*
 Open PECropViewController automattically when image selected.
 */
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    self.image_view.image = image;
    NSLog(@"bbbbbbbbb=%@",info.description);
    NSURL *url=[info
                objectForKey:UIImagePickerControllerReferenceURL];
      NSLog(@"yyyyyyy=%@",url.description);
    
    
    NSURL *url1=[info
                objectForKey:UIImagePickerControllerMediaURL];
    NSLog(@"nnnn=%s",url1.fileSystemRepresentation);


    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
      
    } else {
        [picker dismissViewControllerAnimated:YES completion:^{
            //[self openEditor:nil];
        }];
    }
}






///
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo
{
    [imagePicker dismissModalViewControllerAnimated:YES];
    [self.image_view setImage:image];
}

//  On cancel, only dismiss the picker controller
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    //[imagePicker dismissModalViewControllerAnimated:YES];
}
@end
