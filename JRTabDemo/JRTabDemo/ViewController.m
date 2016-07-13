//
//  ViewController.m
//  JRTabDemo
//
//  Created by Jaben on 16/7/13.
//  Copyright © 2016年 chakbun. All rights reserved.
//

#import "ViewController.h"
#import "JRNavTabView.h"

static NSString * const ANIMALS[] = {@"elephant",@"bear",@"tiger",@"lion",@"rabbit",@"parrot"};

static NSString * const FRUITS[] = {@"apple",@"banana",@"orange",@"lemon",@"peach",@"pear"};


@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *contentTableView;

@property (nonatomic, assign) NSInteger tableViewType; //0->animals 1:fruit

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.contentTableView.tableFooterView = [UIView new];
    self.contentTableView.delegate = self;
    self.contentTableView.dataSource = self;
    
    JRNavTabView *tabView = [[JRNavTabView alloc] initWithItemsName:@[@"Animals",@"Fruits"] showBottomLine:YES];
    [self.view addSubview:tabView];
    
    NSLayoutConstraint *topConstraint = [NSLayoutConstraint constraintWithItem:tabView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:64];
    NSLayoutConstraint *leftConstraint = [NSLayoutConstraint constraintWithItem:tabView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1.0 constant:0];
    NSLayoutConstraint *rightConstraint = [NSLayoutConstraint constraintWithItem:tabView attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:0];

    NSLayoutConstraint *heightConstraint = [NSLayoutConstraint constraintWithItem:tabView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:44];
    
    [tabView addConstraint:heightConstraint];
    [self.view addConstraints:@[topConstraint,leftConstraint,rightConstraint]];

    __weak __typeof(self) weakSelf = self;

    tabView.surfaceColor = [UIColor whiteColor];
    tabView.bottomColor = [UIColor redColor];
    tabView.seletedIndex = 0;
    tabView.tabSelectedBlock = ^(NSInteger index) {
        weakSelf.tableViewType = index;
        [weakSelf.contentTableView reloadData];
    };
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - TabelView DataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.tableViewType == 0) {
        return (sizeof(ANIMALS) / sizeof(ANIMALS[0]));
    }else if(self.tableViewType == 1) {
        return (sizeof(FRUITS) / sizeof(FRUITS[0]));
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * const REUSE_CELL_ID = @"reuseID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:REUSE_CELL_ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:REUSE_CELL_ID];
    }
    
    NSString *title = @"";
    if (self.tableViewType == 0) {
        title = ANIMALS[indexPath.row];
    }else if(self.tableViewType == 1) {
        title = FRUITS[indexPath.row];
    }
    cell.textLabel.text = title;
    return cell;
}

@end
