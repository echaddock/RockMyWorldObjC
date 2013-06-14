//
//  HomePageViewController.m
//  RockThisTown
//
//  Created by Elizabeth Chaddock on 4/29/13.
//  Copyright (c) 2013 Elizabeth Chaddock. All rights reserved.
//

#import "HomePageViewController.h"
#import "MusicMasterViewController.h"

@interface HomePageViewController ()
@end

NSArray *genres;

@implementation HomePageViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization

    }
    return self;
}

- (void)viewWillLayoutSubviews //remove top bar when going back home
{
    [self.navigationController setNavigationBarHidden:YES];

}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:YES];
	// Do any additional setup after loading the view.
    self.view.backgroundColor = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"concertThin.png"]]; //set background image
    genres = [NSArray arrayWithObjects:@"pop",@"rock",@"soundtrack", @"country", @"lounge", @"opera", @"indie", @"house", @"synthpop", @"new wave", @"alternative", @"male vocalist", @"easy listening", @"ambient", @"electronica", @"psychedelic", @"electro", @"funk", @"folk", @"punk", @"blues", @"soul", @"70s", @"80s", @"90s", @"00s", @"reggae", @"motown", @"neo soul", @"classic rock", @"garage punk", @"singer-songwriter", @"americana", @"bluegrass", @"vocal pop", @"emo", @"emocore", @"experimental", @"metal", @"instrumental", @"dance", @"renaissance", @"female vocalists", @"jazz", @"r&b", @"swing", @"dubstep", @"worship music", nil];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (IBAction)findEventsAction:(id)sender forEvent:(UIEvent *)event {
//}

- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
    if (theTextField == self.artistText) {
        [theTextField resignFirstResponder];
    }
    return YES;
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    MusicMasterViewController *masterViewController = [segue destinationViewController];
    masterViewController.genreList = [[NSMutableArray alloc] init];

    if ([[segue identifier] isEqualToString:@"GetEvents"]) {
        //NSLog(self.artistText.text);
        masterViewController.artistName = self.artistText.text; //get text from text field
    }
    else {
        //make list of genres!
        NSArray * themesChosen = [_genreTable indexPathsForSelectedRows];
        NSMutableArray * list = [[NSMutableArray alloc] init];
        for (int i=0; i<[themesChosen count]; i++) {
            NSIndexPath *thisPath = [themesChosen objectAtIndex:i];
            NSString* name = genres[thisPath.row];
            NSLog(@"%@", name);
            [list addObject: name];
        }
        masterViewController.genreList = list;
        
    }
 /*
   masterViewController.activityView= [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [masterViewController.view addSubview:masterViewController.activityView];
    
    masterViewController.activityView.center = CGPointMake(masterViewController.view.frame.size.width / 2, masterViewController.view.frame.size.height / 2);
    [masterViewController.activityView startAnimating];
    
    [masterViewController performSelectorInBackground:@selector(loadData) withObject:nil waitUntilDone:];*/
    NSLog(@"PREPARE FOR SEGUE");

}

//STACK OVERFLOW CODE BELOW

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 48;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:CellIdentifier];

    }
    NSString *genreName = genres[indexPath.row]; //get genre name from array
    [[cell textLabel] setText:genreName];

    return cell;
}


@end
