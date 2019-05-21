//
//  CustomTabbar.h
//  CustomTabbar
//
//  Created by SnowDream on 2019/1/1.
//  Copyright © 2019年 Interview. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Masonry.h"

NS_ASSUME_NONNULL_BEGIN

@interface CustomItem : NSObject
@property(nonatomic, strong) UIImage *image;
@property(nonatomic, strong) UIImage *selectImage;
@property(nonatomic, copy) NSString *title;
@property(nonatomic) NSInteger itemTag;
@end

@protocol CustomBarDelegate <NSObject>
@required
- (void)didSelectItem:(CustomItem *)item selectedTags:(NSArray<NSNumber *> *)tags;

@end

@interface CustomTabbar : UIView

@property (nonatomic, strong) NSArray<CustomItem *> *items;
@property (nonatomic, strong) UIColor *color;
@property (nonatomic, strong) UIColor *selectedColor;
@property (nonatomic, weak) id<CustomBarDelegate> delegate;

@property (nonatomic, strong) NSArray<NSNumber *> *selectTags;

@end

NS_ASSUME_NONNULL_END
