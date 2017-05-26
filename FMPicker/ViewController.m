//
//  ViewController.m
//  FMPicker
//
//  Created by fm on 2017/5/26.
//  Copyright © 2017年 wangjiuyin. All rights reserved.
//

#import "ViewController.h"
#import "Control.h"

@interface ViewController()

@property (nonatomic, strong) Control *control;

@end

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self configUI];
}

#pragma mark - Private
- (void)configUI
{
    __weak typeof(self)weakSelf = self;
    [self.view addSubview:self.textArea];
    [self.view addSubview:self.textSingle];
    [self.view addSubview:self.textDate];
    [self.textArea mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(weakSelf.view);
        make.top.equalTo(weakSelf.view).offset(100.f);
        make.size.mas_equalTo(CGSizeMake([UIScreen mainScreen].bounds.size.width*0.6, 30.f));
    }];
    [self.textSingle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(weakSelf.view);
        make.top.equalTo(weakSelf.textArea.mas_bottom).offset(50.f);
        make.size.mas_equalTo(CGSizeMake([UIScreen mainScreen].bounds.size.width*0.6, 30.f));
    }];
    [self.textDate mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(weakSelf.view);
        make.top.equalTo(weakSelf.textSingle.mas_bottom).offset(50.f);
        make.size.mas_equalTo(CGSizeMake([UIScreen mainScreen].bounds.size.width*0.6, 30.f));
    }];
}

#pragma mark - getter & setter
- (Control *)control
{
    if (!_control) {
        _control = [[Control alloc] init];
        _control.vc = self;
    }
    return _control;
}

- (UITextField *)textArea
{
    if (!_textArea) {
        _textArea = [[UITextField alloc] initWithFrame:CGRectZero];
        _textArea.borderStyle = UITextBorderStyleRoundedRect;
        _textArea.delegate = self.control;
    }
    return _textArea;
}

- (UITextField *)textSingle
{
    if (!_textSingle) {
        _textSingle = [[UITextField alloc] initWithFrame:CGRectZero];
        _textSingle.borderStyle = UITextBorderStyleRoundedRect;
        _textSingle.delegate = self.control;
    }
    return _textSingle;
}

- (UITextField *)textDate
{
    if (!_textDate) {
        _textDate = [[UITextField alloc] initWithFrame:CGRectZero];
        _textDate.borderStyle = UITextBorderStyleRoundedRect;
        _textDate.delegate = self.control;
    }
    return _textDate;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
