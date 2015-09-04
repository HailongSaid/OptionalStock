//
//  MeInfoViewController.m
//  SelectStock
//
//  Created by liuxb on 15-1-13.
//  Copyright (c) 2015年 liuxb. All rights reserved.
//

#import "MeInfoViewController.h"

@interface MeInfoViewController ()

@end

@implementation MeInfoViewController

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
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




#pragma mark --UITableViewDataSource 协议方法

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
//    
//    //    return [self.marketNameList count];
//    return 4;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//    
//    if (0 == section) {
//        return 1;
//    }else if (1 == section){
//        return 2;
//    }else if (2 == section){
//    
//        return 1;
//    }else{
//        return 1;
//    }
//    
//    
//    
//}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    static NSString *CellIdentifier = @"CellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
          cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    
    NSUInteger section = [indexPath section];
    NSUInteger row = [indexPath row];
    
    if ( 0 == section && 0 == row ) {
        cell.imageView.image = [UIImage imageNamed:@"tab_faq.png"];
        cell.textLabel.text = @"股票圈";
    }else if( 1 == section && 0 == row  ){
        cell.imageView.image = [UIImage imageNamed:@"tab_news.png"];
        cell.textLabel.text =  @"A股大赛";
    }else if( 1 == section && 1 == row  ){
        cell.imageView.image = [UIImage imageNamed:@"tab_home.png"];
        cell.textLabel.text =  @"活动精选";
    }else if( 2 == section && 0 == row  ){
        cell.imageView.image = [UIImage imageNamed:@"tab_info.png"];
        cell.textLabel.text =  @"我的交易";
        
    }else if( 3 == section && 0 == row  ){
        cell.imageView.image = [UIImage imageNamed:@"tab_more.png"];
        cell.textLabel.text =  @"系统设置";
        
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

    return cell;
    
}





@end
