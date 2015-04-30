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
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
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

@end
