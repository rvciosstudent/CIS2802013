//
//  MyFavesMasterViewController.m
//  MyFaves
//
//  Created by Charles Konkol on 2/2/13.
//  Copyright (c) 2013 RVC Student. All rights reserved.
//

#import "MyFavesMasterViewController.h"

#import "MyFavesDetailViewController.h"

@interface MyFavesMasterViewController () {
    NSMutableArray *_objects;
}
@end

@implementation MyFavesMasterViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"MyFavs", @"MyFavs");
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
    [_objects release];
    [super dealloc];
}

- (void)viewDidLoad
{
   
    //—-initialize  listOfFavs array—-
    listOfFavs = [[NSMutableArray alloc] init];
    [listOfFavs addObject:@"Mall"];
    [listOfFavs addObject:@"Biking"];
    [listOfFavs addObject:@"Reading"];
    
    //—-initialize  FavDetails array—-
    FavDetails= [[NSMutableArray alloc] init];
    [FavDetails addObject:@"http://www.shopcherryvalemall.com/shop/cherryvale.nsf/index"];
    [FavDetails addObject:@"http://www.bicycling.com/mountainbikecom"];
    [FavDetails addObject:@"http://www.rockfordpubliclibrary.org/"];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    // self.navigationItem.leftBarButtonItem = self.editButtonItem;
    
    // UIBarButtonItem *addButton = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)] autorelease];
    // self.navigationItem.rightBarButtonItem = addButton;

    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
   // self.navigationItem.leftBarButtonItem = self.editButtonItem;

    //UIBarButtonItem *addButton = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)] autorelease];
    //self.navigationItem.rightBarButtonItem = addButton;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)insertNewObject:(id)sender
{
    if (!_objects) {
        _objects = [[NSMutableArray alloc] init];
    }
    [_objects insertObject:[NSDate date] atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //Comment out return _objects.count;
    //return _objects.count;
    
    //add return for array listofmovies
    return [listOfFavs count];
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
    
    //Comment out NSDate use in original logic
    //NSDate *object = _objects[indexPath.row];
    
    //Comment out exising cell.textlabel
    //cell.textLabel.text = [object description];
    
    //Add below code referencing listofMovies
    cell.textLabel.text = [listOfFavs objectAtIndex:indexPath.row];
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [_objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

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
    //Comment out below line
    //NSDate *object = _objects[indexPath.row];
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        if (!self.detailViewController) {
            self.detailViewController = [[[MyFavesDetailViewController alloc] initWithNibName:@"MyFavesDetailViewController_iPhone" bundle:nil] autorelease];
        }
        //comment out below line
        //self.detailViewController.detailItem = object;
        //closes Menu
        self.detailViewController.detailItem =
        [NSString stringWithFormat:@"loadingmovie"];
        //loads url into webview on iPhone
        NSURL *url = [NSURL URLWithString:[FavDetails objectAtIndex:indexPath.row]];
        NSURLRequest *req = [NSURLRequest requestWithURL:url];
        [self.detailViewController.WebSite loadRequest:req];
        [self.navigationController pushViewController:self.detailViewController animated:YES];
    }
    else
    {
        //closes Menu
        self.detailViewController.detailItem =
        [NSString stringWithFormat:@"loadingmovie"];
        //loads url into webview on iPad
        NSURL *url = [NSURL URLWithString:[FavDetails objectAtIndex:indexPath.row]];
        NSURLRequest *req = [NSURLRequest requestWithURL:url];
        [self.detailViewController.WebSite loadRequest:req];
    }
    //self.detailViewController.detailItem = object;
}

@end
