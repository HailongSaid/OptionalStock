//
//  NewsViewController.m
//  SelectStock
//
//  Created by liuxb on 15-1-13.
//  Copyright (c) 2015年 liuxb. All rights reserved.
//

#import "NewsViewController.h"
#import "NewsCell.h"
#import "NewContentViewControllViewController.h"

@interface NewsViewController ()

@end

@implementation NewsViewController

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
    [self loadJson];
    //
    self.infoNewTableView.dataSource = self;
    self.infoNewTableView.delegate = self;
}


-(void)loadJson{
   //
    //网络数据读取
    NSURL *url = [NSURL  URLWithString:@"http://www.swufe-online.com/user/stock.do?op=newsList&stock_code=600000"];
    
    NSMutableURLRequest *request=[[NSMutableURLRequest alloc]initWithURL:url];//通过URL创建网络请求
    [request setTimeoutInterval:30];//设置超时时间
    [request setHTTPMethod:@"GET"];//设置请求方式
    NSError *err;
    NSData *data=[NSURLConnection sendSynchronousRequest:request returningResponse:nil error:&err];
    
    
    //将获得到得数据进行编码（我们可以接受的）
    NSString *str=[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    
    
    //json解析
    NSError *error;
    id jsonObj = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
    if(error == nil){
//        if ([jsonObj isKindOfClass:[NSDictionary class]])     // treat as a dictionary, or reassign to a dictionary ivar
//            NSLog(@"NSDictionary-----------  %@",jsonObj);
//        else if ([jsonObj isKindOfClass:[NSArray class]])     // treat as an array or reassign to an array ivar.
//            NSLog(@"NSArray-----------  %@",jsonObj);
    }
    else
        NSLog(@"数据解析出现错误！");

    
    
    self.specialListDatas = [[NSMutableArray alloc] initWithCapacity:[jsonObj count]];
    self.specialListDatas = (NSMutableArray *)jsonObj;
    //    NSLog(@"%@",[self.specialListDatas objectAtIndex:0]);
     NSDictionary *rowDict = [self.specialListDatas objectAtIndex:1];
    
}


#pragma mark --UITableViewDataSource 协议方法

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    //    return [self.marketNameList count];
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return [self.specialListDatas count];
    
    
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    static NSString *CellIdentifier = @"CellIdentifier";
     NewsCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    //    if (cell == nil) {
    //        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    //    }
    
    
    NSUInteger row = [indexPath row];
    NSDictionary *rowDict = [self.specialListDatas objectAtIndex:row];
    
    
    cell.titleOfnew.text =  [rowDict objectForKey:@"title"];
    cell.contentOfnew.text = [rowDict objectForKey:@"content"];
    cell.dateOfnew.text = [rowDict objectForKey:@"created_date"];
    
    return cell;
}



-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if ([segue.identifier isEqualToString:@"newContent"]) {
        NewContentViewControllViewController *newContentVC = segue.destinationViewController;
        
        NSInteger selectedIndex = [[self.infoNewTableView indexPathForSelectedRow] row];
        NSDictionary *rowDict = [self.specialListDatas objectAtIndex:selectedIndex];
        newContentVC.dictnew  = rowDict;
        
        
    }
}






- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
