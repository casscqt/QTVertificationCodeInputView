//
//  ViewController.m
//  QTVertificationCodeInputView
//
//  Created by Cass on 16/11/18.
//  Copyright © 2016年 Cass. All rights reserved.
//

#import "ViewController.h"
#import "QTVertificationCodeInputView.h"


@interface ViewController ()

@property (weak, nonatomic) IBOutlet QTVertificationCodeInputView *vertificationCodeInputView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    [self.view addSubview:self.vertificationCodeInputView];
    
    self.vertificationCodeInputView.block = ^(UITextField *textField){
        NSLog(@"当前内容：%@",textField.text);
    };
    
}

#pragma mark - getter
//- (QTVertificationCodeInputView *)vertificationCodeInputView{
//    if (!_vertificationCodeInputView) {
//        _vertificationCodeInputView = [[QTVertificationCodeInputView alloc]initWithFrame:CGRectMake(30, 100, 300, 200)];
//        _vertificationCodeInputView.numberOfVertificationCode = 4;
//        _vertificationCodeInputView.lineWidth = 10;
//        _vertificationCodeInputView.spacing = 10;
//        _vertificationCodeInputView.cornerRadius = 5;
//        _vertificationCodeInputView.backgroundColor = [UIColor orangeColor];
//    }
//    return _vertificationCodeInputView;
//}


@end
