//
//  NewContentViewControllViewController.h
//  SelectStock
//
//  Created by liuxb on 15-1-14.
//  Copyright (c) 2015年 liuxb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewContentViewControllViewController : UIViewController<UITextViewDelegate>
//@property (weak, nonatomic) IBOutlet UITextView *textView;
//@property (weak, nonatomic) IBOutlet UITextView *titleView;
@property (nonatomic,retain) NSString *titleOfnew;
@property (nonatomic,retain) NSString *contentOfnew;
@property (nonatomic,retain) NSString *dateOfnew;
@property (nonatomic,retain) NSDictionary *dictnew;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;

@end
