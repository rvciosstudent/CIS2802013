//
//  Week3RecipeMasterViewController.h
//  Week3Recipe
//
//  Created by Charles Konkol on 2/1/13.
//  Copyright (c) 2013 RVC Student. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Week3RecipeDetailViewController;

@interface Week3RecipeMasterViewController : UITableViewController
{
    NSMutableArray *listOfRecipes;
}

@property (strong, nonatomic) Week3RecipeDetailViewController *detailViewController;

@end
