//
//  NewsCell.h
//  SelectStock
//
//  Created by liuxb on 15-1-14.
//  Copyright (c) 2015年 liuxb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleOfnew;
@property (weak, nonatomic) IBOutlet UILabel *contentOfnew;
@property (weak, nonatomic) IBOutlet UILabel *dateOfnew;

@end
