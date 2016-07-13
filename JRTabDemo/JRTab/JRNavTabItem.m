//
//  JRNavTabItem.m
//  CCHealthCare
//
//  Created by cloudtech on 1/21/16.
//  Copyright © 2016 cloundCall. All rights reserved.
//

#import "JRNavTabItem.h"

@interface JRNavTabItem ()

@end

@implementation JRNavTabItem

- (instancetype)init {
    if (self = [super init]) {
        
        _itemState = JRItemStateNormal;
        
        _titleLabel = [UILabel new];
        _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.adjustsFontSizeToFitWidth = YES;
        _titleLabel.font = [UIFont systemFontOfSize:13];
        _titleLabel.minimumScaleFactor = 8;
        
        _titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
        
        [self addSubview:_titleLabel];
        
        CGFloat bottomViewHeight = 2;
        
        NSLayoutConstraint *topConstraint4Title = [NSLayoutConstraint constraintWithItem:_titleLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.0 constant:0];
        
        NSLayoutConstraint *leftConstraint4Title = [NSLayoutConstraint constraintWithItem:_titleLabel attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeading multiplier:1.0 constant:0];
        
        NSLayoutConstraint *rightConstraint4Title = [NSLayoutConstraint constraintWithItem:_titleLabel attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:0];
        
        NSLayoutConstraint *bottomConstraint4Title = [NSLayoutConstraint constraintWithItem:_titleLabel attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0];
        
        [self addConstraints:@[topConstraint4Title,leftConstraint4Title,rightConstraint4Title,bottomConstraint4Title]];
        
        _bottomView = [UIView new];
        _bottomView.translatesAutoresizingMaskIntoConstraints = NO;
        
        [self addSubview:_bottomView];
        
        NSLayoutConstraint *leftConstraint4BView = [NSLayoutConstraint constraintWithItem:_bottomView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeading multiplier:1.0 constant:0];
        
        NSLayoutConstraint *rightConstraint4BView = [NSLayoutConstraint constraintWithItem:_bottomView attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:0];
        
        NSLayoutConstraint *bottomConstraint4BView = [NSLayoutConstraint constraintWithItem:_bottomView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0];
        
        NSLayoutConstraint *heightConstraint = [NSLayoutConstraint constraintWithItem:_bottomView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:bottomViewHeight];
        [_bottomView addConstraint:heightConstraint];
        
        [self addConstraints:@[leftConstraint4BView,rightConstraint4BView,bottomConstraint4BView]];
        
        // tap action
        UITapGestureRecognizer *tapGesure = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesture:)];
        [self addGestureRecognizer:tapGesure];
    }
    return self;
}

#pragma mark - Private

- (void)tapGesture:(UITapGestureRecognizer *)gesture {
    if (self.tapActionBlock) {
        self.tapActionBlock(self.tag);
    }
}

#pragma mark - Public

- (void)setTitleLabelBackgroundColor:(UIColor *)titleLabelBackgroundColor {
    _titleLabelBackgroundColor = titleLabelBackgroundColor;
    self.titleLabel.backgroundColor = titleLabelBackgroundColor;
}

- (void)setTitle4Normal:(NSString *)title4Normal {
    _title4Normal = title4Normal;
    self.titleLabel.text = title4Normal;
}

- (void)setItemState:(NSInteger)itemState {
    
    _itemState = itemState;
    
    switch (_itemState) {
        case JRItemStateNormal:
            self.bottomView.backgroundColor = self.color4BottomLineNormal?:[UIColor whiteColor];
            self.titleLabel.textColor = self.color4Title4Normal?:[UIColor blackColor];
            self.titleLabel.font = [UIFont systemFontOfSize:13];
            break;
        case JRItemStateHightlight:
            self.bottomView.backgroundColor = self.color4BottomLineHighlight?:[UIColor blackColor];
            self.titleLabel.textColor = self.color4Title4Highlight?:[UIColor blackColor];
            self.titleLabel.font = [UIFont systemFontOfSize:16];
            break;
        default:
            break;
    }
}


@end
