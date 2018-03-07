//
//  KCStretchableImageCache.m
//  KX3
//
//  Created by Song xiaofeng on 12-10-22.
//  Copyright (c) 2012年 kaixin001. All rights reserved.
//
#import "KCUtils_EventBus.h"
#import "KCStretchableImageCache.h"

@implementation KCStretchableImageCache
SYNTHESIZE_SINGLETON_FOR_CLASS(KCStretchableImageCache)

- (id)init
{
    self = [super init];
    if (self)
    {
        _stretchableImages = [[NSMutableDictionary alloc] initWithCapacity:25];
        [KCUtils_EventBus addEventListener:UIApplicationDidReceiveMemoryWarningNotification target:self callBack:@selector(didReceiveMemoryWarning:)];
    }
    return self;
}

- (void)dealloc
{
    [KCUtils_EventBus removeEventListenerWithTarget:self];
    [_stretchableImages release];
    [super dealloc];
}

- (UIImage *)originImageNamed:(NSString *)imgName
{
    UIImage* img = [_stretchableImages objectForKey:imgName];
    
    if (!img)
    {
        img = [UIImage imageNamed:imgName];
        if (img)
        {
            [_stretchableImages setObject:img forKey:imgName];
        }
    }
    
    return img;
}

- (UIImage*)imageNamed:(NSString*)imgName
          leftCapwidth:(NSInteger)leftCapWidth
          topCapHeight:(NSInteger)topCapHeight;
{    
    NSString *strechKey = [NSString stringWithFormat:@"%@{%d:%d}", imgName, leftCapWidth, topCapHeight];
    
    UIImage* img = [_stretchableImages objectForKey:strechKey];
    
    if (!img){
        img = [UIImage imageNamed:imgName];
        img = [img stretchableImageWithLeftCapWidth:leftCapWidth topCapHeight:topCapHeight];
        
        if (img){
            [_stretchableImages setObject:img forKey:strechKey];
        }
    }
    
    return img;
}

- (void)unloadAllCachedImages;
{
    [_stretchableImages removeAllObjects];
}

- (void)didReceiveMemoryWarning:(NSNotification*)notification
{
    [self unloadAllCachedImages];
}
@end
