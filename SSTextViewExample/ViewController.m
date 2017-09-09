//
//  ViewController.m
//  SSTextViewExample
//
//  Created by Jason.Liu on 2017/9/9.
//  Copyright © 2017年 ViiCat.com. All rights reserved.
//

#import "ViewController.h"
#import "SSTextView.h"

@interface ViewController ()
@property (nonatomic, strong) SSTextView *textView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.view addSubview:self.textView];
    [self.textView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.top).offset(20);
        make.left.equalTo(self.view.left);
        make.right.equalTo(self. view.right);
        make.height.equalTo(200);
    }];
}

- (SSTextView *)textView {
    if (!_textView) {
        _textView = [[SSTextView alloc] init];
        
        _textView.backgroundColor = [UIColor lightGrayColor];
        
        _textView.placeHolderText = @"这里是占位文字";
        
        ///约束最多可输入文字数 默认20
        _textView.maxCount = 10;
        
        ///计数Label 升降序类型
        _textView.countOrder = CountOrderAsc;
        
        ///计数Label 显示风格
        _textView.countType = CountTypePercent;
    }
    return _textView;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
