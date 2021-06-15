# description
重写NSArray与NSDictionary的descriptionWithLocale方法

在输出一些基本数据类型以及OC对象，我们都可以使用NSLog函数进行输出。

而一般情况下，我们在使用NSLog 和 %@ 输出某个对象时，系统就会调用这个对象的 description 方法，它的返回值就是 NSString 字符串类型，而 description 默认实现返回的格式是 <类名: 对象的内存地址>。

所以在必要情况下，我们需要重写description方法以达到改变输出结果目的，覆盖description方法的默认实现。

注意：千万不要在 description 方法中同时使用 %@ 和 self，如果这样使用了，那么最终会造成程序死循环

原因：使用了%@和self，代表要调用self的description方法，最终就是循环调用description方法

自Xcode8以后，字典和数组的descriptionWithLocale方法都不再被调用
取而代之的是 - (NSString *)descriptionWithLocale:(id)locale indent:(NSUInteger)level


// NSArray

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
       if (range.location != NSNotFound){
       	[string deleteCharactersInRange:range];
       }
       
    
       return string;
}

// NSDictionary

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
        if (range.location != NSNotFound){
           [string deleteCharactersInRange:range];
        }
        
        return string;
    
} 

