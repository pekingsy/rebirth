//
//  NSDictionary+Ext.m
//  Lafaso
//
//  Created by wj on 14-7-11.
//  Copyright (c) 2014年 Lafaso. All rights reserved.
//

#import "NSDictionary+Ext.h"

@implementation NSDictionary (value)

- (BOOL)hasValueForKey:(NSString *)key
{
    BOOL hasValue = FALSE;
    if (key) {
        if ([self valueForKey:key]) {
            hasValue = TRUE;
        }
    }
    
    return hasValue;
}

- (BOOL)boolValueForKey:(NSString *)key
{
    BOOL boolValue = FALSE;
    if (key) {
        id object = [self valueForKey:key];
        if ([object respondsToSelector:@selector(boolValue)]) {
            boolValue = [object boolValue];
        }
    }
    
    return boolValue;
}

- (int)intValueForKey:(NSString *)key
{
    int intValue = 0;
    if (key) {
        id object = [self valueForKey:key];
        if ([object respondsToSelector:@selector(intValue)]) {
            intValue = [object intValue];
        }
    }
    
    return intValue;
}

- (NSInteger)integerValueForKey:(NSString *)key
{
    NSInteger integerValue = 0;
    if (key) {
        id object = [self valueForKey:key];
        if ([object respondsToSelector:@selector(integerValue)]) {
            integerValue = [object integerValue];
        }
    }
    
    return integerValue;
}

- (long)longValueForKey:(NSString *)key
{
    long longValue = 0;
    if (key) {
        id object = [self valueForKey:key];
        if ([object respondsToSelector:@selector(longValue)]) {
            longValue = [object longValue];
        }
    }
    
    return longValue;
}

- (long long)longlongValueForKey:(NSString *)key
{
    long long longlongValue = 0;
    if (key) {
        id object = [self valueForKey:key];
        if ([object respondsToSelector:@selector(longLongValue)]) {
            longlongValue = [object longLongValue];
        }
    }
    
    return longlongValue;
}

- (float)floatValueForKey:(NSString *)key
{
    float floatValue = 0;
    if (key) {
        id object = [self valueForKey:key];
        if ([object respondsToSelector:@selector(floatValue)]) {
            floatValue = [object floatValue];
        }
    }
    
    return floatValue;
}

- (double)doubleValueForKey:(NSString *)key
{
    double doubleValue = 0;
    if (key) {
        id object = [self valueForKey:key];
        if ([object respondsToSelector:@selector(doubleValue)]) {
            doubleValue = [object doubleValue];
        }
    }
    
    return doubleValue;
}

@end

@implementation NSDictionary (Data)

- (CGRect)rectForKey:(NSString *)key
{
    CGRect rectValue = CGRectZero;
    if (key) {
        id object = [self valueForKey:key];
        if (object && [object isKindOfClass:[NSDictionary class]]) {
            BOOL result = FALSE;
            result = CGRectMakeWithDictionaryRepresentation((CFDictionaryRef)object, &rectValue);
            if (!result) {
                rectValue = CGRectZero;
            }
        }
    }
    
    return rectValue;
}

- (CGPoint)pointForKey:(NSString *)key
{
    CGPoint pointValue = CGPointZero;
    if (key) {
        id object = [self valueForKey:key];
        if (object && [object isKindOfClass:[NSDictionary class]]) {
            BOOL result = FALSE;
            result = CGPointMakeWithDictionaryRepresentation((CFDictionaryRef)object, &pointValue);
            if (!result) {
                pointValue = CGPointZero;
            }
        }
    }
    
    return pointValue;
}

- (CGSize)sizeForKey:(NSString *)key
{
    CGSize sizeValue = CGSizeZero;
    if (key) {
        id object = [self valueForKey:key];
        if (object && [object isKindOfClass:[NSDictionary class]]) {
            BOOL result = FALSE;
            result = CGSizeMakeWithDictionaryRepresentation((CFDictionaryRef)object, &sizeValue);
            if (!result) {
                sizeValue = CGSizeZero;
            }
        }
    }
    
    return sizeValue;
}

- (const char*)cStringForKey:(NSString *)key
{
    const char *cString = NULL;
    if (key) {
        id object = [self valueForKey:key];
        if ([object respondsToSelector:@selector(UTF8String)]) {
            cString = [object UTF8String];
        }
    }
    
    return cString;
}

- (SEL)selectorForKey:(NSString *)key
{
    SEL selector = NULL;
    const char *name = [self cStringForKey:key];
    if (name) {
        selector = sel_registerName(name);
    }
    
    return selector;
}

@end


@implementation NSDictionary (MutableDeepCopy)

- (NSMutableDictionary *) mutableDeepCopy {
    NSMutableDictionary *returnDict = [[NSMutableDictionary alloc]
									   initWithCapacity:[self count]];
    NSArray *keys = [self allKeys];
    for (id key in keys) {
        id oneValue = [self valueForKey:key];
        id oneCopy = nil;
		
        if ([oneValue respondsToSelector:@selector(mutableDeepCopy)])
            oneCopy = [oneValue mutableDeepCopy];
        else if ([oneValue respondsToSelector:@selector(mutableCopy)])
            oneCopy = [oneValue mutableCopy];
        if (oneCopy == nil)
            oneCopy = [oneValue copy];
        [returnDict setValue:oneCopy forKey:key];
        [oneCopy release];
    }
    return returnDict;
}


- (NSString*)coverString
{
    if ([self isKindOfClass:[NSDictionary class]]) {
        NSMutableString * temp = [NSMutableString string];
        for (int i = 0; i < [[self allKeys]count]; i++) {
            NSString* key = [[self allKeys] objectAtIndex:i];
            [temp appendFormat:@"%@=",key];
            if (i < [[self allKeys]count] - 1) {
                [temp appendFormat:@"\"%@\";",[self objectForKey:key]];
            }else{
                [temp appendFormat:@"\"%@\"",[self objectForKey:key]];
            }
        }
        return temp;
    }
    return [NSString string];
}

- (NSString*)coverPreString
{
    if ([self isKindOfClass:[NSDictionary class]]) {
        NSMutableString * temp = [NSMutableString string];
        for (int i = 0; i < [[self allKeys]count]; i++) {
            NSString* key = [[self allKeys] objectAtIndex:i];
            [temp appendFormat:@"%@=",key];
            if (i < [[self allKeys]count] - 1) {
                [temp appendFormat:@"%@;",[self objectForKey:key]];
            }else{
                [temp appendFormat:@"%@",[self objectForKey:key]];
            }
        }
        return temp;
    }
    return [NSString string];
}

@end
