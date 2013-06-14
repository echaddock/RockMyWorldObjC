//
//  MusicDetailViewController.m
//  LocalMusic
//
//  Created by Elizabeth Chaddock on 4/8/13.
//  Copyright (c) 2013 Elizabeth Chaddock. All rights reserved.
//

#import "MusicDetailViewController.h"
#import "LocalEvent.h"
@interface MusicDetailViewController ()
- (void)configureView;
@end

@implementation MusicDetailViewController

#pragma mark - Managing the detail item

- (void)setEvent:(LocalEvent *) newEvent
{
    if(_event != newEvent) {
        _event = newEvent;
        
        //Update the view
        [self configureView];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.
    LocalEvent *theEvent = self.event;
    
    static NSDateFormatter *formatter = nil;
    if (formatter == nil) {
        formatter = [[NSDateFormatter alloc] init];
        [formatter setDateStyle:NSDateFormatterMediumStyle];
    }
    if (theEvent) {
        self.bandNameLabel.text = theEvent.bandName;
        self.locationLabel.text = theEvent.location;
        
        static NSDateFormatter *formatter = nil;
        
        formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"MMM d, HH:mm"];        
        NSDate *date = (NSDate *)theEvent.date;
        NSString *string = [NSDateFormatter localizedStringFromDate: date dateStyle: NSDateFormatterMediumStyle timeStyle: NSDateFormatterShortStyle];
        
        self.dateLabel.text = string;
    }
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self configureView];
}


- (IBAction)linkToTickets:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:self.event.url]];
}
@end
