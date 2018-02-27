//
//  ViewController.m
//  LockDemo
//
//  Created by pengpeng yan on 16/3/10.
//  Copyright © 2016年 peng yan. All rights reserved.
//
#define LeftDistance 80
#define RightDistance 100
#define Height 30
#import "ViewController.h"
#import "Masonry.h"
#import "LockViewController.h"

@interface ViewController ()
@property(nonatomic,strong)UIButton *CreateButton;//创建按钮
@property(nonatomic,strong)UIButton *ModifyButton;//修改按钮
@property(nonatomic,strong)UIButton *VerifyButton;//验证按钮
@property(nonatomic,strong)UIButton *RemoveButton;//删除按钮
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initsubViews];
    [self initConstraint];
}
- (void)initsubViews{
    [self.view addSubview:self.CreateButton];
    [self.view addSubview:self.ModifyButton];
    [self.view addSubview:self.VerifyButton];
    [self.view addSubview:self.RemoveButton];
}
- (void)initConstraint{
   [_CreateButton mas_makeConstraints:^(MASConstraintMaker *make) {
       make.top.equalTo(self.view.mas_top).offset(60);
       make.left.equalTo(self.view.mas_left).offset(LeftDistance);
       make.right.equalTo(self.view.mas_right).offset(-RightDistance);
       make.height.mas_equalTo(Height);
   }];
   [_ModifyButton mas_makeConstraints:^(MASConstraintMaker *make) {
       make.top.equalTo(_CreateButton.mas_bottom).offset(Height);
       make.left.equalTo(self.view.mas_left).offset(LeftDistance);
       make.right.equalTo(self.view.mas_right).offset(-RightDistance);
       make.height.mas_equalTo(Height);
   }];
    [_VerifyButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_ModifyButton.mas_bottom).offset(Height);
        make.left.equalTo(self.view.mas_left).offset(LeftDistance);
        make.right.equalTo(self.view.mas_right).offset(-RightDistance);
        make.height.mas_equalTo(Height);
    }];
    [_RemoveButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_VerifyButton.mas_bottom).offset(Height);
        make.left.equalTo(self.view.mas_left).offset(LeftDistance);
        make.right.equalTo(self.view.mas_right).offset(-RightDistance);
        make.height.mas_equalTo(Height);
    }];

}

#pragma mark -  setter/ getter
- (UIButton *)CreateButton{
    if (!_CreateButton) {
        _CreateButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [_CreateButton addTarget:self action:@selector(CreateButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        [_CreateButton setTitle:@"创建" forState:UIControlStateNormal];
    }
    return _CreateButton;
}

- (UIButton *)ModifyButton{
    if (!_ModifyButton) {
        _ModifyButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [_ModifyButton addTarget:self action:@selector(ModifyButtonAction:) forControlEvents:UIControlEventTouchUpInside];
         [_ModifyButton setTitle:@"修改" forState:UIControlStateNormal];
    }
    return _ModifyButton;
}

- (UIButton *)VerifyButton{
    if (!_VerifyButton) {
        _VerifyButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [_VerifyButton addTarget:self action:@selector(VerifyButtonAction:) forControlEvents:UIControlEventTouchUpInside];
         [_VerifyButton setTitle:@"验证" forState:UIControlStateNormal];
    }
    return _VerifyButton;
}

- (UIButton *)RemoveButton{
    if (!_RemoveButton) {
        _RemoveButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [_RemoveButton addTarget:self action:@selector(RemoveButtonAction:) forControlEvents:UIControlEventTouchUpInside];
         [_RemoveButton setTitle:@"移除" forState:UIControlStateNormal];
    }
    return _RemoveButton;
}

#pragma mark - buttonAction
- (void)CreateButtonAction:(UIButton *)button{
    LockViewController *lockViewController = [[LockViewController alloc] initWithType:LockTypeCreate LockAppearMode:LockAppearModePresent];
   // [lockViewController setDelegate:self];
    [self presentViewController:lockViewController animated:YES completion:nil];
}

- (void)ModifyButtonAction:(UIButton *)button{
    
}

- (void)VerifyButtonAction:(UIButton *)button{
    
}

- (void)RemoveButtonAction:(UIButton *)button{
    
}







@end
