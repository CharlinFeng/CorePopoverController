//
//  CorePPCModel.m
//  CorePopoverController
//
//  Created by 冯成林 on 15/10/19.
//  Copyright © 2015年 冯成林. All rights reserved.
//

#import "CorePPCModel.h"

@implementation CorePPCModel

+(instancetype)modelWithItemImgName:(NSString *)imgName itemString:(NSString *)itemString;{
    
    CorePPCModel *model = [[CorePPCModel alloc] init];
    
    model.imgName = imgName;
    model.itemString = itemString;
    
    return model;
}

@end
