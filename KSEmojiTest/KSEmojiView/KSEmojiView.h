//
//  KSEmojiView.h
//  EmojiTestLY
//
//  Created by liyang@l2cplat.com on 16/2/26.
//  Copyright © 2016年 liyang@l2cplat.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FacialView.h"

@protocol KSEmojiViewDelegate

-(void)selectedEmoji:(NSString*)str;

-(void)selectedCustomBtn:(NSString *)str;

@end

@interface KSEmojiView : UIView

@property (weak,nonatomic) id delegate;

-(instancetype)initWithFrame:(CGRect)frame;

@end
