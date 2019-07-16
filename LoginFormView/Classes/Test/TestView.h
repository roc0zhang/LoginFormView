//
//  TestView.h
//  TestView
//
//  Created by 张岳鹏 on 2019/7/15.
//  Copyright © 2019 张岳鹏. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^ActionBlock)(void);

NS_ASSUME_NONNULL_BEGIN

@interface TestView : UIView
@property (nonatomic,weak) UIButton * testBtn;
@property ActionBlock btnBlock;
@end

NS_ASSUME_NONNULL_END
