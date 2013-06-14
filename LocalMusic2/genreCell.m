//
//  genreCell.m
//  RockThisTown
//
//  Created by Elizabeth Chaddock on 5/16/13.
//  Copyright (c) 2013 Elizabeth Chaddock. All rights reserved.
//

#import "genreCell.h"

@implementation genreCell
@synthesize genreName;
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization
        genreName = [[UILabel alloc]initWithFrame:CGRectMake(102, 14, 85, 21)];
        genreName.font = [UIFont fontWithName:@"Verdana" size:12.0f];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
