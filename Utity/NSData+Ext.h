//
//  NSData+Ext.h
//  Lafaso
//
//  Created by YULING MINA on 14-7-16.
//  Copyright (c) 2014年 Lafaso. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (MD5)

/**
 *  MD5加密
 *
 *  @return 加密后字符串
 */
- (NSString *)MD5EncodingString;

@end

@interface NSData (base64)

/**
 *  Base64加密
 *
 *  @return 加密后字符串
 */
- (NSString *)base64EncodingString;

@end

@interface NSData (SHA1)

/**
 *  SHA1加密
 *
 *  @param key 密钥
 *
 *  @return 
 */
- (NSData *)HMACSHA1EncodeDataWithKey:(NSString *)key;

@end