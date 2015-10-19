//
//  FooterView.m
//  CorePopoverController
//
//  Created by 冯成林 on 15/10/19.
//  Copyright © 2015年 冯成林. All rights reserved.
//

#import "CorePPCFooterView.h"

@implementation CorePPCFooterView

+(instancetype)footerView{
    return [[NSBundle mainBundle] loadNibNamed:@"CorePPCFooterView" owner:nil options:nil].firstObject;
}
@end
