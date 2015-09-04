//
//  SelectedStockViewController.h
//  SelectStock
//
//  Created by liuxb on 15-1-11.
//  Copyright (c) 2015年 liuxb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SelectedStockViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITableView *marketTableView;


@property (nonatomic,retain) NSMutableDictionary *marketDictDatas;
@property (nonatomic,retain) NSMutableArray *specialListDatas;
@property (nonatomic,retain) NSArray *marketNameList;


-(void) loadJson;

@end
