//
//  SelectedCell.h
//  SelectStock
//
//  Created by liuxb on 15-1-11.
//  Copyright (c) 2015年 liuxb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SelectedCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *numberID;
@property (weak, nonatomic) IBOutlet UILabel *lastestPrice;

@property (weak, nonatomic) IBOutlet UILabel *priceChangeRatio;

@end
