//
//  YDMapPlatformXmlParser.m
//  YDKit
//
//  Created by rowena on 2018/7/18.
//  Copyright © 2018年 王允顶. All rights reserved.
//

#import "YDMapPlatformXmlParser.h"
#import "YDMapPlatform.h"

@interface YDMapPlatformXmlParser()<NSXMLParserDelegate>

@property (nonatomic, strong) NSMutableArray *array;

@end

@implementation YDMapPlatformXmlParser

- (instancetype)init {
    self = [super init];
    if (self) {
        self.array = [[NSMutableArray alloc] init];
    }
    return self;
}
- (NSMutableArray *)parser {
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"YDConfig" ofType:@"map.xml"];
    NSURL *url = [[NSURL alloc] initFileURLWithPath:filePath];
    NSXMLParser *xmlParser = [[NSXMLParser alloc] initWithContentsOfURL:url];
    xmlParser.delegate = self;
    //解析
    [xmlParser parse];
    return self.array;
}


#pragma mark -- NSXMLParserDelegate
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary<NSString *,NSString *> *)attributeDict {
    //解析XML
    if ([elementName isEqualToString:@"platform"]) {
        YDMapPlatform *platform = [[YDMapPlatform alloc] initWithDict:attributeDict];
        [self.array addObject:platform];
    }
}

@end
