//
//  NSData+Ext.m
//  Lafaso
//
//  Created by YULING MINA on 14-7-16.
//  Copyright (c) 2014年 Lafaso. All rights reserved.
//

#import "NSData+Ext.h"
#import "GTMBase64.h"
#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonHMAC.h>

@implementation NSData (MD5)

- (NSString *)MD5EncodingString
{
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5([self bytes], [self length], result);
    
    return [NSString stringWithFormat:@"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X", result[0], result[1], result[2], result[3], result[4], result[5], result[6], result[7], result[8], result[9], result[10], result[11], result[12], result[13], result[14], result[15]];
}

@end

@implementation NSData (base64)

- (NSString *)base64EncodingString
{
    return [GTMBase64 stringByEncodingData:self];
}

@end

@implementation NSData (SHA1)

- (NSData *)HMACSHA1EncodeDataWithKey:(NSString *)key
{
    NSData *keyData = [key dataUsingEncoding:NSUTF8StringEncoding];
    void *buffer = malloc(CC_SHA1_DIGEST_LENGTH);
    CCHmac(kCCHmacAlgSHA1, [keyData bytes], [keyData length], [self bytes], [self length], buffer);
    
    NSData *encodeData = [NSData dataWithBytesNoCopy:buffer length:CC_SHA1_DIGEST_LENGTH freeWhenDone:YES];
    return encodeData;
}

@end
