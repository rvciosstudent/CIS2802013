//
//  rvcViewController.h
//  MyHelloApplication
//
//  Created by Charles Konkol on 1/7/13.
//  Copyright (c) 2013 Charles Konkol. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface rvcViewController : UIViewController
{
    IBOutlet UITextField *txtHello;
}
- (IBAction)btnClicked:(id)sender;
- (IBAction)btnSubmit:(id)sender;

@property (retain, nonatomic) IBOutlet UIButton *btnSubmit;
@property (retain, nonatomic) IBOutlet UITextField *txtHello;



@end
