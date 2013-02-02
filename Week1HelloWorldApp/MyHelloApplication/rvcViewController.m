//
//  rvcViewController.m
//  MyHelloApplication
//
//  Created by Charles Konkol on 1/7/13.
//  Copyright (c) 2013 Charles Konkol. All rights reserved.
//

#import "rvcViewController.h"

@interface rvcViewController ()

@end

@implementation rvcViewController
@synthesize txtHello;

- (IBAction)btnClicked:(id)sender {
    UIAlertView *alert =
    [[UIAlertView alloc] initWithTitle:@"Hello World!"
                               message:@"iPhone, here I come!"
                              delegate:self
                     cancelButtonTitle:@"OK"
                     otherButtonTitles:nil];
    [alert show];
    [alert release];
}

- (IBAction)btnSubmit:(id)sender {
    NSString *str = [[NSString alloc] initWithFormat: @"Hello, %@", txtHello.text];
    UIAlertView *alert =
    [[UIAlertView alloc] initWithTitle:@"Hello World!"
                        message:str
        delegate:self
        cancelButtonTitle:@"OK"
        otherButtonTitles:nil];
    [alert show];
    [str release];
    [alert release];
    txtHello.text=@"";
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_btnSubmit release];
    [txtHello release];
    [super dealloc];
}
@end
