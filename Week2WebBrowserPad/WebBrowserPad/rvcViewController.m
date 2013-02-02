//
//  rvcViewController.m
//  WebBrowserPad
//
//  Created by Charles Konkol on 1/21/13.
//  Copyright (c) 2013 Charles Konkol. All rights reserved.
//

#import "rvcViewController.h"

@interface rvcViewController ()

@end

@implementation rvcViewController
@synthesize txtUrl;
@synthesize WebView;

- (void)viewDidLoad
{
    NSURL *url = [NSURL URLWithString:@"http://rockvalleycollege.edu"];
    NSURLRequest *req = [NSURLRequest requestWithURL:url];
    [WebView loadRequest:req];
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [txtUrl release];
    [WebView release];
    [super dealloc];
}
- (IBAction)btnGo:(id)sender {
    //Send textbox URL to Browser
    NSURL *url = [NSURL URLWithString:txtUrl.text];
    NSURLRequest *req = [NSURLRequest requestWithURL:url];
    [WebView loadRequest:req];
    
}
@end
