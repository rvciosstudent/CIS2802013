//
//  RecipesMasterViewController.h
//  Recipes
//
//  Created by Charles Konkol on 2/2/13.
//  Copyright (c) 2013 RVC Student. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RecipesDetailViewController;

@interface RecipesMasterViewController : UITableViewController

@property (strong, nonatomic) RecipesDetailViewController *detailViewController;

@end
