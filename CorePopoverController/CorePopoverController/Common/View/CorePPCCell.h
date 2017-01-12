//
//  TableViewCell.h
//  CorePopoverController
//
//  Created by 冯成林 on 15/10/19.
//  Copyright © 2015年 冯成林. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CorePPCModel.h"

@interface CorePPCCell : UITableViewCell

@property (nonatomic,strong) CorePPCModel *model;

@property (nonatomic,assign) BOOL hideLine;


@property (weak, nonatomic) IBOutlet UILabel *itemLabel;

+(instancetype)dequeCell:(UITableView *)tableView;


@end
