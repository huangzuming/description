//
//  NSArray+Log.m
//
//
//  Created by HUANGZUMING on 2021/6/14.
//

#import "NSArray+Log.h"



#pragma mark - NSArray分类
@implementation NSArray (Log)

-(NSString *)descriptionWithLocale:(id)locale indent:(NSUInteger)level{
    NSMutableString *string = [NSMutableString string];
       
       //开头有个[
       [string appendString:@"[\n"];
       
       //遍历所有的元素
       [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
           [string appendFormat:@"\t%@,\n", obj];
       }];
       
       //结尾有个]
       [string appendString:@"]"];
       
       //查找最后一个逗号
       NSRange range = [string rangeOfString:@"," options:NSBackwardsSearch];
       if (range.location != NSNotFound)
       [string deleteCharactersInRange:range];
    
       return string;
}


//xcode8 以后系统不再调用此方法
- (NSString *)descriptionWithLocale:(id)locale{
    NSMutableString *string = [NSMutableString string];
       
       //开头有个[
       [string appendString:@"[\n"];
       
       //遍历所有的元素
       [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
           [string appendFormat:@"\t%@,\n", obj];
       }];
       
       //结尾有个]
       [string appendString:@"]"];
       
       //查找最后一个逗号
       NSRange range = [string rangeOfString:@"," options:NSBackwardsSearch];
       if (range.location != NSNotFound)
       [string deleteCharactersInRange:range];
       
       return string;
}
@end


#pragma mark - NSDictionary分类
@implementation NSDictionary (Log)

//xcode8 以后系统不再调用此方法
-(NSString *)descriptionWithLocale:(id)locale indent:(NSUInteger)level{
    
    NSMutableString *string = [NSMutableString string];
        
        //开头有个{
        [string appendString:@"{\n"];
        
        //遍历所有的键值对
        [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
            [string appendFormat:@"\t%@", key];
            [string appendString:@" : "];
            [string appendFormat:@"%@,\n", obj];
        }];
        
        //结尾有个}
        [string appendString:@"}"];
        
        //查找最后一个逗号
        NSRange range = [string rangeOfString:@"," options:NSBackwardsSearch];
        if (range.location != NSNotFound)
        [string deleteCharactersInRange:range];
        
        return string;
    
}

//xcode8 以后系统不再调用此方法
- (NSString *)descriptionWithLocale:(id)locale{
    NSMutableString *string = [NSMutableString string];
        
        //开头有个{
        [string appendString:@"{\n"];
        
        //遍历所有的键值对
        [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
            [string appendFormat:@"\t%@", key];
            [string appendString:@" : "];
            [string appendFormat:@"%@,\n", obj];
        }];
        
        //结尾有个}
        [string appendString:@"}"];
        
        // 查找最后一个逗号
        NSRange range = [string rangeOfString:@"," options:NSBackwardsSearch];
        if (range.location != NSNotFound)
        [string deleteCharactersInRange:range];
        return string;
}
@end
