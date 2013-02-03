//
//  MyFavesMasterViewController.h
//  MyFaves
//
//  Created by Charles Konkol on 2/2/13.
//  Copyright (c) 2013 RVC Student. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MyFavesDetailViewController;

@interface MyFavesMasterViewController : UITableViewController
{
    //Declare Arrays
    NSMutableArray *listOfFavs;
    NSMutableArray *FavDetails;
}

@property (strong, nonatomic) MyFavesDetailViewController *detailViewController;

@end
