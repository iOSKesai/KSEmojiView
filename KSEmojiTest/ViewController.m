//
//  ViewController.m
//  EmojiTestLY
//
//  Created by liyang@l2cplat.com on 16/2/25.
//  Copyright © 2016年 liyang@l2cplat.com. All rights reserved.
//

#import "ViewController.h"
#import "KSEmojiView.h"

#define SCREEN_W [UIScreen mainScreen].bounds.size.width
#define SCREEN_H [UIScreen mainScreen].bounds.size.height

@interface ViewController ()<KSEmojiViewDelegate>




@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    
    
    KSEmojiView *emoji = [[KSEmojiView alloc]initWithFrame:CGRectMake(0, SCREEN_H-230, SCREEN_W, 230)];
    
    emoji.delegate = self;
    
    emoji.backgroundColor = [UIColor yellowColor];
    
    [self.view addSubview:emoji];
    
}



#pragma mark delegate点击表情键盘上的文字
-(void)selectedEmoji:(NSString*)str
{
    
    
}

-(void)selectedCustomBtn:(NSString *)str
{
    
}







@end
