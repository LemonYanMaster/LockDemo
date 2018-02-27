//
//  LockPassword.h
//  LockDemo
//
//  Created by pengpeng yan on 16/3/11.
//  Copyright © 2016年 peng yan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LockPassword : NSObject

+ (BOOL)isEncrypted;

+ (BOOL)setNewPassword:(NSString *)password;

+ (NSString *)oldPassword;

+ (void)removePassword;

@end
