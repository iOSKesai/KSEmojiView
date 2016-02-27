//
//  KSEmojiView.m
//  EmojiTestLY
//
//  Created by liyang@l2cplat.com on 16/2/26.
//  Copyright © 2016年 liyang@l2cplat.com. All rights reserved.
//
#define SCREEN_W [UIScreen mainScreen].bounds.size.width
#define RGB(R,G,B,A) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]


#import "KSEmojiView.h"

@interface KSEmojiView()<facialViewDelegate,UIScrollViewDelegate>

@property (strong,nonatomic) UIScrollView *scrollView;

@property (strong,nonatomic) UIPageControl *pageControl;

@property (strong,nonatomic) UIButton *sendButton;

@end

@implementation KSEmojiView

-(instancetype)initWithFrame:(CGRect)frame
{
    if ([super initWithFrame:frame]) {
        
        [self makeView];
    }
    
    
    return self;
}

//初始化界面
-(void)makeView
{
    
    NSLog(@"%f---%f",self.bounds.size.width,self.bounds.size.height);
    _scrollView=[[UIScrollView alloc] initWithFrame:self.bounds];
    
    _scrollView.backgroundColor = RGB(245, 245, 245, 1);
    
    for (int i=0; i<9; i++) {
        FacialView *fview=[[FacialView alloc] initWithFrame:CGRectMake(12+SCREEN_W*i, 15, SCREEN_W-24, self.bounds.size.height-45)];
        [fview setBackgroundColor:[UIColor clearColor]];
        [fview loadFacialView:i size:CGSizeMake((SCREEN_W-24)/9, (self.bounds.size.height-45)/4)]; //修改一下
        fview.delegate=self;
        
        [_scrollView addSubview:fview];
    }
    
    [_scrollView setShowsVerticalScrollIndicator:NO];
    [_scrollView setShowsHorizontalScrollIndicator:NO];
    _scrollView.contentSize=CGSizeMake(SCREEN_W*9, self.bounds.size.height);
    _scrollView.pagingEnabled=YES;
    _scrollView.delegate=self;
    
    [self addSubview:_scrollView];
    
    _pageControl=[[UIPageControl alloc]initWithFrame:CGRectMake(SCREEN_W/2-75, self.bounds.size.height-30, 150, 30)];
    
    [_pageControl setCurrentPage:0];
    
    _pageControl.pageIndicatorTintColor=RGB(195, 179, 163, 1);
    
    _pageControl.currentPageIndicatorTintColor=RGB(132, 104, 77, 1);
    
    _pageControl.numberOfPages = 9;//指定页面个数
    
    [_pageControl setBackgroundColor:[UIColor clearColor]];
    
    [_pageControl addTarget:self action:@selector(changePage:)forControlEvents:UIControlEventValueChanged];
    
    [self addSubview:_pageControl];
    
    _sendButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [ _sendButton setTitle:@"发送" forState:UIControlStateNormal];
    
    [_sendButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    _sendButton.backgroundColor = self.tintColor;
    
    _sendButton.frame = CGRectMake(SCREEN_W-50-12, self.bounds.size.height-30, 50+12, 30);
    
    [_sendButton addTarget:self action:@selector(pressSendBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:_sendButton];
    


}

#pragma mark facialView delegate 点击表情键盘上的文字
-(void)selectedFacialView:(NSString*)str
{
    if([_delegate respondsToSelector:@selector(selectedEmoji:)])
    {
        [_delegate selectedEmoji:str];
    }
}

-(void)changePage:(UIPageControl *)pageControl
{
    NSInteger page = _pageControl.currentPage;//获取当前pagecontroll的值
    [_scrollView setContentOffset:CGPointMake(SCREEN_W * page, 0)];//根据pagecontroll的值来改变scrollview的滚动位置，以此切换到指定的页面

}

- (void)scrollViewDidScroll:(UIScrollView *)sender {
    int page = _scrollView.contentOffset.x / SCREEN_W;//通过滚动的偏移量来判断目前页面所对应的小白点
    _pageControl.currentPage = page;//pagecontroll响应值的变化
}

-(void)pressSendBtn:(UIButton *)btn
{
    [_delegate selectedCustomBtn:@"发送"];

}

@end
