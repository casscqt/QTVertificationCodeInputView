//
//  QTVertificationCodeLabel.h
//  QTVertificationCodeInputView
//
//  Created by Cass on 16/11/18.
//  Copyright © 2016年 Cass. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QTVertificationCodeLabel : UILabel

/// 验证码位数
@property (nonatomic, assign) NSInteger numberOfVertificationCode;
/// 间距
@property (nonatomic, assign) CGFloat   spacing;
/// 边框线宽度
@property (nonatomic, assign) CGFloat   lineWidth;
/// 边框颜色
@property (nonatomic, strong) UIColor   *borderColor;
/// 边框圆角
@property (nonatomic, assign) CGFloat   cornerRadius;

@end
