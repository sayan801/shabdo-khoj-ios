//
//  ImageFile.m
//  Shabdo-khoj
//
//  Created by technicise on 4/28/15.
//  Copyright (c) 2015 technicise.com. All rights reserved.
//

#import "ImageFile.h"
#import "AppDelegate.h"


@interface ImageFile ()

@end

@implementation ImageFile
@synthesize imagePicker;
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

- (IBAction)imageSave:(id)sender {
    AppDelegate *delegate = [UIApplication sharedApplication].delegate;
    NSManagedObjectContext *context = [delegate managedObjectContext];
    NSEntityDescription *entity = [NSEntityDescription
                                   entityForName:@"ImageSets" inManagedObjectContext:context];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    
    [request setEntity:entity];
    NSError *error;
    
   // NSPredicate *pred=[NSPredicate predicateWithFormat:@"(user_id=%@)",GlobalUserId];
   // [request setPredicate:pred];
    
    NSManagedObject *matches=nil;
    NSArray *objects=[context executeFetchRequest:request error:&error];
//    if([objects count]!=0)
//    {
       // matches= [objects objectAtIndex:0];
    
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
            UIGraphicsEndImageContext();
            
            // Save the small image version
            NSData *smallImageData = UIImageJPEGRepresentation(smallImage, 1.0);
            [matches setValue:smallImageData forKey:@"image"];
            NSLog(@"end");
        }
        
        //  Commit item to core data
       // NSError *error;
        if (![context save:&error])
        {
            NSLog(@"Failed to add new picture with error: %@", [error domain]);
        }
        else
        {
            NSLog(@"inserted");
        }
        
        // addProfilePicture
        
        
   // }

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



@end
