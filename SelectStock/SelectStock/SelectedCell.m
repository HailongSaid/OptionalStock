//
//  SelectedCell.m
//  SelectStock
//
//  Created by liuxb on 15-1-11.
//  Copyright (c) 2015年 liuxb. All rights reserved.
//

#import "SelectedCell.h"

@implementation SelectedCell



- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
