//
//  NSString+Ext.h
//  Lafaso
//
//  Created by YULING MINA on 14-7-15.
//  Copyright (c) 2014年 Lafaso. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (MD5)

/**
 *  MD5加密
 *
 *  @return 加密后字符串
 */
- (NSString *)MD5EncodingString;

@end

@interface NSString (base64)

/**
 *  base64加密
 *
 *  @return 加密有字符串
 */
- (NSString *)base64EncodingString;

@end

@interface NSString (SHA1)

/**
 *  SHA1加密
 *
 *  @param key 密钥
 *
 *  @return
 */
- (NSData *)HMACSHA1EncodeDataWithKey:(NSString *)key;

@end

@interface NSString (url)

/**
 *  urlencode
 *
 *  @return encode后字符串
 */
- (NSString *)URLEncodingString;

/**
 *  urldecode
 *
 *  @return decode后字符串
 */
- (NSString *)URLDecodingString;

@end

@interface NSString (Regex)

/**
 *  是否是手机号码
 *
 *  @return YES or NO
 */
- (BOOL)isMobileNumber;

@end

@interface NSString (Device)

/**
 *  手机IMEI
 *
 *  @return
 */
+ (NSString *)imei;

/**
 *  手机MAC地址
 *
 *  @return 
 */
+ (NSString *)macAddress;

@end

@interface NSString (Emoji)

+ (NSString* )getExpressionStrById:(int)idx;

+(NSString*)getExpressionById:(int)idx;

+ (NSString *)convert2ShortTime:(NSTimeInterval)secs;

- (NSDictionary*)coverDictionary;

// 保存到本地磁盘
- (void)toLocalDiskForKey:(NSString *)key;
//路径转换到缓存中自定义的文件夹中

- (NSString*)coverDirToCacheDir;
 @end