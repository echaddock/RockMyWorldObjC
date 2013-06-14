//
//  MusicMasterViewController.h
//  LocalMusic
//
//  Created by Elizabeth Chaddock on 4/3/13.
//  Copyright (c) 2013 Elizabeth Chaddock. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MusicDataController;

@interface MusicMasterViewController:UITableViewController 

@property (strong, nonatomic) MusicDataController *dataController;

@property (strong, nonatomic) NSString * artistName;

@property (strong, nonatomic) NSMutableArray * genreList;

@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *activityView;

@end