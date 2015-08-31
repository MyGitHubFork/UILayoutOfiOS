//
//  ViewController.m
//  test
//
//  Created by yifan on 15/8/18.
//  Copyright (c) 2015年 黄成都. All rights reserved.
//

#import "ViewController.h"
#import "MYDownloadManager.h"
#import "MAYMiaoshaEntity.h"
#import "MJExtension.h"
#import "MAYMiaoshaCell.h"
#import "UITableView+FDTemplateLayoutCell.h"
static NSString *cellid = @"dsfasdfasdfadsf";
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,copy)NSArray *miaoshaList;
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic, assign) BOOL cellHeightCacheEnabled;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.frame];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView registerClass:[MAYMiaoshaCell class] forCellReuseIdentifier:cellid];
    //初步预测cell高度
    self.tableView.estimatedRowHeight = 165;
    //是否开启调试模式
    self.tableView.fd_debugLogEnabled = YES;
    //是否允许缓存
    self.cellHeightCacheEnabled = NO;
    [self.view addSubview:self.tableView];
    [self requestMiaoshaProduct];
}
#pragma mark 请求网络数据
-(void)requestMiaoshaProduct{
    NSDictionary *dictory = @{
                              @"customerSysNo":@"17043",
                              @"categorySysNo":@"-1"
                              };
    NSMutableArray *miaoshaArray = [NSMutableArray array];
    [[MYDownloadManager shareManager] requestWithName:@"GetAllSecKill" url:@"/PC_API/MKTService.svc?wsdl" nameSpace:@"http://tempuri.org/" action:@"http://tempuri.org/IMKTService/GetAllSecKill" allKeys:@[@"customerSysNo",@"categorySysNo"] parameters:dictory successBlock:^(NSDictionary *returnDict) {
        
        NSData *returndata = [returnDict[@"ResultStr"] dataUsingEncoding:NSUTF8StringEncoding];
        NSArray *jsonarray = [NSJSONSerialization JSONObjectWithData:returndata options:NSJSONReadingAllowFragments error:nil];
        [jsonarray enumerateObjectsUsingBlock:^(NSDictionary *obj, NSUInteger idx, BOOL *stop) {
            MAYMiaoshaEntity *entity = [MAYMiaoshaEntity objectWithKeyValues:obj];
            [miaoshaArray addObject:entity];
        }];
        self.miaoshaList = [NSArray arrayWithArray:miaoshaArray];
        [self.tableView reloadData];
    } failBlock:^(NSError *returnerror) {
        NSLog(@"dfasfas");
        //[ProgressHUD showError:@"请求秒杀商品失败"];
    }];
    
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.miaoshaList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MAYMiaoshaCell *cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    [self configureCell:cell atIndexPath:indexPath];
    return cell;
}

- (void)configureCell:(MAYMiaoshaCell *)cell atIndexPath:(NSIndexPath *)indexPath
{
    //cell.fd_enforceFrameLayout = NO; // Enable to use "-sizeThatFits:"
    cell.entity = self.miaoshaList[indexPath.row];
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.cellHeightCacheEnabled) {
        return [self.tableView fd_heightForCellWithIdentifier:cellid cacheByIndexPath:indexPath configuration:^(MAYMiaoshaCell *cell) {
            [self configureCell:cell atIndexPath:indexPath];
        }];
    } else
    {
        return [self.tableView fd_heightForCellWithIdentifier:cellid configuration:^(MAYMiaoshaCell *cell) {
            [self configureCell:cell atIndexPath:indexPath];
        }];
    }
}
@end
