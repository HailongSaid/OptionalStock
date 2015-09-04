//
//  MarketViewController.m
//  SelectStock
//
//  Created by liuxb on 15-1-13.
//  Copyright (c) 2015年 liuxb. All rights reserved.
//

#import "MarketViewController.h"
#import "MarketCell.h"
//#import "NotesNextiveJsonParser.h"
@interface MarketViewController ()

@property(nonatomic,assign) BOOL isFlag;

@end

@implementation MarketViewController

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
    self.marketTableView.dataSource = self;
    self.marketTableView.delegate = self;
    
}

-(void)addObject:(NSDictionary *) object WithArray:(NSMutableArray *)mut isAscending:(Boolean) isAscending{
    float value =[[object objectForKey:@"floating_percent"] floatValue];
    int i = 0;
    if(isAscending){
        for(;i < mut.count;i++){
            NSDictionary *temp = [mut objectAtIndex:i];
            if([[temp objectForKey:@"floating_percent"] floatValue] > value)
                break;
        }
    }
    else{
        for(;i < mut.count;i++){
            NSDictionary *temp = [mut objectAtIndex:i];
            if([[temp objectForKey:@"floating_percent"] floatValue] < value)
                break;
        }
    }
    [mut insertObject:object atIndex:i];
}

-(void)loadJson{
    
//    //本地数据读取
//    NSString *path = [[NSBundle mainBundle] pathForResource:@"marketData" ofType:@"json"];
//    NSData *jsonData = [[NSData alloc] initWithContentsOfFile:path];
//    NSError *error;
//    
//    id jsonObj = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
//    
//    if (!jsonObj || error) {
//        NSLog(@"Json解码失败！");
//        return;
//    }
//    
    
    
    //网络数据读取
    NSURL *url = [NSURL  URLWithString:@"http://www.swufe-online.com/user/stock.do?op=stockList"];
    
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
    
    
    
    
    self.specialListDatas = [[NSMutableArray alloc] initWithCapacity:2];
    StockList *group1 = [[StockList alloc] init];
    group1.title = @"涨幅榜";
    group1.visible = true;
    
    StockList *group2 = [[StockList alloc] init];
    group2.title = @"跌幅榜";
    group2.visible = true;
    
    
    
    for(int i = 0;i < [jsonObj count];i++){
        NSDictionary *rowDict = [jsonObj objectAtIndex:i];
        if ([[rowDict objectForKey:@"floating_percent"] floatValue] > 0){
            [self addObject:rowDict WithArray:group1.stockList isAscending:NO];
            //            [group1.stockList addObject:rowDict];
        }
        
        else{
            [self addObject:rowDict WithArray:group2.stockList isAscending:YES];
            //            [group2.stockList addObject:rowDict];
        }
        
    }
    
    
    [self.specialListDatas addObject:group1];
    [self.specialListDatas addObject:group2];
    
    
    //    [self.marketTableView reloadData];
    UITableView * tV = (UITableView *)[self.view viewWithTag:1];
    [tV reloadData];
}


#pragma mark --UITableViewDataSource 协议方法

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.specialListDatas.count;
}


//重写标题view并加上一按钮在上面，这样就可直接对按钮来操作，来触发点击事件，而且知道是那个区触发的
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView * mySectionView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 60)];
    UIButton * myButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    myButton.tag = section;
    myButton.frame = CGRectMake(16, -10, 320, 40);
    myButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [myButton setTitle:[[self.specialListDatas objectAtIndex:section] title] forState:UIControlStateNormal];
    [myButton addTarget:self action:@selector(expandButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [mySectionView addSubview:myButton];
    return mySectionView;
}

//按钮被点击时触发
-(void)expandButtonClicked:(id)sender{
    UIButton* btn= (UIButton*)sender;
    //取得tag知道点击对应哪个块
    int section = (int)btn.tag;
    StockList *temp = (StockList *)[self.specialListDatas objectAtIndex:section];
    temp.visible = !temp.visible;
    
    //刷新tableview
    //通过tag来获得TableView
    UITableView * tV = (UITableView *)[self.view viewWithTag:1];
    [tV reloadData];
}

//必须实现两个方法  每个区域多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    StockList *temp = (StockList *)[self.specialListDatas objectAtIndex:section];
    if(temp.visible)
        return [[[self.specialListDatas objectAtIndex:section ] stockList] count];
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    static NSString *CellIdentifier = @"CellIdentifier";
    MarketCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[MarketCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    
    NSDictionary *rowDict = [[[self.specialListDatas objectAtIndex:indexPath.section] stockList] objectAtIndex:indexPath.row];
    
    
    
    cell.name.text =  [rowDict objectForKey:@"stock_name"];
    cell.numberID.text = [rowDict objectForKey:@"stock_code"];
    cell.lastestPrice.text = [NSString stringWithFormat:@"%@",[rowDict objectForKey:@"price"]];
    cell.priceChangeRatio.text = [rowDict objectForKey:@"floating_percent"];
    
    
    return cell;
    
    
    
}





- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
