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

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)findEventsAction:(id)sender forEvent:(UIEvent *)event {
}

- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
    if (theTextField == self.artistText) {
        [theTextField resignFirstResponder];
    }
    return YES;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"GetEvents"]) {
        MusicMasterViewController *masterViewController = [segue destinationViewController];
        //NSLog(self.artistText.text);
        masterViewController.artistName = self.artistText.text; //get text from text field
    }
}
@end
