//
//  TableViewCell.m
//  CorePopoverController
//
//  Created by 冯成林 on 15/10/19.
//  Copyright © 2015年 冯成林. All rights reserved.
//

#import "CorePPCCell.h"

@interface CorePPCCell ()

@property (weak, nonatomic) IBOutlet UILabel *itemLabel;

@property (weak, nonatomic) IBOutlet UIView *lineView;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *lineViewHC;

@end

static const NSString *rid = @"CorePPCCell";

@implementation CorePPCCell

-(void)awakeFromNib{
    
    [super awakeFromNib];
    
    self.lineViewHC.constant = 0.5f;
}



+(instancetype)dequeCell:(UITableView *)tableView{
    
    if(tableView == nil) return [[NSBundle mainBundle] loadNibNamed:rid owner:nil options:nil].firstObject;
    
    CorePPCCell *cell = [tableView dequeueReusableCellWithIdentifier:rid];
    
    if (cell ==nil) cell = [[NSBundle mainBundle] loadNibNamed:rid owner:nil options:nil].firstObject;
    
    return cell;
}


-(void)setModel:(CorePPCModel *)model{
    
    NSAssert(model != nil, @"错误：模型不能为空");
    NSAssert([model isKindOfClass:[CorePPCModel class]], @"错误：模型必须为CorePPCModel类型");
    
    _model = model;
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        [self dataFill];
    });
}

-(void)dataFill{
    
    _itemLabel.text = _model.itemString;
}


-(void)setHideLine:(BOOL)hideLine{
    
    self.lineView.hidden = hideLine;
}

@end
