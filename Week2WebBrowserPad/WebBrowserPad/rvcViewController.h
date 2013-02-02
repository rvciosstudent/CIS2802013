//  rvcViewController.h
//  WebBrowserPad
//
//  Created by Charles Konkol on 1/21/13.
//  Copyright (c) 2013 Charles Konkol. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface rvcViewController : UIViewController
{
    IBOutlet UITextField *txtUrl;
    IBOutlet UIWebView *WebView;
}
@property (retain, nonatomic) UITextField *txtUrl;
@property (retain, nonatomic) UIWebView *WebView;

- (IBAction)btnGo:(id)sender;



@end
