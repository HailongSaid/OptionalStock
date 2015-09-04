//
//  StockList.h
//  SelectStock
//
//  Created by liu on 15/1/14.
//  Copyright (c) 2015年 liuxb. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StockList : NSObject
@property(nonatomic,retain) NSString *title;
@property(nonatomic,retain) NSMutableArray *stockList;
@property bool visible;
@end
