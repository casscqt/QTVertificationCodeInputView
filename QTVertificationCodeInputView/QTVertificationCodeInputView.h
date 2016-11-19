//
//  QTVertificationCodeInputView.h
//  QTVertificationCodeInputView
//
//  Created by Cass on 16/11/18.
//  Copyright © 2016年 Cass. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^textDidChangeBlock)(UITextField *textField);

@interface QTVertificationCodeInputView : UIView

/// 验证码位数
@property(nonatomic, assign)  IBInspectable NSInteger numberOfVertificationCode;
/// 验证码/密码内容，可以通过该属性拿到验证码内容
@property (nonatomic, copy )  IBInspectable NSString *vertificationCode;
/// 间距
@property (nonatomic, assign) IBInspectable CGFloat   spacing;
/// 边框线宽度
@property (nonatomic, assign) IBInspectable CGFloat   lineWidth;
/// 边框颜色
@property (nonatomic, strong) IBInspectable UIColor   *borderColor;
/// 边框圆角
@property (nonatomic, assign) IBInspectable CGFloat   cornerRadius;
/// font
@property (nonatomic, strong) IBInspectable UIFont    *font;
/// textColor
@property (nonatomic, strong) IBInspectable UIColor   *textColor;
/// 文本变化回调
@property (nonatomic, copy  ) textDidChangeBlock block;

@end
