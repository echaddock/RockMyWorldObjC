//
//  MusicDataController.m
//  LocalMusic
//
//  Created by Elizabeth Chaddock on 4/8/13.
//  Copyright (c) 2013 Elizabeth Chaddock. All rights reserved.
//
#define kBgQueue dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
//#define eventsPulled [NSURL URLWithString: @"http://api.seatgeek.com/2/events?geoip=true&per_page=300"]
//#define eventsURL [NSURL URLWithString: @"http://127.0.0.1:5000/search/"]
#import "MusicDataController.h"
#import "LocalEvent.h"

@interface MusicDataController ()
- (void) initializeDefaultDataList;
@end

@implementation MusicDataController

/*
 * Initialize backing mutable array of events
 */
- (void) initializeDefaultDataList {
    NSMutableArray *eventList = [[NSMutableArray alloc] init];
    self.masterEventList = eventList;
    NSString* webURL =  [self.eventsURL stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL* realURL = [NSURL URLWithString: webURL];
    NSData* data = [NSData dataWithContentsOfURL: realURL]; //CHANGE THIS
    [self fetchedData:data];
}

- (void)fetchedData:(NSData *)responseData {

    NSError* error;
    NSDictionary* latestEvents = [NSJSONSerialization JSONObjectWithData:responseData
                                                     options:kNilOptions
                                                       error:&error];
    //NSArray* latestEvents = [json objectForKey:@"events"];
    //date location name url
    for(NSDictionary* event in latestEvents)
    {
        //set the artist's name
        NSString* name = [event objectForKey:@"name"];

        //set the venue
        NSDictionary* venue = (NSDictionary*)[event objectForKey:@"location"];
        NSString* venueName = [venue objectForKey:@"name"];
        venueName = [venueName stringByAppendingString:@"\n"];
        venueName = [venueName stringByAppendingString:[venue objectForKey:@"display_location"]];
        
        //Set the date
        NSString* d = [event objectForKey:@"date"];

        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss"];
            
        NSDate* date = [dateFormatter dateFromString:d];
        
        NSString* link = [event objectForKey:@"url"];
        
        LocalEvent* newEvent;
        newEvent = [[LocalEvent alloc] initWithName:name location:venueName date:date url:link];
        [self addLocalEventWithEvent:newEvent];
    }
    
    //Add events to UI based on ordering returned by sorting by score
}

/*
 * Reset the list
 */
- (void) setMasterEventList:(NSMutableArray *)newList
{
    if(_masterEventList != newList) {
        _masterEventList = [newList mutableCopy];
    }
}

-(id)initWithString: (NSString*)String {
    if(self = [super init]){
        self.eventsURL = String;
        [self initializeDefaultDataList];
        return self;
    }
    return nil;
}

-(id)init {
    return [self initWithString:@"http://127.0.0.1:5000/search/"];
}


/*
 * Get the number of events in the array
 */
- (NSUInteger)countOfList {
    return [self.masterEventList count];
}

- (LocalEvent *)objectInListAtIndex:(NSUInteger)theIndex {
    return [self.masterEventList objectAtIndex:theIndex];
}

/*
 * Add a local event to the array
 */
- (void)addLocalEventWithEvent:(LocalEvent *)event {
    [self.masterEventList addObject:event];
}

@end