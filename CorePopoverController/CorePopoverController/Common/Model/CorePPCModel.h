//
//  CorePPCModel.h
//  CorePopoverController
//
//  Created by 冯成林 on 15/10/19.
//  Copyright © 2015年 冯成林. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CorePPCModel : NSObject

@property (nonatomic,copy) NSString *itemString;

+(instancetype)modelWithItemString:(NSString *)itemString;

@end
