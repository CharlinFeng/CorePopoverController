//
//  CorePopoverController.h
//  CorePopoverController
//
//  Created by 冯成林 on 15/10/19.
//  Copyright © 2015年 冯成林. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "WYPopoverController.h"
#import "CorePPCModel.h"

@interface CorePopoverController : NSObject


+(void)showInVC:(UIViewController *)vc items:(NSArray<CorePPCModel *> *)items targetView:(UIView *)targetView selectedIndex:(NSInteger)selectedIndex width:(CGFloat)width itemH:(CGFloat)itemH d:(WYPopoverArrowDirection)d SelectedItemBlock:(void (^)(NSInteger i, CorePPCModel *ppcModel, NSObject *appModel))SelectedItemBlock;


+(void)showInVC:(UIViewController *)vc items:(NSArray<CorePPCModel *> *)items barbuttonItem:(UIBarButtonItem *)barbuttonItem selectedIndex:(NSInteger)selectedIndex width:(CGFloat)width itemH:(CGFloat)itemH d:(WYPopoverArrowDirection)d SelectedItemBlock:(void (^)(NSInteger i, CorePPCModel *ppcModel, NSObject *appModel))SelectedItemBlock;


@end
