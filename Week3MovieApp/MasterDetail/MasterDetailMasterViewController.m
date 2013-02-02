//
//  MasterDetailMasterViewController.m
//  MasterDetail
//
//  Created by Wei-Meng Lee on 3/9/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "MasterDetailMasterViewController.h"

#import "MasterDetailDetailViewController.h"

@implementation MasterDetailMasterViewController

@synthesize detailViewController = _detailViewController;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Master", @"Master");
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
            self.clearsSelectionOnViewWillAppear = NO;
            self.contentSizeForViewInPopover = CGSizeMake(320.0, 600.0);
        }
    }
    return self;
}
							
- (void)dealloc
{
    [_detailViewController release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    //---
    //—-initialize the array—-
    listOfMovies = [[NSMutableArray alloc] init];
    [listOfMovies addObject:@"Training Day"];
    [listOfMovies addObject:@"Remember the Titans"];
    [listOfMovies addObject:@"John Q."];
    [listOfMovies addObject:@"The Bone Collector"];
    [listOfMovies addObject:@"Ricochet"];
    [listOfMovies addObject:@"The Siege"];
    [listOfMovies addObject:@"Malcolm X"];
    [listOfMovies addObject:@"Antwone Fisher"];
    [listOfMovies addObject:@"Courage Under Fire"];
    [listOfMovies addObject:@"He Got Game"];
    [listOfMovies addObject:@"The Pelican Brief"];
    [listOfMovies addObject:@"Glory"];
    [listOfMovies addObject:@"The Preacher’s Wife"];
    
    MovieDetails= [[NSMutableArray alloc] init];
    [MovieDetails addObject:@"http://www.imdb.com/title/tt0139654/"];
    [MovieDetails addObject:@"http://www.imdb.com/title/tt0210945/"];
    [MovieDetails addObject:@"http://www.imdb.com/title/tt0251160/"];
    [MovieDetails addObject:@"http://www.imdb.com/title/tt0145681/"];
    [MovieDetails addObject:@"http://www.imdb.com/title/tt0102789/"];
    [MovieDetails addObject:@"http://www.imdb.com/title/tt0133952/"];
    [MovieDetails addObject:@"http://www.imdb.com/title/tt0104797/"];
    [MovieDetails addObject:@"http://www.imdb.com/title/tt0168786/"];
    [MovieDetails addObject:@"http://www.imdb.com/title/tt0115956/"];
    [MovieDetails addObject:@"http://www.imdb.com/title/tt0124718/"];
    [MovieDetails addObject:@"http://www.imdb.com/title/tt0107798/"];
    [MovieDetails addObject:@"http://www.imdb.com/title/tt0097441/"];
    [MovieDetails addObject:@"http://www.imdb.com/title/tt0117372/"];
    
    //—-set the title—-
    self.navigationItem.title = NSLocalizedString(@"Movies", @"Movies");
    //---
    [super viewDidLoad];
    
	// Do any additional setup after loading the view, typically from a nib.
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        [self.tableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:NO scrollPosition:UITableViewScrollPositionMiddle];
        //---
        self.detailViewController = 
        (MasterDetailDetailViewController *) [[self.splitViewController.viewControllers lastObject] topViewController];
        //---        
    }
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

// Customize the number of sections in the table view.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //return 1;
    //---
    return [listOfMovies count];
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
    }

    // Configure the cell.
    //cell.textLabel.text = NSLocalizedString(@"Detail", @"Detail");
    //---
    cell.textLabel.text = [listOfMovies objectAtIndex:indexPath.row];
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source.
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
	    if (!self.detailViewController) {
	        self.detailViewController = [[[MasterDetailDetailViewController alloc] initWithNibName:@"MasterDetailDetailViewController_iPhone" bundle:nil] autorelease];
	    }
        //---        
        //closes Menu
        self.detailViewController.detailItem =
        [NSString stringWithFormat:@"loadingmovie"];
        //loads url into webview on iPhone
        NSURL *url = [NSURL URLWithString:[MovieDetails objectAtIndex:indexPath.row]];
        NSURLRequest *req = [NSURLRequest requestWithURL:url];
        [self.detailViewController.WebSite loadRequest:req];
        
        //---
        
        [self.navigationController pushViewController:self.detailViewController animated:YES];
    }
    //---
    else
    {
        //closes Menu
        self.detailViewController.detailItem =
        [NSString stringWithFormat:@"loadingmovie"];
        //loads url into webview on iPad
        NSURL *url = [NSURL URLWithString:[MovieDetails objectAtIndex:indexPath.row]];
        NSURLRequest *req = [NSURLRequest requestWithURL:url];
        [self.detailViewController.WebSite loadRequest:req];
    }
    //---    
}

@end
