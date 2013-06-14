//
//  MusicMasterViewController.m
//  LocalMusic
//
//  Created by Elizabeth Chaddock on 4/3/13.
//  Copyright (c) 2013 Elizabeth Chaddock. All rights reserved.
//

#import "MusicMasterViewController.h"

#import "MusicDataController.h"
#import "LocalEvent.h"
#import "MusicDetailViewController.h"

@implementation MusicMasterViewController

- (void)awakeFromNib
{
    [super awakeFromNib];
    //self.dataController = [[MusicDataController alloc] init];
}

- (void)viewDidLoad
{
    
    [super viewDidLoad];

    NSString* URL = @"";
    if(self.artistName != NULL ){
        URL = [@"http://127.0.0.1:5000/search/" stringByAppendingString: self.artistName];
    }
    else if([self.genreList count] == 0){
        URL = @"http://127.0.0.1:5000/search/";
    }
    else { //term search
        NSString *genres = [self.genreList componentsJoinedByString:@","];
        URL = [@"http://127.0.0.1:5000/genre/" stringByAppendingString: genres];
    }
    self.dataController = [[MusicDataController alloc] initWithString: URL];
    [self.navigationController setNavigationBarHidden:NO];
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataController countOfList];
}

/*
 * Get an event at an index
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"LocalEventCell";
    
    static NSDateFormatter *formatter = nil;
    
    
    formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"MMM d, HH:mm"];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    LocalEvent *eventAtIndex = [self.dataController objectInListAtIndex:indexPath.row];
    
    [[cell textLabel] setText:eventAtIndex.bandName];
    
    NSDate *date = (NSDate *)eventAtIndex.date;
    NSString *string = [NSDateFormatter localizedStringFromDate: date dateStyle: NSDateFormatterShortStyle timeStyle: NSDateFormatterShortStyle];
    [[cell detailTextLabel] setText:string];

    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"ShowEventDetails"]) {
        MusicDetailViewController *detailViewController = [segue destinationViewController];
        
        detailViewController.event = [self.dataController objectInListAtIndex:[self.tableView indexPathForSelectedRow].row];
    }
}


@end
