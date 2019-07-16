//
//  LoginFormView.h
//  ICOA
//
//  Created by 张岳鹏 on 2019/4/25.
//  Copyright © 2019 sasac. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LoginFormView : UIView
@property(nonatomic,strong)NSString *text;
-(instancetype)initWithIcon:(NSString *)iconName options:(NSDictionary *)options;
@end

NS_ASSUME_NONNULL_END
