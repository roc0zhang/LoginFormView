//
//  TestView.m
//  TestView
//
//  Created by 张岳鹏 on 2019/7/15.
//  Copyright © 2019 张岳鹏. All rights reserved.
//

#import "TestView.h"

@implementation TestView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor redColor];
        UIButton *button = [[UIButton alloc]init];
        [button setTranslatesAutoresizingMaskIntoConstraints:NO];
        [button setTitle:@"ClickMe" forState:UIControlStateNormal];
        [button addTarget:self action:@selector(clickMe:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
        // 加约束
        NSLayoutConstraint *sContraint1 = [NSLayoutConstraint constraintWithItem:button attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0];
        NSLayoutConstraint *sContraint2 = [NSLayoutConstraint constraintWithItem:button attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0];
        NSLayoutConstraint *sConstraint3 = [NSLayoutConstraint constraintWithItem:button attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationGreaterThanOrEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:300];
        NSLayoutConstraint *sConstraint4 = [NSLayoutConstraint constraintWithItem:button attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationGreaterThanOrEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:200];
        
        NSArray *array2 = [NSArray arrayWithObjects:sContraint1, sContraint2,sConstraint3,sConstraint4, nil];
        [self addConstraints:array2];
        [self setNeedsUpdateConstraints];
        
    }
    return self;
}

-(IBAction)clickMe:(UIButton *)sender {
    self.btnBlock();
}
@end
