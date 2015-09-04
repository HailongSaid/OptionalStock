//
//  NewsViewController.h
//  SelectStock
//
//  Created by liuxb on 15-1-13.
//  Copyright (c) 2015年 liuxb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *infoNewTableView;

@property (nonatomic,retain) NSMutableDictionary *marketDictDatas;
@property (nonatomic,retain) NSMutableArray *specialListDatas;
@property (nonatomic,retain) NSArray *marketNameList;


-(void) loadJson;

@end
