//
//  ViewController.m
//  SelectStockAdmin
//
//  Created by pro^w^ on 15/1/16.
//  Copyright (c) 2015年 pro^w^. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *stockCodeTF;
@property (weak, nonatomic) IBOutlet UITextField *stockNameTF;
@property (weak, nonatomic) IBOutlet UITextField *stockPriceTF;
@property (weak, nonatomic) IBOutlet UITextField *stockFloatingPriceTF;
- (IBAction)submitButtonClicked:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)submitButtonClicked:(id)sender {
    
    
    
    //第一步，创建URL
    //  NSString *str = @"http://www.swufe-online.com/user/stock.do?op=addStock&stock_code=xxx&stock_name=xxx&price=12&floating_price=-11";
    NSString *str = @"http://www.swufe-online.com/user/stock.do?op=addStock";
    str = [str stringByAppendingString:@"&stock_code="];
    str = [str stringByAppendingString:self.stockCodeTF.text];
    str = [str stringByAppendingString:@"&stock_name="];
    str = [str stringByAppendingString:self.stockNameTF.text];
    str = [str stringByAppendingString:@"&price="];
    str = [str stringByAppendingString:self.stockPriceTF.text];
    str = [str stringByAppendingString:@"&floating_price="];
    str = [str stringByAppendingString:self.stockFloatingPriceTF.text];
    str = [str stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
//    NSData *str2 = [str dataUsingEncoding:NSUTF8StringEncoding];
    NSLog(@"请求url : 	%@",str);
    
    NSURL *url = [NSURL URLWithString:str];

    
    	
    //第二步，通过URL创建网络请求
    
    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
    
    //NSURLRequest初始化方法第一个参数：请求访问路径，第二个参数：缓存协议，第三个参数：网络请求超时时间（秒）
    
    /*
    其中缓存协议是个枚举类型包含：
    
    NSURLRequestUseProtocolCachePolicy（基础策略）	
    
    NSURLRequestReloadIgnoringLocalCacheData（忽略本地缓存）
    
    NSURLRequestReturnCacheDataElseLoad（首先使用缓存，如果没有本地缓存，才从原地址下载）
    
    NSURLRequestReturnCacheDataDontLoad（使用本地缓存，从不下载，如果本地没有缓存，则请求失败，此策略多用于离线操作）
    
    NSURLRequestReloadIgnoringLocalAndRemoteCacheData（无视任何缓存策略，无论是本地的还是远程的，总是从原地址重新下载）
    
    NSURLRequestReloadRevalidatingCacheData（如果本地缓存是有效的则不下载，其他任何情况都从原地址重新下载）
     */
    
    //第三步，连接服务器
    
    NSData *received = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    
    
    
//    NSString *res = [[NSString alloc]initWithData:received encoding:NSUTF8StringEncoding];
//    NSLog(@"%@",res);
    
    
    NSError *error;
    id jsonObj = [NSJSONSerialization JSONObjectWithData:received options:NSJSONReadingMutableContainers error:&error];
    NSDictionary *firstRowDict = (NSDictionary *)jsonObj;
    
//    NSString *res = (NSString*)[firstRowDict objectForKey:@"suc"];
//    Boolean res = (Boolean)[firstRowDict objectForKey:@"suc"];
    NSString *temp = [firstRowDict objectForKey:@"err"];
    
    NSLog(@"%@",temp);
    if([temp length] == 0){
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"恭喜！" message:@"数据更新成功！！！" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
        [alertView show];
    }
    else{
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"错误！" message:temp delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
        [alertView show];
    }


    
//    NSLog(@"%@",res1);
//    NSString *re = [res1 objectForKey:@"suc"];
//    if ([re isEqualToString:@"false"]) {
//        NSLog(@"11111111");
//    }
    
    
    
}
@end
