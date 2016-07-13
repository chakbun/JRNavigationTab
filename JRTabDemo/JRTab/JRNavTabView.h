//
//  JRNavTabView.h
//  CCHealthCare
//
//  Created by cloudtech on 1/21/16.
//  Copyright © 2016 cloundCall. All rights reserved.
//

#import <UIKit/UIKit.h>

#define TAG_ITEM_HEAD 100

@interface JRNavTabView : UIView

@property (nonatomic, strong) void(^tabSelectedBlock)(NSInteger index);

@property (nonatomic, strong) UIColor *surfaceColor;
@property (nonatomic, strong) UIColor *bottomColor;
@property (nonatomic, strong) UIColor *titleColor4Normal;
@property (nonatomic, assign) NSInteger seletedIndex;

- (instancetype)initWithItemsName:(NSArray *)names showBottomLine:(BOOL)show;

- (void)setTabTextColor:(UIColor *)color hightLightColor:(UIColor *)hlColor;

- (void)tapActionWithViewTag:(NSInteger)viewTag;

- (void)setTabText:(NSString *)text tabIndex:(NSInteger)index;

@end
