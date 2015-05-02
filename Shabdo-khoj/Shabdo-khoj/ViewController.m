//
//  ViewController.m
//  Shabdo-khoj
//
//  Created by technicise on 4/28/15.
//  Copyright (c) 2015 technicise.com. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "SWTableViewCell.h"

@interface ViewController ()

@end

@implementation ViewController{

   // NSArray *tableData;
    NSManagedObject *matches;
    NSArray *objects;
   int SelectedIndex;
     NSString *strIndex;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
       strIndex=@" ";
    
//    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//    NSString *documentsDirectory = paths[0];
//    NSFileManager *fileMgr = [NSFileManager defaultManager];
//   // NSArray *fileArray = [fileMgr contentsOfDirectoryAtPath:documentsDirectory error:nil];
//    tableData = [fileMgr contentsOfDirectoryAtPath:documentsDirectory error:nil];
    
    // tableData = [NSArray arrayWithObjects:@"Nepal Earth Quake News", @"Speech Processing Technology Lecture", @"Scientific Research Areas", @"Mumbai Trip", @"Fast and Furious 7", @"Cooking Recipes of Bengal", @"White Chocolate Donut recipe", @"English Premier League Highlights", @"Liga BBGA Goals", @"Instant Noodle with Egg", @"Noodle with BBQ Pork", @"Japanese Motor technlogy Preview", @"Green Kerala Tourism", @"Thai Shrimp Cake Recipe", @"Angry Birds In Making - Behind the Scene", @"Ham and Cheese Panini", nil];
    
    id delegate = [UIApplication sharedApplication].delegate;
    NSManagedObjectContext *context = [delegate managedObjectContext];
    NSEntityDescription *entity = [NSEntityDescription
                                   entityForName:@"ImageSets" inManagedObjectContext:context];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    
    [request setEntity:entity];
    NSError *error;
    
    // NSPredicate *pred=[NSPredicate predicateWithFormat:@"(user_id=%@)",GlobalUserId];
    // [request setPredicate:pred];
    
    matches=nil;
    objects=[context executeFetchRequest:request error:&error];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [tableData count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
        return 90;

}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    
    SWTableViewCell *cell = (SWTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        
        cell = [[SWTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
        
        cell.rightUtilityButtons = [self rightButtons];
        cell.delegate = self;
    }
    cell.textLabel.text =[fileName objectAtIndex:indexPath.row];
    cell.detailTextLabel.text=[tableData objectAtIndex:indexPath.row];//    if([objects count]!=0)
//        {
//            matches= [objects objectAtIndex:indexPath.row];
//    
//            if ([matches valueForKey:@"image"])
//            {
//                //self.imageField.contentMode = UIViewContentModeScaleAspectFit;
//                cell.imageView.image= [UIImage imageWithData:[matches valueForKey:@"image"]];
//            }
//            else
//            {
//                cell.imageView.image= [UIImage imageNamed:@"ChartDataPointNormal.png"];
//            }
//        }
//    else
//    {
     cell.imageView.image= [UIImage imageNamed:@"ChartDataPointNormal.png"];
   // }
   
    cell.textLabel.lineBreakMode=NSLineBreakByWordWrapping;
    [cell.textLabel setNumberOfLines:0];
    return cell;
}


- (IBAction)AddFiles:(id)sender {
   
    /*
    NSBundle *mainBundle = [NSBundle mainBundle];
    NSString *myFile = [mainBundle pathForResource: @"data" ofType: @"bin"];
    
    NSLog(@"Main bundle path: %@", mainBundle);
    NSLog(@"myFile path: %@", myFile);
    */
   //  Override point for customization after application launch.
        self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        self.AddingFilesOption = [[AddingFilesOption alloc] initWithNibName:@"AddingFilesOption" bundle:nil];
    //    _viewController2.user_id = user_id1;
    //    _viewController2.status = @"other";
        self.window.rootViewController = self.AddingFilesOption;
        [self.window makeKeyAndVisible];
}

- (NSArray *)rightButtons
{
    NSMutableArray *rightUtilityButtons = [NSMutableArray new];
    [rightUtilityButtons sw_addUtilityButtonWithColor:
     [UIColor colorWithRed:0.78f green:0.78f blue:0.8f alpha:1.0]
                                                title:@"Index"];
    [rightUtilityButtons sw_addUtilityButtonWithColor:
     [UIColor colorWithRed:0.78f green:0.78f blue:0.8f alpha:1.0]
                                                title:@"Tags"];
    [rightUtilityButtons sw_addUtilityButtonWithColor:
     [UIColor colorWithRed:0.78f green:0.78f blue:0.8f alpha:1.0]
                                                title:@"Play"];

    
    return rightUtilityButtons;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    SelectedIndex=(int)indexPath.row;
     strIndex=@"yes";
    
}

- (void)swipeableTableViewCell:(SWTableViewCell *)cell didTriggerRightUtilityButtonWithIndex:(NSInteger)index {
    
    switch (index)
    {
            //Come =@"MyChartTableViewController";
        case 0:
        {
            
//            Toast *mToast = [Toast toastWithMessage:@"favorites functionality is comming shortly"];
//            [mToast showOnView:self.view];
             NSLog(@"index");
            
            break;
        }
        case 1:
        {
            /*
             Toast *mToast = [Toast toastWithMessage_Community_nointernet:@"Delete functionality for indivo data base comming soon...."];
             [mToast showOnView:self.view];
             */
            NSLog(@"tags");
             //[self playMovie];
            if ([strIndex isEqualToString:@" "]) {
                
                
                UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Alert" message:@"Please Selct An Index" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:nil, nil];
                [alert show];
                
            }
            else
            {

             [self startMediaBrowserFromViewController: self usingDelegate: self];
            }
            
            break;
        }
        case 2:
        {
//                       Toast *mToast = [Toast toastWithMessage:@"Edit functionality has been enabled"];
//            [mToast showOnView:self.view];
           // EditEnable=YES;
            
           
             NSLog(@"play");
            
            break;
        }
            
        default:
            break;
    }
}






-(void)playMovie
{
   
   
    NSURL *url=[NSURL URLWithString:[NSString stringWithFormat:@"%@",[tableData objectAtIndex:SelectedIndex]]];
      _moviePlayer =  [[MPMoviePlayerController alloc]
                     initWithContentURL:url];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(moviePlayBackDidFinish:)
                                                 name:MPMoviePlayerPlaybackDidFinishNotification
                                               object:_moviePlayer];
    
    _moviePlayer.controlStyle = MPMovieControlStyleDefault;
    _moviePlayer.shouldAutoplay = YES;
    [self.view addSubview:_moviePlayer.view];
    [_moviePlayer setFullscreen:YES animated:YES];
}
- (void) moviePlayBackDidFinish:(NSNotification*)notification {
    MPMoviePlayerController *player = [notification object];
    [[NSNotificationCenter defaultCenter]
     removeObserver:self
     name:MPMoviePlayerPlaybackDidFinishNotification
     object:player];
    
    if ([player
         respondsToSelector:@selector(setFullscreen:animated:)])
    {
        [player.view removeFromSuperview];
    }
}


- (BOOL) startMediaBrowserFromViewController: (UIViewController*) controller
                               usingDelegate: (id <UIImagePickerControllerDelegate,
                                               UINavigationControllerDelegate>) delegate{
    
   
    int x=SelectedIndex;
    
    NSArray *componentsArray = [[fileName objectAtIndex:x] componentsSeparatedByString:@"."];
    NSString *fileExtension = [componentsArray lastObject];
    NSLog(@"fileExtension %@",fileExtension);
    if ([fileExtension isEqualToString:@"MOV"])
    {
        /*
        NSLog(@"MOV");
        if (([UIImagePickerController isSourceTypeAvailable:
              UIImagePickerControllerSourceTypeSavedPhotosAlbum] == NO)
            || (delegate == nil)
            || (controller == nil))
            return NO;
        
        UIImagePickerController *mediaUI = [[UIImagePickerController alloc] init];
        mediaUI.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
        
        mediaUI.mediaTypes = [[NSArray alloc] initWithObjects: (NSString *) kUTTypeMovie, nil];
        
        // Hides the controls for moving & scaling pictures, or for
        // trimming movies. To instead show the controls, use YES.
        mediaUI.allowsEditing = YES;
        
        mediaUI.delegate = delegate;
        
        [controller presentModalViewController: mediaUI animated: YES];
        */
      [self playMovie];

    }
    else if ([fileExtension isEqualToString:@"JPG"])
    {
      UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
        imagePicker.delegate = self;
        imagePicker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
        // NSArray *documentsDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
        
        //    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"self.lastPathComponent == %@", searchFilename];
        //    NSArray *matchingPaths = [[[NSFileManager defaultManager] supbathsAtPath:documentsDirectory] filterUsingPredicate:predicate];
        
        // NSLog(@"%@", matchingPaths);
        [self presentViewController:imagePicker animated:YES completion:nil];
    }
    
      return YES;
    
}
// For responding to the user tapping Cancel.
- (void) imagePickerControllerDidCancel: (UIImagePickerController *) picker {
    
    [self dismissModalViewControllerAnimated: YES];
}

// For responding to the user accepting a newly-captured picture or movie
- (void) imagePickerController: (UIImagePickerController *) picker
 didFinishPickingMediaWithInfo: (NSDictionary *) info {
    
    NSString *mediaType = [info objectForKey: UIImagePickerControllerMediaType];
    
    [self dismissModalViewControllerAnimated:NO];
    
    // Handle a movie capture
    if (CFStringCompare ((__bridge_retained CFStringRef)mediaType, kUTTypeMovie, 0)
        == kCFCompareEqualTo) {
        
        NSString *moviePath = [[info objectForKey:
                                UIImagePickerControllerMediaURL] path];
        MPMoviePlayerViewController* theMovie =
        [[MPMoviePlayerViewController alloc] initWithContentURL: [info objectForKey:
                                                                  UIImagePickerControllerMediaURL]];
        [self presentMoviePlayerViewControllerAnimated:theMovie];
        
        // Register for the playback finished notification
        [[NSNotificationCenter defaultCenter]
         addObserver: self
         selector: @selector(myMovieFinishedCallback:)
         name: MPMoviePlayerPlaybackDidFinishNotification
         object: theMovie];
        
        
    }
}
// When the movie is done, release the controller.
-(void) myMovieFinishedCallback: (NSNotification*) aNotification
{
    [self dismissMoviePlayerViewControllerAnimated];
    
    MPMoviePlayerController* theMovie = [aNotification object];
    
    [[NSNotificationCenter defaultCenter]
     removeObserver: self
     name: MPMoviePlayerPlaybackDidFinishNotification
     object: theMovie];
    // Release the movie instance created in playMovieAtURL:
}


@end
