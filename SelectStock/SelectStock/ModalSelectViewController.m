//
//  ModalSelectViewController.m
//  SelectStock
//
//  Created by liuxb on 15-1-11.
//  Copyright (c) 2015年 liuxb. All rights reserved.
//

#import "ModalSelectViewController.h"



@interface ModalSelectViewController ()

@property(nonatomic,assign) BOOL isFlag;

@end

@implementation ModalSelectViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    //设定搜索栏ScopeBar隐藏
    
    [self.searchBar sizeToFit];
    
    NSBundle *bundle = [NSBundle mainBundle];
	NSString *plistPath = [bundle pathForResource:@"team"
                                           ofType:@"plist"];
    
    self.listTeams = [[NSArray alloc] initWithContentsOfFile:plistPath];
//    NSLog(@"%@",self.listTeams);
    
    self.tblView.delegate = self;
    self.tblView.dataSource = self;
    
    
    //初次进入查询所有数据
    [self filterContentForSearchText:@""];
}


- (void)viewDidUnload
{
    [self setSearchBar:nil];
    [super viewDidUnload];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




#pragma mark Content Filtering
- (void)filterContentForSearchText:(NSString*)searchText ;
{
    
    if([searchText length]==0)
    {
        //查询所有
        self.isFlag = false;
        self.listFilterTeams = [NSMutableArray arrayWithArray:self.listTeams];
        return;
    }
    
    NSPredicate *scopePredicate;
    NSArray *tempArray ;
    NSLog(@"%d",self.listTeams.count);
    scopePredicate = [NSPredicate predicateWithFormat:@"SELF.image contains[c] %@",searchText];
    tempArray =[self.listTeams filteredArrayUsingPredicate:scopePredicate];
    self.listFilterTeams = [NSMutableArray arrayWithArray:tempArray];
    
//    NSLog(@"%@",self.listFilterTeams);
    NSLog(@"%d",self.listFilterTeams.count);
    self.isFlag = true;
    
            
            
   
}


#pragma mark --UITableViewDataSource 协议方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (!self.isFlag) {
        return 0;
    }else{
        return [self.listFilterTeams count];
    }
    
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (!self.isFlag) {
        static NSString *CellIdentifier = @"CellIdentifier";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        return cell;
        
    }else{
        static NSString *CellIdentifier = @"CellIdentifier";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        }
        
        
        NSUInteger row = [indexPath row];
        NSDictionary *rowDict = [self.listFilterTeams objectAtIndex:row];
        cell.textLabel.text =  [rowDict objectForKey:@"name"];
        cell.detailTextLabel.text = [rowDict objectForKey:@"image"];
        
        NSString *imagePath = [rowDict objectForKey:@"image"];
        imagePath = [imagePath stringByAppendingString:@".png"];
        cell.imageView.image = [UIImage imageNamed:imagePath];
        
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        return cell;
    
    }

}



#pragma mark --UISearchBarDelegate 协议方法
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    //查询所有
    
    [self filterContentForSearchText:@""];
    self.isFlag = false;
}


#pragma mark - UISearchDisplayController Delegate Methods
//当文本内容发生改变时候，向表视图数据源发出重新加载消息
- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    [self filterContentForSearchText:searchString ];
    self.isFlag = true;
    //YES情况下表视图可以重新加载
    return YES;
}

// 当Scope Bar选择发送变化时候，向表视图数据源发出重新加载消息
- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchScope:(NSInteger)searchOption
{
    [self filterContentForSearchText:self.searchBar.text ];
    self.isFlag = true;
    // YES情况下表视图可以重新加载
    return YES;
}


- (IBAction)canceBtn:(id)sender {
//    [self.navigationController popViewControllerAnimated:YES];
    [self dismissViewControllerAnimated:YES completion:^{
        NSLog(@"modal view done");
    }];
    
}
@end
