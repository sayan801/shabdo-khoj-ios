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

    NSArray *tableData;
    NSManagedObject *matches;
    NSArray *objects;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
     tableData = [NSArray arrayWithObjects:@"Egg Benedict", @"Mushroom Risotto", @"Full Breakfast", @"Hamburger", @"Ham and Egg Sandwich", @"Creme Brelee", @"White Chocolate Donut", @"Starbucks Coffee", @"Vegetable Curry", @"Instant Noodle with Egg", @"Noodle with BBQ Pork", @"Japanese Noodle with Pork", @"Green Tea", @"Thai Shrimp Cake", @"Angry Birds Cake", @"Ham and Cheese Panini", nil];
    
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
//    
//    if([objects count]!=0)
//    {
//        matches= [objects objectAtIndex:0];
//        
//        if ([matches valueForKey:@"image"])
//        {
//            //self.imageField.contentMode = UIViewContentModeScaleAspectFit;
//            self.image_view.image= [UIImage imageWithData:[matches valueForKey:@"image"]];
//            
//            // [self.image setBackgroundImage:[UIImage imageWithData:[matches valueForKey:@"profilepicture"]] forState:UIControlStateNormal];
//            
//        }
//    }
//    else{
//        
//        NSLog(@"not found");
//        [self.image_view setHidden:YES];
//    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [tableData count];
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
    cell.textLabel.text = [tableData objectAtIndex:indexPath.row];
    if([objects count]!=0)
        {
    matches= [objects objectAtIndex:indexPath.row];
    
            if ([matches valueForKey:@"image"])
            {
                //self.imageField.contentMode = UIViewContentModeScaleAspectFit;
                cell.imageView.image= [UIImage imageWithData:[matches valueForKey:@"image"]];
            }
        }
    else
    {
     cell.imageView.image= [UIImage imageNamed:@"phoneicon@1x.png"];
    }
   
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
