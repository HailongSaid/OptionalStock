//
//  StockList.m
//  SelectStock
//
//  Created by liu on 15/1/14.
//  Copyright (c) 2015年 liuxb. All rights reserved.
//

#import "StockList.h"

@implementation StockList
-(NSMutableArray *) stockList{
    if (_stockList == nil) {
        _stockList = [NSMutableArray array];
    }
    return _stockList;
}
@end
