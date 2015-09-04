//
//  ViewController.m
//  SelectStock
//
//  Created by liuxb on 15-1-11.
//  Copyright (c) 2015年 liuxb. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    UIViewController* page1ViewController = [mainStoryboard instantiateViewControllerWithIdentifier:@"page1"];
    self.page1 = page1ViewController.view;
    self.page1.frame = CGRectMake(0.0f, 0.0f, 320.0f, 420.0f);
    
    UIViewController* page2ViewController = [mainStoryboard instantiateViewControllerWithIdentifier:@"page2"];
    self.page2 = page2ViewController.view;
    self.page2.frame = CGRectMake(0.0f, 0.0f, 320.0f, 420.0f);
    
    
    
    
    
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    
    [self loadSelectedData];
    if ( 0 == [self.selectedListDatas count]) {
        
        self.navigationItem.leftBarButtonItem = nil;
        [self.view addSubview:self.page1];
        UIButton *btn = [[UIButton alloc] init];
        btn = (UIButton *)[self.page1 viewWithTag:1];
        //        NSLog(@"%@",[[btn titleLabel] text]);
        [btn addTarget:self action:@selector(addNewStock:) forControlEvents:UIControlEventTouchUpInside];
        
    }else{
        [self.view addSubview:self.page2];
        
        UITableView *tblView = (UITableView *)[self.page2 viewWithTag:100];
        
        UILabel *labl = (UILabel *)[self.page2 viewWithTag:2];
        NSLog(@"%@",labl.text);
        

        
//        UIStoryboard *mainStoryBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//        
//        UIViewController *marketVC = [mainStoryBoard instantiateViewControllerWithIdentifier:@"marketViewId"];
////        marketVC.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
//        //    [self presentViewController:modalSelectVC animated:YES completion:^{
//        //        NSLog(@"准备选择股票");
//        //    }];
//        
//        [self.navigationController pushViewController:marketVC animated:YES];
        
    }
    
    
    //    self.segmentControl = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObjects:@"添加",@"刷新", nil]];
    //
    //    [self.segmentControl addTarget:self action:@selector(segmentAction:) forControlEvents:UIControlEventValueChanged];
    //    
    

    
    
}



-(void)loadSelectedData{
    
    self.selectedListDatas = [NSMutableArray arrayWithCapacity:10];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addStock:(id)sender {
    
    UIStoryboard *mainStoryBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    UIViewController *modalSelectVC = [mainStoryBoard instantiateViewControllerWithIdentifier:@"modalSelectVC"];
    modalSelectVC.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
//    [self presentViewController:modalSelectVC animated:YES completion:^{
//        NSLog(@"准备选择股票");
//    }];
    
    [self.navigationController pushViewController:modalSelectVC animated:YES];
    
    
}




- (IBAction)editorSelectedStock:(id)sender {
    NSLog(@"%s,%d",__FUNCTION__,__LINE__);
    NSLog(@"编辑");
}

- (IBAction)addNewStock:(id)sender {
    NSLog(@"%s,%d",__FUNCTION__,__LINE__);
    NSLog(@"添加");
    UIStoryboard *mainStoryBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    UIViewController *modalSelectVC = [mainStoryBoard instantiateViewControllerWithIdentifier:@"modalSelectVC"];
    modalSelectVC.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    [self presentViewController:modalSelectVC animated:YES completion:^{
          NSLog(@"准备选择股票");
    }];
    
//    [self.navigationController pushViewController:modalSelectVC animated:YES];
}



//-(void)segmentAction:(id)sender{
//
//    if ( 0 == [sender selectedSegmentIndex]) {
//        NSLog(@"增加");
//    }else if( 1 == [sender selectedSegmentIndex]){
//        NSLog(@"刷新");
//    }
//}

@end
