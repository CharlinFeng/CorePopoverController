//
//  CorePopoverController.m
//  CorePopoverController
//
//  Created by 冯成林 on 15/10/19.
//  Copyright © 2015年 冯成林. All rights reserved.
//

#import "CorePopoverController.h"
#import "CorePPCTVC.h"

@implementation CorePopoverController


+(void)initialize{
    
    UIColor *greenColor = [UIColor colorWithRed:26.f/255.f green:188.f/255.f blue:156.f/255.f alpha:1];
    
    [WYPopoverController setDefaultTheme:[WYPopoverTheme theme]];
    
    WYPopoverBackgroundView *popoverAppearance = [WYPopoverBackgroundView appearance];

    [popoverAppearance setOuterCornerRadius:4];
    [popoverAppearance setOuterShadowBlurRadius:0];
    [popoverAppearance setOuterShadowColor:[UIColor clearColor]];
    [popoverAppearance setOuterShadowOffset:CGSizeMake(0, 0)];
    
    [popoverAppearance setGlossShadowColor:[UIColor clearColor]];
    [popoverAppearance setGlossShadowOffset:CGSizeMake(0, 0)];
    
    [popoverAppearance setBorderWidth:0];
    [popoverAppearance setArrowHeight:6];
    [popoverAppearance setArrowBase:10];
    
    [popoverAppearance setInnerCornerRadius:4];
    [popoverAppearance setInnerShadowBlurRadius:0];
    [popoverAppearance setInnerShadowColor:[UIColor clearColor]];
    [popoverAppearance setInnerShadowOffset:CGSizeMake(0, 0)];
    
    [popoverAppearance setFillTopColor:[UIColor whiteColor]];
    [popoverAppearance setFillBottomColor:[UIColor whiteColor]];
//    [popoverAppearance setOuterStrokeColor:[UIColor whiteColor]];
//    [popoverAppearance setInnerStrokeColor:greenColor];

}


+(void)showInVC:(UIViewController *)vc contentVC:(UIViewController *)contentVC target:(id)target d:(WYPopoverArrowDirection)d{
    
    WYPopoverController *ppc = [[WYPopoverController alloc] initWithContentViewController:contentVC];
    
    [vc addChildViewController:ppc];
    
    if([contentVC isKindOfClass:[CorePPCTVC class]]){
        CorePPCTVC *ppcTVC =(CorePPCTVC *) contentVC;
        ppcTVC.ppc = ppc;
    }
    
    if([target isKindOfClass:[UIView class]]) {
        UIView *view = (UIView *)target;
       [ppc presentPopoverFromRect:view.bounds inView:view permittedArrowDirections:d animated:YES options:WYPopoverAnimationOptionFadeWithScale completion:nil];
    }else{
        
        UIBarButtonItem *item = (UIBarButtonItem *)target;
        
        [ppc presentPopoverFromBarButtonItem:item permittedArrowDirections:d animated:YES options:WYPopoverAnimationOptionFadeWithScale completion:nil];
    }
    
    
}

+(void)showInVC:(UIViewController *)vc items:(NSArray<CorePPCModel *> *)items targetView:(UIView *)targetView width:(CGFloat)width itemH:(CGFloat)itemH d:(WYPopoverArrowDirection)d SelectedItemBlock:(void (^)(NSInteger i, CorePPCModel *ppcModel, NSObject *appModel))SelectedItemBlock{
    
    CorePPCTVC *ppcTVC = [[CorePPCTVC alloc] init];
    
    ppcTVC.items = items;
    
    [ppcTVC setTotalWidth:width itemH:itemH];
    
    ppcTVC.SelectedItemBlock = ^(NSInteger i,CorePPCModel *m, NSObject *appModel){
    
        [ppcTVC.ppc dismissPopoverAnimated:YES options:WYPopoverAnimationOptionFadeWithScale];
        
        if(SelectedItemBlock != nil) SelectedItemBlock(i,m,appModel);
    };
    
    [CorePopoverController showInVC:vc contentVC:ppcTVC target:targetView d:d];
}

+(void)showInVC:(UIViewController *)vc items:(NSArray<CorePPCModel *> *)items barbuttonItem:(UIBarButtonItem *)barbuttonItem width:(CGFloat)width itemH:(CGFloat)itemH d:(WYPopoverArrowDirection)d SelectedItemBlock:(void (^)(NSInteger i, CorePPCModel *ppcModel, NSObject *appModel))SelectedItemBlock{
    
    CorePPCTVC *ppcTVC = [[CorePPCTVC alloc] init];
    
    ppcTVC.items = items;
    
    [ppcTVC setTotalWidth:width itemH:itemH];
    
    ppcTVC.SelectedItemBlock = ^(NSInteger i,CorePPCModel *m, NSObject *appModel){
        
        [ppcTVC.ppc dismissPopoverAnimated:YES options:WYPopoverAnimationOptionFadeWithScale];
        
        if(SelectedItemBlock != nil) SelectedItemBlock(i,m,appModel);
    };
    
    [CorePopoverController showInVC:vc contentVC:ppcTVC target:barbuttonItem d:d];
    
}

@end
