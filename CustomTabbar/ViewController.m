//
//  ViewController.m
//  CustomTabbar
//
//  Created by SnowDream on 2019/1/1.
//  Copyright © 2019年 Interview. All rights reserved.
//

#import "ViewController.h"
#import "CustomTabbar.h"

@interface ViewController ()<CustomBarDelegate>
@property (weak, nonatomic) IBOutlet CustomTabbar *bar;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.bar.delegate = self;
    self.bar.color = [UIColor lightGrayColor];
    self.bar.selectedColor = [UIColor redColor];
    
    NSMutableArray *mulItems = [[NSMutableArray alloc] initWithCapacity:5];
    
    for (int i = 0; i < 5; i++) {
        CustomItem *item = [[CustomItem alloc] init];
        item.title = [NSString stringWithFormat:@"标题%d", i];
        item.itemTag = i;

        [mulItems addObject:item];
    }
    
    self.bar.items = mulItems;
    self.bar.selectTags = [NSArray array];
}

- (void)didSelectItem:(CustomItem *)item selectedTags:(NSArray<NSNumber *> *)tags {

}

@end
