//
//  Week3RecipeDetailViewController.h
//  Week3Recipe
//
//  Created by Charles Konkol on 2/1/13.
//  Copyright (c) 2013 RVC Student. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Week3RecipeDetailViewController : UIViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) id detailItem;

@property (strong, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end
