//
//  MarketViewController.h
//  SelectStock
//
//  Created by liuxb on 15-1-13.
//  Copyright (c) 2015年 liuxb. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StockList.h"

@interface MarketViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *marketTableView;


@property (nonatomic,retain) NSMutableDictionary *marketDictDatas;
@property (nonatomic,retain) NSMutableArray *specialListDatas;
@property (nonatomic,retain) NSArray *marketNameList;

-(void)addObject:(NSDictionary *) object WithArray:(NSMutableArray *)mut isAscending:(Boolean) isAscending;
-(void) loadJson;

@end
