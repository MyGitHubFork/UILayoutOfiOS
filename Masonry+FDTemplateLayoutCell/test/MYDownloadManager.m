 //
//  MYDownloadManager.m
//  mtNew
//
//  Created by zhuqinjian on 15/3/29.
//  Copyright (c) 2015年 MYun. All rights reserved.
//

#import "MYDownloadManager.h"
#import "AFNetworking.h"
//#import "JSONKit.h"
#define __kWebServiceUrl @"http://202.107.236.118:7008"
@interface MYDownloadManager()<NSXMLParserDelegate>

@end

@implementation MYDownloadManager {
    dispatch_queue_t _queue;
    dispatch_semaphore_t _semaphore;
}

+ (id)shareManager
{
    static MYDownloadManager *_m = nil;
    
    static dispatch_once_t pre;
    
    dispatch_once(&pre, ^{
        _m = [[MYDownloadManager alloc]init];
    });

    return _m;
}

- (instancetype)init
{
    if (self = [super init]) {
        self.elementString = [[NSMutableString alloc]init];
    }
    return self;
}

#pragma mark -post请求数据
- (void)POST:(NSString *)urlStr parma:(NSDictionary *)parma finished:(void(^)(NSDictionary *resDict))finishedCB failed:(void(^)(NSError *error))failedCB {
    //初始化afn对象
    AFHTTPRequestOperationManager *afn = [AFHTTPRequestOperationManager manager];
    
    //设置afn请求器(新版AFN不可设置)
    //afn.requestSerializer = [AFJSONRequestSerializer serializer];
    
    //设置afn解析器
    afn.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    //调用afn对象的post方法
    [afn POST:urlStr parameters:parma success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        //解析请求数据
        NSDictionary *resDict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        
        //成功后回传
        finishedCB(resDict);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        //失败后执行
        failedCB(error);
        
    }];
    
}



#pragma mark -get请求数据
- (void)GET:(NSString *)urlStr parma:(NSDictionary *)parma finished:(void (^)(NSDictionary *))finishedCB failed:(void (^)(NSError *))failedCB {
    
    //初始化afn对象
    AFHTTPRequestOperationManager *afn = [AFHTTPRequestOperationManager manager];
    
    //设置afn请求器(新版AFN不可设置)
    //afn.requestSerializer = [AFJSONRequestSerializer serializer];
    
    //设置afn解析器
    afn.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    //调用afn对象的post方法
    [afn GET:urlStr parameters:parma success:^(AFHTTPRequestOperation *operation, id responseObject) {
       // NSLog(@"%@",[[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding]);
        //解析请求数据
        NSDictionary *resDict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        
        //成功后回传
        finishedCB(resDict);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        //失败后执行
        failedCB(error);
        
    }];
}

- (void)requestWithName:(NSString *)name url:(NSString *)url nameSpace:(NSString *)nameSpace action:(NSString *)action allKeys:(NSArray *)allKeys parameters:(NSDictionary *)parameters successBlock:(MYSuccessBlock)successBlock failBlock:(MYFailBlock)failBlock {
    if (_queue == nil) {
        _queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    }
    if (_semaphore == nil) {
        _semaphore = dispatch_semaphore_create(1);
    }
    dispatch_async(_queue, ^{
        dispatch_semaphore_wait(_semaphore, DISPATCH_TIME_FOREVER);
        
        //给代码块赋值
        self.mysuccessBlock = successBlock;
        self.myfailBlock = failBlock;
        NSMutableString *soapMessage = [NSMutableString stringWithFormat:
                                        @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                                        "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                                        "<soap:Body>\n"
                                        "<%@ xmlns=\"%@\">\n"
                                        ,name,nameSpace
                                        ];
        
        if (allKeys == nil) {
            NSMutableArray *allMuKeys = [[NSMutableArray alloc]initWithArray:[parameters allKeys]];
            for (int index = 0; index < allMuKeys.count; index++) {
                [soapMessage appendString:[NSString stringWithFormat:@"<%@>%@</%@>\n",allMuKeys[index],parameters[allMuKeys[index]],allMuKeys[index]]];
            }
        } else {
            for (int index = 0; index < allKeys.count; index++) {
                [soapMessage appendString:[NSString stringWithFormat:@"<%@>%@</%@>\n",allKeys[index],parameters[allKeys[index]],allKeys[index]]];
            }
        }
        [soapMessage appendString:[NSString stringWithFormat:@"</%@>\n",name]];
        [soapMessage appendString:@"</soap:Body>\n"];
        [soapMessage appendString:@"</soap:Envelope>\n"];
        NSURL *myurl = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",__kWebServiceUrl,url]];
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:myurl];
        NSString *msgLength = [NSString stringWithFormat:@"%lu", (unsigned long)[soapMessage length]];
        [request addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
        [request addValue: msgLength forHTTPHeaderField:@"Content-Length"];
        [request addValue: action forHTTPHeaderField:@"SOAPAction"];
        [request setHTTPMethod:@"POST"];
        [request setHTTPBody: [soapMessage dataUsingEncoding:NSUTF8StringEncoding]];
        [request setTimeoutInterval:20];
        AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
        operation.responseSerializer = [AFHTTPResponseSerializer serializer];
        [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
            NSXMLParser *xmlParser = [[NSXMLParser alloc] initWithData: responseObject];
            [xmlParser setDelegate: self];//设置xml解析协议
            [xmlParser setShouldResolveExternalEntities: YES];
            [xmlParser parse];//这里调用协议方法开始解析xml数据
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            //__kMyLog(@"%@",error);
            _myfailBlock(error);
            dispatch_semaphore_signal(_semaphore);
        }];
        [operation start];
        
    });
}

//开始解析xml数据
- (void)parserDidStartDocument:(NSXMLParser *)parser {
    //NSLog(@"-------------------start--------------");
}

//开始解析节点，，这是一个树形结构，，
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *) namespaceURI qualifiedName:(NSString *)qName attributes: (NSDictionary *)attributeDict {
    [self.elementString setString:@""];
}

//这里可以得到需要的数值。
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    [self.elementString appendString:string];
    
}

//结束一个节点的解析，这是一个从内到外的反树形结构
- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {

}

//解析出错
- (void)parser:(NSXMLParser *)parser validationErrorOccurred:(NSError *)validationError
{
    _myfailBlock(validationError);
    dispatch_semaphore_signal(_semaphore);
}

#pragma mark -结束xml数据解析
- (void)parserDidEndDocument:(NSXMLParser *)parser{
    
    //字符串转换成data数据
    NSData *jsonData = [self.elementString dataUsingEncoding:NSUTF8StringEncoding];
    //data解析为字典
    NSDictionary *resDict = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:nil];
    
    if (resDict[@"ErrorDescription"]) {
        if ([resDict[@"IsSuccess"] boolValue] && ![resDict[@"ErrorDescription"] isKindOfClass:[NSString class]] ) {
            _mysuccessBlock(resDict);
            dispatch_semaphore_signal(_semaphore);
        } else {
            NSError *error = [[NSError alloc]initWithDomain:resDict[@"ErrorDescription"] code:-123 userInfo:nil];
            _myfailBlock(error);
            dispatch_semaphore_signal(_semaphore);
        }
    } else if (resDict[@"ErrorInfo"]) {
        if ([resDict[@"IsSuccess"] boolValue] && ![resDict[@"ErrorInfo"] isKindOfClass:[NSString class]] ) {
            _mysuccessBlock(resDict);
            dispatch_semaphore_signal(_semaphore);
        } else {
            NSError *error = [[NSError alloc]initWithDomain:resDict[@"ErrorInfo"] code:-123 userInfo:nil];
            _myfailBlock(error);
            dispatch_semaphore_signal(_semaphore);
        }
    }

}


@end
