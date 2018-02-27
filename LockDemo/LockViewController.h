//
//  LockViewController.h
//  LockDemo
//
//  Created by pengpeng yan on 16/3/10.
//  Copyright © 2016年 peng yan. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,LockType){
    LockTypeCreate = 0,
    LockTypeModify,
    LockTypeVerify,
    LockTypeRemove,
};

typedef NS_ENUM(NSInteger,LockAppearMode){
    LockAppearModePush = 0,
    LockAppearModePresent,

};
#pragma mark - delegate
@protocol LockViewControllerDelegate <NSObject>
@optional


@end

@interface LockViewController : UIViewController
@property (nonatomic,assign)LockType lockType;
@property (nonatomic,assign)LockAppearMode appearMode;
@property (nonatomic,weak)id<LockViewControllerDelegate>delegate;
- (instancetype)initWithType:(LockType)lockType LockAppearMode:(LockAppearMode)appearMode;
@end
