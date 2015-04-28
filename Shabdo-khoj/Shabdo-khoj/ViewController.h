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

@class AddingFilesOption;

@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,SWTableViewCellDelegate>



@property (strong, nonatomic) UIWindow *window;
@property(strong, nonatomic) UINavigationController *navigationController;
@property (strong, nonatomic) AddingFilesOption *AddingFilesOption;




- (IBAction)AddFiles:(id)sender;


@property (strong, nonatomic) IBOutlet UITableView *tableView;






@end

