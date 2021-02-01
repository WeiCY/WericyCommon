//
//  WeicyGuideView.m
//  Common
//
//  Created by CityDoWCY on 2021/1/29.
//

#import "WeicyGuideView.h"

@interface WeicyGuideView ()<UIScrollViewDelegate>

@property (nonatomic, strong) NSArray <NSString *> * imageNames;
@property (nonatomic, strong) NSArray <UIImageView *> * imageViews;

@property (nonatomic, strong) UIScrollView * scrollView;
@property (nonatomic, strong) UIPageControl * pageControl;

@end

@implementation WeicyGuideView

+ (instancetype)guideViewWithImageNames:(NSArray<NSString *> *)imageNames
{
    return [[self alloc] initWithImageNames:imageNames];
}

- (instancetype)initWithImageNames:(NSArray<NSString *> *)imageNames
{
    if (self = [super initWithFrame:[UIScreen mainScreen].bounds])
    {
        self.imageNames = imageNames;
        [self setup];
    }
    return self;
}

- (void)setup
{
    self.backgroundColor = [UIColor clearColor];
    self.imageViewsContentMode = UIViewContentModeScaleAspectFill;
    
    [self addSubview:self.scrollView];
    [self addSubview:self.pageControl];
    
    __weak typeof(self) weakSelf = self;
    [self.imageViews enumerateObjectsUsingBlock:^(UIImageView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [weakSelf.scrollView addSubview:obj];
    }];
    [self layoutSubviews];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGRect frame = self.bounds;
    self.scrollView.frame = frame;
    self.scrollView.contentSize = CGSizeMake(CGRectGetWidth(frame) * self.imageNames.count, CGRectGetHeight(frame));
    self.pageControl.frame = CGRectMake(0, CGRectGetHeight(frame) - 40, CGRectGetWidth(frame), 20);
    [self.imageViews enumerateObjectsUsingBlock:^(UIImageView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        obj.frame = CGRectMake(CGRectGetWidth(frame) * idx, 0, CGRectGetWidth(frame), CGRectGetHeight(frame));
    }];
}

#pragma mark - setter
- (void)setPageControlHidden:(BOOL)pageControlHidden
{
    self.pageControl.hidden = pageControlHidden;
}

- (void)setImageViewsContentMode:(UIViewContentMode)imageViewsContentMode
{
    if (_imageViewsContentMode != imageViewsContentMode) {
        _imageViewsContentMode = imageViewsContentMode;
        [self.imageViews enumerateObjectsUsingBlock:^(UIImageView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            obj.contentMode = _imageViewsContentMode;
        }];
    }
}

#pragma mark - event
- (void)touchesLastImage
{
    __weak typeof(self) weakSelf = self;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if ([weakSelf.delegate respondsToSelector:@selector(guideViewWillDisapper:)]) {
            [weakSelf.delegate guideViewWillDisapper:self];
        }
        [UIView animateWithDuration:1.0f animations:^{
            weakSelf.alpha = 0.0;
        } completion:^(BOOL finished) {
            if (finished) {
                [weakSelf removeFromSuperview];
                if ([weakSelf.delegate respondsToSelector:@selector(guideViewDidDisapper:)]) {
                    [weakSelf.delegate guideViewDidDisapper:self];
                }
            }
        }];
    });
}

#pragma mark - ScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat pageWidth = CGRectGetWidth(self.bounds);
    int page = floor((self.scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    
    self.pageControl.currentPage = page;
    
    if ((self.scrollView.contentOffset.x > ((self.imageNames.count - 1) * self.frame.size.width + 50))) {
        [self touchesLastImage];
    }
}

#pragma mark - lazy
- (UIScrollView *)scrollView
{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectZero];

        _scrollView.backgroundColor = [UIColor clearColor];
        _scrollView.pagingEnabled = YES;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.scrollsToTop = NO;
        _scrollView.delegate = self;
        _scrollView.bounces = YES;
    }
    return _scrollView;
}

- (UIPageControl *)pageControl
{
    if (!_pageControl) {
        _pageControl = [[UIPageControl alloc] initWithFrame:CGRectZero];
        _pageControl.backgroundColor = [UIColor clearColor];
        _pageControl.numberOfPages = self.imageNames.count;
        _pageControl.userInteractionEnabled = NO;
        _pageControl.currentPage = 0;
        _pageControl.backgroundColor = [UIColor clearColor];
    }
    return _pageControl;
}

- (NSArray<UIImageView *> *)imageViews
{
    if (!_imageViews) {
        NSMutableArray * array = [NSMutableArray arrayWithCapacity:self.imageNames.count];
        for (int i = 0; i < self.imageNames.count; i++)
        {
            UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectZero];

            imageView.backgroundColor = [UIColor whiteColor];
            imageView.contentMode = self.imageViewsContentMode;
            imageView.image = [UIImage imageNamed:[self.imageNames objectAtIndex:i]];
            imageView.clipsToBounds = YES;

            [array addObject:imageView];

            if (i == self.imageNames.count - 1) {
                imageView.userInteractionEnabled = YES;
                UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(touchesLastImage)];
                [imageView addGestureRecognizer:tap];
            }
        }
        _imageViews = array;
    }
    return _imageViews;
}

- (void)dealloc
{
    NSLog(@"CityDoGuideView release");
}

@end
