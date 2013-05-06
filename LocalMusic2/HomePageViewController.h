//
//  HomePageViewController.h
//  RockThisTown
//
//  Created by Elizabeth Chaddock on 4/29/13.
//  Copyright (c) 2013 Elizabeth Chaddock. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomePageViewController : UIViewController <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *artistText;

@property (copy, nonatomic) NSString *artistName;

@end
