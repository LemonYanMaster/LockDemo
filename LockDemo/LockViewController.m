//
//  LockViewController.m
//  LockDemo
//
//  Created by pengpeng yan on 16/3/10.
//  Copyright © 2016年 peng yan. All rights reserved.
//
#import "Masonry.h"
#import "LockViewController.h"
#import "JinnLockSudoko.h"
#import "LockPassword.h"
typedef NS_ENUM(NSInteger,LockStep){
     LockStepNone = 0,
     LockStepCreateNew,
     LockStepCreateAgain,
     LockStepCreateNotMatch,
     LockStepCreateReNew,
     LockStepModifyOld,
     LockStepModifyOldError,
     LockStepModifyReOld,
     LockStepModifyNew,
     LockStepModifyAgain,
     LockStepModifyNotMatch,
     LockStepModifyReNew,
     LockStepVerifyOld,
     LockStepVerifyOldError,
     LockStepVerifyReOld,
     LockStepRemoveOld,
     LockStepRemoveOldError,
     LockStepRemoveReOld
};

@interface LockViewController()<JinnLockSudokoDelegate>

@property(nonatomic,strong)UILabel *noticeLabel;
@property(nonatomic,strong)JinnLockSudoko *sudoko;
@property(nonatomic,assign)LockStep step;
@property(nonatomic,strong)NSString *CachePassword;
@end
@implementation LockViewController

- (instancetype)initWithType:(LockType)lockType LockAppearMode:(LockAppearMode)appearMode{
    if (self = [super init]) {
        self.lockType = lockType;
        self.appearMode = appearMode;
    }
    return self;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self initsubViews];
}
- (UILabel *)noticeLabel{
    if (!_noticeLabel) {
        _noticeLabel = [[UILabel alloc] init];
        _noticeLabel.textAlignment = NSTextAlignmentCenter;
        _noticeLabel.font = [UIFont systemFontOfSize:14.0f];
    }
    return _noticeLabel;
}

- (void)initsubViews{
    [self.view addSubview:self.noticeLabel];
    
    [_noticeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(30);
        make.left.equalTo(self.view.mas_left).offset(50);
        make.right.equalTo(self.view.mas_right).offset(-50);
        make.height.mas_equalTo(30);
    }];
    _sudoko = [[JinnLockSudoko alloc] init];
    CGFloat width = self.view.bounds.size.width;
    CGFloat height = self.view.bounds.size.height;
    _sudoko.frame = CGRectMake((width - JINN_LOCK_SUDOKO_SIDE_LENGTH)/2,
                               (height - JINN_LOCK_SUDOKO_SIDE_LENGTH)/2,
                               JINN_LOCK_SUDOKO_SIDE_LENGTH,
                               JINN_LOCK_SUDOKO_SIDE_LENGTH);

    _sudoko.delegate = self;
    [self.view addSubview:_sudoko];
    _step = LockStepNone;
    switch (self.lockType) {
        case LockTypeCreate:
            [self updateUIforStep:LockStepCreateNew];
            break;
        case LockTypeModify:
            [self updateUIforStep:LockStepModifyOld];
            break;
        case LockTypeVerify:
            [self updateUIforStep:LockStepVerifyOld];
            break;
        case LockTypeRemove:
            [self updateUIforStep:LockStepRemoveOld];
            break;
            
        default:
            break;
    }
}

- (void)updateUIforStep:(LockStep)step{
    _step = step;
    
    switch (step) {
        case LockStepCreateNew:
            _noticeLabel.text = @"请设置新密码";
            _noticeLabel.textColor = [UIColor blackColor];
            break;
       case LockStepCreateAgain:
            _noticeLabel.text = @"请在次确认新密码";
            _noticeLabel.textColor = [UIColor blackColor];
            break;
        case LockStepCreateNotMatch:
            _noticeLabel.text = @"两次密码不匹配";
            _noticeLabel.textColor = [UIColor redColor];
            break;
        case LockStepCreateReNew:
            _noticeLabel.text = @"请重新设置新密码";
            _noticeLabel.textColor = [UIColor blackColor];
            break;
        default:
            break;
    }

}

- (void)sudoko:(JinnLockSudoko *)sudoko passwordDidCreate:(NSString *)password{
    switch (_step) {
        case LockStepCreateNew:
        case LockStepCreateReNew:
        {
            _CachePassword = password;
            [self updateUIforStep:LockStepCreateAgain];
        }
            break;
        case LockStepCreateAgain:
            if ([password isEqualToString:_CachePassword]) {
                [LockPassword setNewPassword:password];
                NSLog(@"创建密码成功%@",password);
                [self dismissViewControllerAnimated:YES completion:nil];
            }else{
                [self updateUIforStep:LockStepCreateNotMatch];
                
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    [self updateUIforStep:LockStepCreateReNew];
                });
                
               // [self updateUIforStep:LockStepCreateReNew];
            }
            
            
            
        default:
            break;
    }


}




@end
