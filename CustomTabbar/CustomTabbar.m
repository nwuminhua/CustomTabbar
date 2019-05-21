//
//  CustomTabbar.m
//  CustomTabbar
//
//  Created by SnowDream on 2019/1/1.
//  Copyright © 2019年 Interview. All rights reserved.
//

#import "CustomTabbar.h"

@implementation CustomItem

@end

@interface CustomTabbar ()
@property (nonatomic, strong) NSArray *tabBtnArr;
@end

@implementation CustomTabbar

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        //
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        //
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


- (void)setItems:(NSArray<CustomItem *> *)items {
    NSMutableArray *mulBtnArr = [[NSMutableArray alloc] initWithCapacity:items.count];
    for (int i = 0; i < items.count; i++) {
        CustomItem *item = items[i];
        UIButton *btn = [[UIButton alloc] init];
        [self addSubview:btn];
        btn.tag = i;
        [btn setTitle:item.title forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(tabBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
        [mulBtnArr addObject:btn];
    }
    self.tabBtnArr = mulBtnArr;
    
    //添加自动布局约束
    // 实现masonry水平固定间隔方法
    [self.tabBtnArr mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:0 leadSpacing:0 tailSpacing:0];
    
    // 设置array的垂直方向的约束
    [self.tabBtnArr mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).with.offset(0);
        make.bottom.equalTo(self.mas_bottom).with.offset(0);
    }];
}


#pragma mark --
- (void)tabBtnPressed:(id)sender {
    UIButton *btn = (UIButton *)sender;
    CustomItem *item = self.items[btn.tag];
    if ([_delegate respondsToSelector:@selector(didSelectItem:selectedTags:)]) {
        [_delegate didSelectItem:item selectedTags:self.selectTags];
    }
}


- (void)setSelectTags:(NSArray<NSNumber *> *)selectTags {
    _selectTags = selectTags;
    for (UIButton *btn in self.tabBtnArr) {
        //
        NSInteger exist = [selectTags indexOfObject:@(btn.tag)];
        CustomItem *item = self.items[btn.tag];
        if (exist == NSNotFound) {
            //未选中
            [btn setTitleColor:_color forState:UIControlStateNormal];
            [btn setImage:item.image forState:UIControlStateNormal];
        }else {
            //选中
            [btn setTitleColor:_selectedColor forState:UIControlStateNormal];
            [btn setImage:item.selectImage forState:UIControlStateNormal];
        }
    }
}

@end
