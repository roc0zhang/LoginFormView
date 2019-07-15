//
//  LoginFormView.m
//  ICOA
//
//  Created by 张岳鹏 on 2019/4/25.
//  Copyright © 2019 sasac. All rights reserved.
//

#import "LoginFormView.h"
#import <Masonry.h>

@interface LoginFormView()
@property (nonatomic, strong)CAShapeLayer *maskLayer;
@property (nonatomic, strong)UIBezierPath *borderPath;
@property (nonatomic, strong) UITextField * rightView;
@end
static CGFloat QuadCurve = 4;
static CGFloat GAPS = 1;
@implementation LoginFormView
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor colorWithWhite:1 alpha:0.3];
        self.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return self;
}

-(instancetype)initWithIcon:(NSString *)iconName options:(NSDictionary *)options{
    self = [self init];
    if (self) {
        _maskLayer = [CAShapeLayer layer];
        [self.layer setMask:_maskLayer];
        
        self.borderPath = [UIBezierPath bezierPath];
        [self setupIcon:iconName options:options];
        self.text = @"";
    }
    return self;
}
-(void)setText:(NSString *)text{
    if (_text == nil) {
        _text = @"";
    }
    _text = text;
    self.rightView.text = text;
}
- (void)layoutSubviews{
    
    [super layoutSubviews];
    
    // 遮罩层frame
    self.maskLayer.frame = self.bounds;
    
    // 设置path起点
    [self.borderPath moveToPoint:CGPointMake(0, QuadCurve)];
    // 左上角的圆角
    [self.borderPath addQuadCurveToPoint:CGPointMake(QuadCurve, 0) controlPoint:CGPointMake(0, 0)];
    //直线，到右上角,圆角
    [self.borderPath addLineToPoint:CGPointMake(self.bounds.size.width-QuadCurve, 0)];
    [self.borderPath addQuadCurveToPoint:CGPointMake(self.bounds.size.width, QuadCurve) controlPoint:CGPointMake(self.bounds.size.width, 0)];
    //直线，到右下角,圆角
    [self.borderPath addLineToPoint:CGPointMake(self.bounds.size.width, self.bounds.size.height-3)];
    [self.borderPath addQuadCurveToPoint:CGPointMake(self.bounds.size.width-QuadCurve, self.bounds.size.height) controlPoint:CGPointMake(self.bounds.size.width, self.bounds.size.height)];
    
    [self.borderPath addLineToPoint:CGPointMake(self.bounds.size.height+GAPS, self.bounds.size.height)];
    [self.borderPath addLineToPoint:CGPointMake(self.bounds.size.height+GAPS, 0)];
    [self.borderPath addLineToPoint:CGPointMake(self.bounds.size.height, 0)];
    [self.borderPath addLineToPoint:CGPointMake(self.bounds.size.height, self.bounds.size.height)];
    
    [self.borderPath addLineToPoint:CGPointMake(QuadCurve, self.bounds.size.height)];
    [self.borderPath addQuadCurveToPoint:CGPointMake(0, self.bounds.size.height-QuadCurve) controlPoint:CGPointMake(0, self.bounds.size.height)];
    
    //直线，回到起点
    [self.borderPath addLineToPoint:CGPointMake(0, QuadCurve)];
    
    // 将这个path赋值给maskLayer的path
    self.maskLayer.path = self.borderPath.CGPath;
}

-(void)setupIcon:(NSString *)icon options:(NSDictionary *)options{
    UIImage * image = [UIImage imageNamed:icon];
    UIImageView * imageView = [[UIImageView alloc] initWithImage:image];
    UIView * leftView = [[UIView alloc] init];
    [leftView addSubview:imageView];
    [self addSubview:leftView];
    
    [leftView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.mas_equalTo(self);
        make.width.mas_equalTo(self.mas_height);
    }];
    [imageView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(leftView);
    }];
    
    self.rightView = [[UITextField alloc] init];
    [self.rightView  setBackgroundColor:[UIColor clearColor]];
    [self.rightView  setTextColor:[UIColor whiteColor]];
    [self.rightView  setTintColor:[UIColor whiteColor]];
    self.rightView.autocorrectionType = UITextAutocorrectionTypeNo;
    self.rightView.autocapitalizationType = UITextAutocapitalizationTypeNone;
    NSAttributedString *attrString = [[NSAttributedString alloc] initWithString:options[@"placeholder"] attributes:@{NSForegroundColorAttributeName:[UIColor lightTextColor],NSFontAttributeName:self.rightView.font}];
    self.rightView.attributedPlaceholder = attrString;
//        [self.rightView  setPlaceholder:options[@"placeholder"]];
//        [self.rightView setValue:[UIColor lightTextColor] forKeyPath:@"_placeholderLabel.textColor"];
    if ([options[@"issecurity"] isEqual: @(YES)]) {
        [self.rightView  setSecureTextEntry:true];
    }
    [self.rightView  addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    [self addSubview:self.rightView ];
    [self.rightView  mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.right.bottom.mas_equalTo(self);
        make.left.mas_equalTo(leftView.mas_right).offset(10);
    }];
}
- (void) textFieldDidChange:(id) sender {
    UITextField *input = (UITextField *)sender;
    self.text = input.text;
}
@end
