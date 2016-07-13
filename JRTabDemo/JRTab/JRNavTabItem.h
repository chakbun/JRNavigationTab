//
//  JRNavTabItem.h
//  CCHealthCare
//
//  Created by cloudtech on 1/21/16.
//  Copyright © 2016 cloundCall. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, JRItemState) {
    JRItemStateNormal = 0,
    JRItemStateHightlight = 1,
};

@interface JRNavTabItem : UIView

@property (nonatomic, strong) NSString *title4Normal;

@property (nonatomic, strong) UIColor *titleLabelBackgroundColor;

@property (nonatomic, strong) UIColor *color4BottomLineHighlight;

@property (nonatomic, strong) UIColor *color4BottomLineNormal;

@property (nonatomic, strong) UIColor *color4Title4Highlight;

@property (nonatomic, strong) UIColor *color4Title4Normal;

@property (nonatomic, assign) NSInteger itemState;

@property (nonatomic, strong) void(^tapActionBlock)(NSInteger viewTag);


@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UIView *bottomView;

@end
