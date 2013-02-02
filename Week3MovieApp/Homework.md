Steps for Week 3:

1) Download Week 3 App and Open
2) Go to Page: MasterDetailMasterViewController.h and add the 2 lines under comment:

    //Add 2 Arrays: listOfMovies, MovieDetails

    NSMutableArray *listOfMovies;
    NSMutableArray *MovieDetails;
    
3) Go to Page: MasterDetailMasterViewController.m  >  - (void)viewDidLoad
   and initilize 2 arrays.
   
    //—-initialize listOfMovies array—-
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
    
4) Go to Function: - (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
   add below code comments
   
   return [listOfMovies count];
   
5) Go to Function: - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
   add below code comments
   
   cell.textLabel.text = [listOfMovies objectAtIndex:indexPath.row];
   
6) Add UIWebView to iPad and iPhone.Make sure and check "Scale Page to fit" 

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
    



