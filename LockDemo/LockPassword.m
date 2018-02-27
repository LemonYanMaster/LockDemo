//
//  LockPassword.m
//  LockDemo
//
//  Created by pengpeng yan on 16/3/11.
//  Copyright © 2016年 peng yan. All rights reserved.
//
#define LockPassWord @"password"
#import "LockPassword.h"

@implementation LockPassword

+ (BOOL)isEncrypted{
  NSString *password = [[NSUserDefaults standardUserDefaults] objectForKey:LockPassWord];
    if (password == nil) {
        return NO;
    }else{
        return YES;
    }
}

+ (BOOL)setNewPassword:(NSString *)password{
    if (password == nil || [password isEqualToString:@""]) {
        return NO;
    }
    [[NSUserDefaults standardUserDefaults] setObject:password forKey:LockPassWord];
    [[NSUserDefaults standardUserDefaults] synchronize];
    return YES;
}

+ (NSString *)oldPassword{
    
   NSString *oldPassword = [[NSUserDefaults standardUserDefaults] objectForKey:LockPassWord];
    if (oldPassword != nil && ![oldPassword isEqualToString:@""]) {
        return oldPassword;
    }
    
    return nil;
}

+ (void)removePassword{

    [[NSUserDefaults standardUserDefaults] removeObjectForKey:LockPassWord];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
}




@end
