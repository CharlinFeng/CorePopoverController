//
//  TableViewController.h
//  CorePopoverController
//
//  Created by 冯成林 on 15/10/19.
//  Copyright © 2015年 冯成林. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CorePPCCell.h"
#import "WYPopoverController.h"

@interface CorePPCTVC : UITableViewController

@property (nonatomic,strong) NSArray *items;

@property (nonatomic,weak) WYPopoverController *ppc;

@property (nonatomic,copy) void (^SelectedItemBlock)(NSInteger i,CorePPCModel *model);

-(void)setTotalWidth:(CGFloat)width itemH:(CGFloat)itemH;



@end
