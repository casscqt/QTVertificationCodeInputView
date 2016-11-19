//
//  QTVertificationCodeInputView.m
//  QTVertificationCodeInputView
//
//  Created by Cass on 16/11/18.
//  Copyright © 2016年 Cass. All rights reserved.
//

#import "QTVertificationCodeInputView.h"
#import "QTVertificationCodeLabel.h"

IB_DESIGNABLE
@interface QTVertificationCodeInputView()<UITextFieldDelegate>
/// 用于获取键盘输入的内容，实际不显示
@property (nonatomic, strong) UITextField              *textField;
/// 用于显示验证码的Label
@property (nonatomic, strong) QTVertificationCodeLabel *label;

@end

@implementation QTVertificationCodeInputView

- (instancetype)initWithFrame:(CGRect)frame {
    
    if(self = [super initWithFrame:frame]) {
        [self initialize];
    }
    return self;
}


- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        [self initialize];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    // xcode8 初始化从xib中拿到宽高默认1000 1000，需要在这里重新获取
    self.label.frame = self.bounds;
}


- (void)initialize{
    
    //设置验证码/密码的位数默认为四位
    self.numberOfVertificationCode = 4;
    
    //调出键盘的textField
    self.textField = [[UITextField alloc] initWithFrame:self.bounds];
    
    //隐藏textField，通过点击IDVertificationCodeInputView使其成为第一响应者，来弹出键盘
    self.textField.hidden = YES;
    self.textField.keyboardType = UIKeyboardTypeNumberPad;
    self.textField.delegate = self;
    [self.textField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    
    // 将textField放到最后边
    [self insertSubview:self.textField atIndex:0];
    
    /*添加用于显示验证码/密码的label */
    self.label= [[QTVertificationCodeLabel alloc] initWithFrame:self.bounds];
    [self addSubview:self.label];
    self.label.spacing = 10;
    self.label.numberOfVertificationCode = self.numberOfVertificationCode;
    self.label.font = self.textField.font;
    self.label.lineWidth = 1;
    self.label.borderColor = [UIColor redColor];
    [self.label setNeedsLayout];
}

#pragma mark - UITextFieldDelegate
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{

    // 判断是不是“删除”字符
    if (string.length != 0) {// 不是“删除”字符
        // 判断验证码/密码的位数是否达到预定的位数
        if (textField.text.length < self.numberOfVertificationCode) {
            self.label.text = [textField.text stringByAppendingString:string];
            self.vertificationCode = self.label.text;
            return YES;
        } else {
            return NO;
        }
    } else { // 是“删除”字符
        self.label.text = [textField.text substringToIndex:textField.text.length - 1];
        _vertificationCode = self.label.text;
        return YES;
    }
}

#pragma mark - Action
- (void)textFieldDidChange:(UITextField *)textField{
    if (self.block) {
        self.block(textField);
    }
}

#pragma mark - 触摸响应
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
    [self.textField becomeFirstResponder];
}


#pragma mark - setter
- (void)setVertificationCode:(NSString *)vertificationCode{
    _vertificationCode = vertificationCode;
    self.label.text = vertificationCode;
}

-(void)setNumberOfVertificationCode:(NSInteger)numberOfVertificationCode{
    _numberOfVertificationCode = numberOfVertificationCode;
    self.label.numberOfVertificationCode = numberOfVertificationCode;
}

- (void)setSpacing:(CGFloat)spacing{
    _spacing = spacing;
    self.label.spacing = spacing;
}

- (void)setLineWidth:(CGFloat)lineWidth{
    _lineWidth = lineWidth;
    self.label.lineWidth = lineWidth;
}

- (void)setBorderColor:(UIColor *)borderColor{
    _borderColor = borderColor;
    self.label.borderColor = borderColor;
}

- (void)setCornerRadius:(CGFloat)cornerRadius{
    _cornerRadius = cornerRadius;
    self.label.cornerRadius = cornerRadius;
}

-(void)setFont:(UIFont *)font{
    _font = font;
    self.label.font = font;
}

-(void)setTextColor:(UIColor *)textColor{
    _textColor = textColor;
    self.label.textColor = textColor;
}




@end
