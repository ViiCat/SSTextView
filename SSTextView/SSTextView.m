//
//  SSTextView.m
//  JasonTools
//
//  Created by Jason.Liu on 2017/9/6.
//  Copyright © 2017年 ViiCat.com. All rights reserved.
//

#import "SSTextView.h"
@interface SSTextView()<UITextViewDelegate>

///UITextView
@property (nonatomic, strong) UITextView *textView;
///占位文本
@property (nonatomic, strong) UILabel *lbPlaceHolder;
///计数Label
@property (nonatomic, strong) UILabel *lbCount;

@end

@implementation SSTextView

- (instancetype)init {
    self = [super init];
    if (self) {
        [self createUI];
        
        self.maxCount = 20;
        self.font = [UIFont systemFontOfSize:15];
    }
    return self;
}

- (void)createUI {
    
    //KVO监听字体
    [self.textView addObserver:self
                    forKeyPath:@"font"
                       options:0
                       context:nil];
    
    [self addSubview:self.textView];
    [self.textView makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    
    [self addSubview:self.lbCount];
    [self.lbCount makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.right).offset(-4);
        make.bottom.equalTo(self.bottom).offset(-4);
    }];
    
    [self addSubview:self.lbPlaceHolder];
    [self.lbPlaceHolder makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.top).offset(8);
        make.left.equalTo(self.left).offset(4);
    }];
}


#pragma mark - KVO
- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary<NSKeyValueChangeKey,id> *)change
                       context:(void *)context {

    if ([keyPath isEqualToString:@"font"]) {
        //占位文本字体大小
        self.lbPlaceHolder.font = self.textView.font;
    }
}

#pragma mark - setter

- (void)setFont:(UIFont *)font {
    _font = font;
    self.textView.font = _font;
}

- (void)setCountHidden:(bool)countHidden {
    _countHidden = countHidden;
    self.lbCount.hidden = _countHidden;
}

- (void)setMaxCount:(NSInteger)maxCount {
    _maxCount = maxCount;
    
    [self setTextLength:self.textView.text.length maxCount:_maxCount];
}

- (void)setCountOrder:(CountOrder)countOrder {
    _countOrder = countOrder;
    
    [self setTextLength:self.textView.text.length maxCount:self.maxCount];
}

- (void)setCountType:(CountType)countType {
    _countType = countType;
    
    [self setTextLength:self.textView.text.length maxCount:self.maxCount];
}

#pragma mark - UITextViewDelegate

- (void)textViewDidChange:(UITextView *)textView {
    
    // 显示/隐藏 占位文字
    self.lbPlaceHolder.hidden = [textView.text length] ? YES : NO;
    
    //是否有未选中的字符
    if ([textView markedTextRange] != nil) {
        return;
    }
    
    //输入文字个数大于限制
    NSInteger length = [textView.text length];
    if (length > self.maxCount) {
        textView.text = [textView.text substringToIndex:self.maxCount];
        length = self.maxCount;
    }
    
    //计数器
    [self setTextLength:length maxCount:self.maxCount];
}

#pragma mark - Action
//计数器
- (void)setTextLength:(NSInteger)length maxCount:(NSInteger)maxCount {
    
    NSString *strCount;
    
    //升降序
    NSInteger value = (self.countOrder == CountOrderAsc) ? length : maxCount - length;
    
    //呈现的样式
    if (self.countType == CountTypeNumberOnly) {
        strCount = [NSString stringWithFormat:@"%ld/%ld",(long)value, (long)maxCount];
    }else {
        strCount = [NSString stringWithFormat:@"%ld", maxCount - value];
    }
    
    self.lbCount.text = strCount;
}

#pragma mark - Other
- (UITextView *)getTextView {
    return self.textView;
}

- (UILabel *)getCountLabel {
    return self.lbCount;
}

- (UILabel *)getPlaceHolderLabel {
    return self. lbPlaceHolder;
}

#pragma mark - LazyLoad
- (UITextView *)textView {
    if (!_textView) {
        _textView = [[UITextView alloc] init];
        _textView.delegate = self;
        _textView.font = self.font;
        _textView.backgroundColor = [UIColor clearColor];
    }
    return _textView;
}

- (UILabel *)lbCount {
    if (!_lbCount) {
        _lbCount = [[UILabel alloc] init];
    }
    return _lbCount;
}

- (UILabel *)lbPlaceHolder {
    if (!_lbPlaceHolder) {
        _lbPlaceHolder = [[UILabel alloc] init];
        _lbPlaceHolder.font = self.font;
        _lbPlaceHolder.textColor = [UIColor grayColor];
        _lbPlaceHolder.text = @"please input";
    }
    return _lbPlaceHolder;
}

- (void)dealloc {
    [self.textView removeObserver:self forKeyPath:@"font"];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
