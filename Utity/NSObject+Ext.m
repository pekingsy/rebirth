//
//  NSObject+Ext.m
//  HIYUNTON
//
//  Created by YULING MINA on 14-11-1.
//  Copyright (c) 2014年 hiyunton.com. All rights reserved.
//

#import "NSObject+Ext.h"

@implementation NSObject (Ext)

+ (void)callPhoneNumber:(NSString *)phonenumber
{
    NSString *string = [NSString stringWithFormat:@"tel://%@", phonenumber];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:string]];
}

+ (void)smsPhoneNumber:(NSString *)phonenumber
{
    NSString *string = [NSString stringWithFormat:@"sms://%@", phonenumber];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:string]];
}

@end
