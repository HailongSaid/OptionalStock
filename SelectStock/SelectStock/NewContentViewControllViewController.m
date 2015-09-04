//
//  NewContentViewControllViewController.m
//  SelectStock
//
//  Created by liuxb on 15-1-14.
//  Copyright (c) 2015年 liuxb. All rights reserved.
//

#import "NewContentViewControllViewController.h"

@interface NewContentViewControllViewController ()

@end

@implementation NewContentViewControllViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
//    
//    self.titleView.textColor= [UIColor blackColor];//设置textview里面的字体颜色
//    self.titleView.font  = [UIFont fontWithName:@"Arial"size:14.0];//设置字体名字和字体大小
//    self.titleView.delegate  = self;//设置它的委托方法
//   // self.titleView.backgroundColor  = [UIColor grayColor];//设置它的背景颜色
//    self.titleView.text  = [NSString stringWithFormat:@"%@ ",[self.dictnew objectForKey:@"title" ]];  //设置它显示的内容
//    
//    
//    self.titleView.scrollEnabled= NO;//是否可以拖动
//    self.titleView.editable=NO;//禁止编辑
//    self.titleView.autoresizingMask= UIViewAutoresizingFlexibleHeight;//自适应高度
//    
//    
//    self.textView.textColor= [UIColor blackColor];//设置textview里面的字体颜色
//    self.textView.font  = [UIFont fontWithName:@"Arial"size:24.0];//设置字体名字和字体大小
//    self.textView.delegate  = self;//设置它的委托方法
//    //self.textView.backgroundColor  = [UIColor grayColor];//设置它的背景颜色
//    
//    self.textView.text  = [NSString stringWithFormat:@"    %@ ",[self.dictnew objectForKey:@"content"]];  //设置它显示的内容
//    self.textView.scrollEnabled= NO;//是否可以拖动
//    self.textView.editable=NO;//禁止编辑
//    self.textView.autoresizingMask= UIViewAutoresizingFlexibleHeight;//自适应高度
    
    self.titleLabel.text = [self.dictnew objectForKey:@"title" ];
    self.titleLabel.numberOfLines = 0;
    self.titleLabel.lineBreakMode = UILineBreakModeWordWrap;
    
    self.dateLabel.text = [self.dictnew objectForKey:@"created_date"];
    
    self.contentLabel.text = [self.dictnew objectForKey:@"content"];
    self.contentLabel.numberOfLines = 0;
    self.contentLabel.lineBreakMode = UILineBreakModeWordWrap;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
