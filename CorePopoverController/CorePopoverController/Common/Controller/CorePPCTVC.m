//
//  TableViewController.m
//  CorePopoverController
//
//  Created by 冯成林 on 15/10/19.
//  Copyright © 2015年 冯成林. All rights reserved.
//

#import "CorePPCTVC.h"

#import "CorePPCFooterView.h"

@interface CorePPCTVC ()

@property (nonatomic,assign) BOOL isAddFooter;

@end

static CGFloat cellH = 40.0f;
static const CGFloat footerViewH = 45;

@implementation CorePPCTVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.scrollEnabled=NO;
    self.tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
}

//-(void)viewDidAppear:(BOOL)animated{
//    
//    [super viewDidAppear:animated];
//    
//    if (self.isAddFooter) {return;}
//    
//    [self footerViewPrepare];
//    
//    self.isAddFooter = YES;
//}


-(void)footerViewPrepare{
    
    CorePPCFooterView *footerView = [CorePPCFooterView footerView];

    footerView.frame = CGRectMake(0, 0, 0, footerViewH);
    
    self.tableView.tableFooterView = footerView;
}


-(void)setItems:(NSArray *)items{
    
    _items = items;
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
    });
    
    
    
}

-(void)setTotalWidth:(CGFloat)width itemH:(CGFloat)itemH{

    CGFloat w = width == 0 ? self.view.bounds.size.width : width;
    
    if(itemH != 0) cellH = itemH;
    
    self.preferredContentSize=CGSizeMake(w, _items.count * cellH);
    
    [self.tableView reloadData];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(self.items==nil) return 0;
    return self.items.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CorePPCCell *cell = [CorePPCCell dequeCell:tableView];
    
    cell.model=self.items[indexPath.row];
    
    cell.hideLine = indexPath.row == self.items.count - 1;
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return cellH;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if(self.SelectedItemBlock == nil) return;
    
    self.SelectedItemBlock(indexPath.row,self.items[indexPath.row]);
}

-(void)viewDidLayoutSubviews
{
    if ([self.tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [self.tableView setSeparatorInset:UIEdgeInsetsMake(0,0,0,0)];
    }
    
    if ([self.tableView respondsToSelector:@selector(setLayoutMargins:)]) {
        [self.tableView setLayoutMargins:UIEdgeInsetsMake(0,0,0,0)];
    }
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}

@end
