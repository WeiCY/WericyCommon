//
//  UIScrollView+WeicyCommon.m
//  Common
//
//  Created by CityDoWCY on 2020/12/10.
//

#import "UIScrollView+WeicyCommon.h"

@implementation UIScrollView (WeicyCommon)

- (void)weicy_scrollToTop {
    [self weicy_scrollToTopAnimated:YES];
}

- (void)weicy_scrollToBottom {
    [self weicy_scrollToBottomAnimated:YES];
}

- (void)weicy_scrollToLeft {
    [self weicy_scrollToLeftAnimated:YES];
}

- (void)weicy_scrollToRight {
    [self weicy_scrollToRightAnimated:YES];
}

- (void)weicy_scrollToTopAnimated:(BOOL)animated {
    CGPoint off = self.contentOffset;
    off.y = 0 - self.contentInset.top;
    [self setContentOffset:off animated:animated];
}

- (void)weicy_scrollToBottomAnimated:(BOOL)animated {
    CGPoint off = self.contentOffset;
    off.y = self.contentSize.height - self.bounds.size.height + self.contentInset.bottom;
    [self setContentOffset:off animated:animated];
}

- (void)weicy_scrollToLeftAnimated:(BOOL)animated {
    CGPoint off = self.contentOffset;
    off.x = 0 - self.contentInset.left;
    [self setContentOffset:off animated:animated];
}

- (void)weicy_scrollToRightAnimated:(BOOL)animated {
    CGPoint off = self.contentOffset;
    off.x = self.contentSize.width - self.bounds.size.width + self.contentInset.right;
    [self setContentOffset:off animated:animated];
}


@end
