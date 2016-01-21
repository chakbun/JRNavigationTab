//
//  JRNavTabView.m
//  CCHealthCare
//
//  Created by cloudtech on 1/21/16.
//  Copyright © 2016 cloundCall. All rights reserved.
//

#import "JRNavTabView.h"
#import "JRNavTabItem.h"

#define TAG_ITEM_HEAD 100

@implementation JRNavTabView

- (instancetype)initWithItemsName:(NSArray *)names {

    if (self = [super init]) {
        
        
        self.translatesAutoresizingMaskIntoConstraints = NO;
        
        for(int i = 0; i < names.count; i++) {
        
            NSString *name = names[i];
        
            JRNavTabItem *item = [[JRNavTabItem alloc] init];
            item.title4Normal = name;
            item.backgroundColor = [UIColor whiteColor];
            item.tag = TAG_ITEM_HEAD + i;
            [self addSubview:item];
            
            __weak __typeof(self) weakSelf = self;

            item.tapActionBlock = ^(NSInteger viewTag) {
                [weakSelf tapActionWithViewTag:viewTag];
            };
            
            item.translatesAutoresizingMaskIntoConstraints = NO;
        
            NSLayoutConstraint *topConstraint = [NSLayoutConstraint constraintWithItem:item attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.0 constant:0];
            
            NSLayoutConstraint *bottomConstraint = [NSLayoutConstraint constraintWithItem:item attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0];

            if (i == 0) {
                NSLayoutConstraint *leftConstraint = [NSLayoutConstraint constraintWithItem:item attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeading multiplier:1.0 constant:0];

                [self addConstraints:@[topConstraint,bottomConstraint,leftConstraint]];

            }else {
                
                JRNavTabItem *lastItem = [self viewWithTag:TAG_ITEM_HEAD + i - 1];

                NSLayoutConstraint *leftConstraint = [NSLayoutConstraint constraintWithItem:lastItem attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:item attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0];
                
                NSLayoutConstraint *widthConstraint = [NSLayoutConstraint constraintWithItem:lastItem attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:item attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0];

                [self addConstraints:@[topConstraint,bottomConstraint,leftConstraint,widthConstraint]];
                
                if(i == names.count - 1) {
                    NSLayoutConstraint *rightConstraint = [NSLayoutConstraint constraintWithItem:item attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:0];
                    [self addConstraint:rightConstraint];

                }
            }

        }
    }
    
    return self;
}

- (void)tapActionWithViewTag:(NSInteger)viewTag {
    
    for(UIView *view in [self subviews]) {
        if([view isKindOfClass:[JRNavTabItem class]]) {
            JRNavTabItem *item = (JRNavTabItem *)view;
            item.itemState = (view.tag == viewTag);
        }
    }
    
    if (self.tabSelectedBlock) {
        self.tabSelectedBlock(viewTag - TAG_ITEM_HEAD);
    }
}

#pragma mark - Public

- (void)setBottomColor:(UIColor *)bottomColor {
    _bottomColor = bottomColor;
    for(UIView *view in [self subviews]) {
        if([view isKindOfClass:[JRNavTabItem class]]) {
            JRNavTabItem *item = (JRNavTabItem *)view;
            item.color4BottomLineHighlight = bottomColor;
            item.color4Title4Highlight = bottomColor;
        }
    }
}

- (void)setSurfaceColor:(UIColor *)surfaceColor {
    _surfaceColor = surfaceColor;
    for(UIView *view in [self subviews]) {
        if([view isKindOfClass:[JRNavTabItem class]]) {
            JRNavTabItem *item = (JRNavTabItem *)view;
            item.titleLabelBackgroundColor = surfaceColor;
            item.color4BottomLineNormal = surfaceColor;
        }
    }
}
@end
