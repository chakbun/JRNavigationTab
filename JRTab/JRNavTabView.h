//
//  JRNavTabView.h
//  CCHealthCare
//
//  Created by cloudtech on 1/21/16.
//  Copyright © 2016 cloundCall. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JRNavTabView : UIView

@property (nonatomic, strong) void(^tabSelectedBlock)(NSInteger index);

@property (nonatomic, strong) UIColor *surfaceColor;
@property (nonatomic, strong) UIColor *bottomColor;
@property (nonatomic, strong) UIColor *titleColor4Normal;

- (instancetype)initWithItemsName:(NSArray *)names;

@end
