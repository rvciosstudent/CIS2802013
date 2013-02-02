//
//  MasterDetailMasterViewController.h
//  MasterDetail
//
//  Created by Wei-Meng Lee on 3/9/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MasterDetailDetailViewController;

@interface MasterDetailMasterViewController : UITableViewController
{
    NSMutableArray *listOfMovies;
    NSMutableArray *MovieDetails;
}

@property (strong, nonatomic) MasterDetailDetailViewController *detailViewController;

@end
