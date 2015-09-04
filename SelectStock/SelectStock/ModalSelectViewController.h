//
//  ModalSelectViewController.h
//  SelectStock
//
//  Created by liuxb on 15-1-11.
//  Copyright (c) 2015年 liuxb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ModalSelectViewController : UIViewController<UISearchBarDelegate,UISearchDisplayDelegate,UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,retain) NSArray *listDatas;
@property (nonatomic,retain) NSDictionary *dictDatas;
@property (weak, nonatomic) IBOutlet UITableView *tblView;

- (IBAction)canceBtn:(id)sender;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

@property (nonatomic, strong) NSArray *listTeams;
@property (nonatomic, strong) NSMutableArray *listFilterTeams;
- (void)filterContentForSearchText:(NSString*)searchText ;

@end
