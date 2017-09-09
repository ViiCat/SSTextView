//
//  SSTextView.h
//  JasonTools
//
//  Created by Jason.Liu on 2017/9/6.
//  Copyright © 2017年 ViiCat.com. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, CountOrder) {
    ///升序
    CountOrderAsc,
    ///降序
    CountOrderDes,
};

typedef NS_ENUM(NSInteger, CountType) {
    ///仅显示数字
    CountTypeNumberOnly,
    ///显示百分比 例如 0/20
    CountTypePercent,
};

@interface SSTextView : UIView//UITextView

///字体 默认15
@property (nonatomic, strong) UIFont *font;

///占位文字
@property (nonatomic, copy) NSString *placeHolderText;

///约束最多可输入文字数 默认20
@property (nonatomic, assign) NSInteger maxCount;

///隐藏计数面板 默认显示
@property (nonatomic, assign) bool countHidden;

///计数Label 升降序类型
@property (nonatomic, assign) CountOrder countOrder;

///计数Label 显示风格
@property (nonatomic, assign) CountType countType;

- (UITextView *)getTextView;
- (UILabel *)getCountLabel;
- (UILabel *)getPlaceHolderLabel;
@end
