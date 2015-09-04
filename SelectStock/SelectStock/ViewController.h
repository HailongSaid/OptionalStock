//
//  ViewController.h
//  SelectStock
//
//  Created by liuxb on 15-1-11.
//  Copyright (c) 2015年 liuxb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
- (IBAction)editorSelectedStock:(id)sender;

- (IBAction)addNewStock:(id)sender;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *editorBtn;


@property (nonatomic,retain) NSMutableArray *selectedListDatas;

@property (strong, nonatomic) UIView *page1;
@property (strong, nonatomic) UIView *page2;

-(void) loadSelectedData;

@end
