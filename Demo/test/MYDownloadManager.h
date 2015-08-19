//
//  MYDownloadManager.h
//  mtNew
//
//  Created by zhuqinjian on 15/3/29.
//  Copyright (c) 2015年 MYun. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^MYSuccessBlock) (NSDictionary * returnDict);
typedef void(^MYFailBlock) (NSError *returnerror);

@interface MYDownloadManager : NSObject

/**
 *  单例方法
 *
 *  @return 返回数据下载类单例对象
 */
+ (id)shareManager;

@property(strong, nonatomic) NSMutableString *elementString;
/**
 *  请求成功代码块
 */
@property(nonatomic,copy) MYSuccessBlock mysuccessBlock;
/**
 *  请求失败代码块
 */
@property(nonatomic,copy) MYFailBlock myfailBlock;

/**
 *  数据下载请求POST方法
 *
 *  @param urlStr     下载地址
 *  @param parma      请求参数
 *  @param finishedCB 成功后执行代码块
 *  @param failedCB   失败后执行代码块
 *  @param resDict    请求成功后回传出的数据字典,内部字段为@{@"Data":{EName,IsAudit,StoreId,SysNo,UserName},
                                                       @"ErrorDescription":@"错误描述",
                                                       @"IsSuccess":@"请求结果1/0"}
 */
- (void)POST:(NSString *)urlStr parma:(NSDictionary *)parma finished:(void(^)(NSDictionary *resDict))finishedCB failed:(void(^)(NSError *error))failedCB;

- (void)GET:(NSString *)urlStr parma:(NSDictionary *)parma finished:(void(^)(NSDictionary *resDict))finishedCB failed:(void(^)(NSError *error))failedCB;

/**
 wcf请求接口
 
 @param name         name
 @param url          url
 @param nameSpace    nameSpace
 @param action       action
 @param allKeys      排序完的key，如果不需要，就传nil
 @param parameters   所有参数
 @param successBlock 成功回调
 @param failBlock    失败回调
 */
- (void)requestWithName:(NSString *)name url:(NSString *)url nameSpace:(NSString *)nameSpace action:(NSString *)action allKeys:(NSArray *)allKeys parameters:(NSDictionary *)parameters successBlock:(MYSuccessBlock)successBlock failBlock:(MYFailBlock)failBlock;

@end
