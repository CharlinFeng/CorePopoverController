//
//  ViewController.m
//  CorePopoverController
//
//  Created by 冯成林 on 15/10/19.
//  Copyright © 2015年 冯成林. All rights reserved.
//

#import "ViewController.h"
#import "WYPopoverController.h"
#import "CorePopoverController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (IBAction)clickBtn:(UIButton *)sender {
    
    CorePPCModel *m1= [CorePPCModel modelWithItemImgName:nil itemString:@"成都" appModel:@"m0"];
    CorePPCModel *m2= [CorePPCModel modelWithItemImgName:nil itemString:@"北京" appModel:@"m1"];
    CorePPCModel *m3= [CorePPCModel modelWithItemImgName:nil itemString:@"上海" appModel:@"m2"];
    CorePPCModel *m4= [CorePPCModel modelWithItemImgName:nil itemString:@"广州" appModel:@"m3"];
    
    
    NSArray<CorePPCModel *> *arr = @[m1,m2,m3,m4];
    
    
    [CorePopoverController showInVC:self items:arr targetView:self.navigationItem.rightBarButtonItem selectedIndex:1 width:100 itemH:40 d:WYPopoverArrowDirectionAny SelectedItemBlock:^(NSInteger i, CorePPCModel *itemModel, NSObject *appModel) {
        
        NSLog(@"%@,%@,%@",@(i),itemModel.itemString,appModel);
        
    }];
    
    
}




@end
