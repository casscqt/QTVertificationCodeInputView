# QTVertificationCodeInputView
通用验证码View控件


![需求效果图.png](http://upload-images.jianshu.io/upload_images/132693-b6520d0f79104517.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/300)

特性：
1.方便类似于上图的验证码样式的二次开发。（边框，间距文字显示等经过了计算调整）
2.支持代码与xib使用。
3.支持xib中可视化显示效果


```
/// 验证码位数
@property(nonatomic, assign)  IBInspectable NSInteger numberOfVertificationCode;
/// 验证码，可以通过该属性拿到验证码内容
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
```

xib中使用：
直接拖一个view，修改xib中类名即可，可通过如图设置属性。
![xib内使用.png](http://upload-images.jianshu.io/upload_images/132693-71b27fc32f5214ca.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
代码中使用：
```
- (QTVertificationCodeInputView *)vertificationCodeInputView{
    if (!_vertificationCodeInputView) {
        _vertificationCodeInputView = [[QTVertificationCodeInputView alloc]initWithFrame:CGRectMake(30, 100, 300, 200)];
        _vertificationCodeInputView.numberOfVertificationCode = 4;
        _vertificationCodeInputView.lineWidth = 10;
        _vertificationCodeInputView.spacing = 10;
        _vertificationCodeInputView.cornerRadius = 5;
        _vertificationCodeInputView.backgroundColor = [UIColor orangeColor];
    }
    return _vertificationCodeInputView;
}
```
