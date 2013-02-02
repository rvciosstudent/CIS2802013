Steps for Week 3:

1) Download Week 3 App and Open

2) Go to Page: MasterDetailMasterViewController.h and add the 2 lines under comment //Declare Arrays


    @interface DenzelIMDBMasterViewController : UITableViewController
    {
        //Declare Arrays
        NSMutableArray *listOfMovies;
        NSMutableArray *MovieDetails;
    }
    
3) Go to Page: MasterDetailMasterViewController.m
4) Go to function: - (void)viewDidLoad
   and initilize 2 arrays, comment out lines, add code for iPad
   
    // Add Code to Initialize Arrays
     //—-initialize  listOfMovies array—-
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
    
    //—-initialize  MovieDetails array—-
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
    
    //Comment out leftbarbutton logic since data is static
    
    //self.navigationItem.leftBarButtonItem = self.editButtonItem;
    // UIBarButtonItem *addButton = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self //action:@selector(insertNewObject:)] autorelease];
    //self.navigationItem.rightBarButtonItem = addButton;
    
    //Add Below code for iPad 
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        [self.tableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:NO scrollPosition:UITableViewScrollPositionMiddle];
        //---
        self.detailViewController =
        (DenzelIMDBDetailViewController *) [[self.splitViewController.viewControllers lastObject] topViewController];
        //---
    
    }

    
4) Go to Function: - (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
   
    - (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
    {
        //Comment out return _objects.count;
        //return _objects.count;
        
        //add return for array listofmovies
        return [listOfMovies count];
    }
   
5) Go to Function: - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
   add below code and comments
   
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
        cell.textLabel.text = [listOfMovies objectAtIndex:indexPath.row];
        
        return cell;
    }
   
6) Add UIWebView to iPad and iPhone.Make sure and check "Scale Page to fit" 

7) Connect both UIWebViews to File Owner and select WebView

   - CTRL+CLICK+DRAG UIWebView to DenzelIMDBDetailViewController.h
   - See http://screencast.com/t/t5MGiLOD

        #import <UIKit/UIKit.h>
        
        @interface DenzelIMDBDetailViewController : UIViewController <UISplitViewControllerDelegate>
        
        @property (strong, nonatomic) id detailItem;
        
        @property (strong, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
        
        @property (retain, nonatomic) IBOutlet UIWebView *WebSite;
        
        @end

7) Go to page: MasterDetailDetailViewController.h
   add code below comments
   
   @property (retain, nonatomic) IBOutlet UIWebView *WebSite;
   
8) Go to page: MasterDetailDetailViewController.m
    add code below comments
    
    @synthesize WebSite = _WebSite; //towards top of page

9) Connect both UIWebViews to File Owner and select WebView
   
10) Go to Function: - (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
   add below code commments
   
      
        //closes Menu
        self.detailViewController.detailItem =
        [NSString stringWithFormat:@"loadingmovie"];
        //loads url into webview on iPhone
        NSURL *url = [NSURL URLWithString:[MovieDetails objectAtIndex:indexPath.row]];
        NSURLRequest *req = [NSURLRequest requestWithURL:url];
        [self.detailViewController.WebSite loadRequest:req];
        
        //closes Menu
        self.detailViewController.detailItem =
        [NSString stringWithFormat:@"loadingmovie"];
        //loads url into webview on iPad
        NSURL *url = [NSURL URLWithString:[MovieDetails objectAtIndex:indexPath.row]];
        NSURLRequest *req = [NSURLRequest requestWithURL:url];
        [self.detailViewController.WebSite loadRequest:req];
        
11) Add Icon

    - OPen Page: Supporting Files/IMDB Denzel-Info.plist
    - Edit Page by clicking the + symbol twice next to add 2 new images.
      (Images for icons need to be 72x72 iPad, 57x57 iPhone)
    - type in the name of the photos located in the supporting file
    
13 Test APP!
    



