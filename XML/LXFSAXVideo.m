//
//  LXFSAXVideo.m
//  json test
//
//  Created by Xiaofeng Li  on 15/8/23.
//  Copyright © 2015年 Xiaofeng Li . All rights reserved.
//

#import "LXFSAXVideo.h"
#import "Video.h"

@interface LXFSAXVideo ()<NSXMLParserDelegate>

/// 解析使用
@property (nonatomic, strong) NSMutableArray<Video *> *videos;
@property (nonatomic, strong) Video *currentlyVideo;
@property (nonatomic, strong) NSMutableString *currentlyString;

@end

@implementation LXFSAXVideo

+(void)parserVideo:(NSData *)data finished:(void (^)(NSArray *array))finishBlock
{
    NSAssert(finishBlock, @"请传入回调 block");
    LXFSAXVideo *parserDelegate=[[LXFSAXVideo alloc]init];
    NSXMLParser *parser=[[NSXMLParser alloc]initWithData:data];
    parser.delegate=parserDelegate;
    [parser parse];
    [[NSOperationQueue mainQueue]addOperationWithBlock:^{
        finishBlock(parserDelegate.videos);
    }];
}

#pragma mark - NSXMLParserDelegate

/// 开始文档
-(void)parserDidStartDocument:(NSXMLParser *)parser
{
    [self.videos removeAllObjects];
}
/// 开始节点
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary<NSString *,NSString *> *)attributeDict
{
    if ([elementName isEqualToString:@"video"]) {
        self.currentlyVideo=[[Video alloc]init];
        self.currentlyVideo.videoId=@(attributeDict[@"videoId"].intValue);
    }
    [self.currentlyString setString:@""];
}
/// 发现文本
-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    [self.currentlyString appendString:string];
}
/// 结束节点
-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    if([elementName isEqualToString:@"video"])
    {
        [self.videos addObject:self.currentlyVideo];
    }else if(![elementName isEqualToString:@"videos"])
    {
        [self.currentlyVideo setValue:self.currentlyString forKey:elementName];
    }
    
}
/// 结束文档
-(void)parserDidEndDocument:(NSXMLParser *)parser
{
    NSLog(@"结束解析--");
}
/// 解析发生错误
-(void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError
{
    NSLog(@"解析发生错误-> %@",parseError);
    NSAssert(parseError == nil, @"解析发生错误");
}

#pragma mark - 懒加载
-(NSMutableArray<Video *> *)videos
{
    if (_videos == nil) {
        _videos = [[NSMutableArray alloc] init];
    }
    return _videos;
}
-(NSMutableString *)currentlyString
{
    if (_currentlyString == nil) {
        _currentlyString = [[NSMutableString alloc] init];
    }
    return _currentlyString;
}
@end
