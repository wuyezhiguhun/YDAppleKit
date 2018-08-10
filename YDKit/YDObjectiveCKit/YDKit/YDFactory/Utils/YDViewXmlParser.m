//
//  YDViewXmlParser.m
//  YDKit
//
//  Created by rowena on 2018/7/9.
//  Copyright © 2018年 王允顶. All rights reserved.
//

#import "YDViewXmlParser.h"

@interface YDViewXmlParser()<NSXMLParserDelegate>

@property (nonatomic, strong) NSMutableDictionary *dict;
@property (nonatomic, copy) NSString *currentElementName;

@end

@implementation YDViewXmlParser

- (instancetype)init {
    self = [super init];
    if (self) {
        self.dict = [[NSMutableDictionary alloc] init];
    }
    return self;
}

/**
 * 读取配置文件中数据
 * @return 以字典的形式返回字典
 */
- (NSMutableDictionary *)parser {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"YDViewFactoryConfig" ofType:@"xml"];
    NSURL *url = [[NSURL alloc] initFileURLWithPath:path];
    NSXMLParser *parser = [[NSXMLParser alloc] initWithContentsOfURL:url];
    parser.delegate = self;
    [parser parse];
    return self.dict;
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary<NSString *,NSString *> *)attributeDict {
    self.currentElementName = elementName;
    if ([elementName isEqualToString:@"view"]) {
        NSString *key = [attributeDict objectForKey:@"key"];
        NSString *className = [attributeDict objectForKey:@"className"];
        [self.dict setObject:className forKey:key];
    }
}

@end
