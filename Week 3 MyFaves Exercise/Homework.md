DetailView - MyFaves

1) Open XCode. File > New Project > Master-Detail Application > Next

Fill Project Info:  App Info: image://http://screencast.com/t/B7gNxJAbwIb
    
    •ProjectName: MyFaves
    
    •OrganizationName: RVC Student
    
    •Company Idetifier:edu.rockvalleycollege
    
    •Devices: Univeral
    
    (DO NOT CHECK ANY CHECKBOXES)
    
    - Click NEXT
    - Save project in MAC Folder. DO NOT CLICK SOURCE CONTRO
    - Click Create

2) Go to Page: MyFavesMasterViewController.h and add the lines under the @interface line of code

     @interface MyFavesMasterViewController : UITableViewController
    {
    //Declare Arrays
    NSMutableArray *listOfFavs;
    NSMutableArray *FavDetails;
    }


3) Go to Page: MyFavesMasterViewController.m


4) Go to function: - (void)viewDidLoad and initilize 2 arrays, comment out lines, add code for iPad

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
    } 

4) Go to Function: - (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section

    - (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
    {
    //Comment out return _objects.count;
    //return _objects.count;

    //add return for array listofmovies
    return [listOfFavs count];
    }

5) Go to Function: - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath add below code and comments

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


6) Add UIWebView to iPad and iPhone.Make sure and check "Scale Page to fit"

7) Connect both UIWebViews to File Owner and select WebView

   CTRL+CLICK+DRAG UIWebView to MyFavesDetailViewController.h //iPad or iPhone .xib

   See http://screencast.com/t/t5MGiLOD

    #import <UIKit/UIKit.h>

    @interface MyFavesDetailViewController : UIViewController <UISplitViewControllerDelegate>

    @property (strong, nonatomic) id detailItem;

    @property (strong, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

    @property (retain, nonatomic) IBOutlet UIWebView *WebSite;

    @end

8) Connect both UIWebViews to File Owner and select WebView

   CTRL+CLICK+DRAG FileOwner to UIWebView for iPad and iPhone .xib files.
   Click on WebSite object to complete connection for iPad and iPhone UIWebView object

9) Go to page: MyFavesDetailViewController.m and add code for @sythesize

    @implementation MyFavesDetailViewController
    //Add @sythesize Code
    @synthesize detailItem = _detailItem;
    @synthesize detailDescriptionLabel = _detailDescriptionLabel;
    @synthesize masterPopoverController = _masterPopoverController;
    @synthesize WebSite = _WebSite;

10) Go to Page: MyFavesMasterViewController.m
Function: - (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath

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

11) Change titles of menu in MasterView and DetailView

Open and edit self.title line for MyFavesMasterViewController.m

    - (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
   {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    //Change Title
    self.title = NSLocalizedString(@"MyFavs", @"MyFavs");
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        self.clearsSelectionOnViewWillAppear = NO;
        self.contentSizeForViewInPopover = CGSizeMake(320.0, 600.0);
     }
    }
    return self;
    }

Open and edit self.title lines for MyFavesDetailViewController.m

    - (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
    {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    //Title of Middle DetailView
    self.title = NSLocalizedString(@"MyFavs Info", @"MyFavs Info");
    }
    return self;
    }


    - (void)splitViewController:(UISplitViewController *)splitController willHideViewController:(UIViewController *)viewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)popoverController
    {
    //Title of Left DetailView
    barButtonItem.title = NSLocalizedString(@"MyFavs", @"MyFavs");
    [self.navigationItem setLeftBarButtonItem:barButtonItem animated:YES];
    self.masterPopoverController = popoverController;
    }

12) Add Icon

- Make sure you have added 2 images in Supporting Files folder for Universal Apps
  * 57x57 size for iPhone
  * 72x72 size for iPad
  I use http://pixlr.com to create images. Images can be .jpg files
- Click on each image in supporting files folder then click the "Make Localize Button"

See Screenshot of Making Localized: image://http://screencast.com/t/JMfaGsljCxOq

- Open Page: Supporting Files/MyFavs-Info.plist
- Edit Page by clicking the + symbol twice next to add 2 new image names.
  (Images for icons need to be 72x72 iPad, 57x57 iPhone)
- type in the name of the photos located in the supporting file

13) Test in iPad and iPhone Simulator

14) Done!

