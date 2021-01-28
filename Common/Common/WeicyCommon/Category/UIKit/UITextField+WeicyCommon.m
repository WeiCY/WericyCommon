//
//  UITextField+WeicyCommon.m
//  Common
//
//  Created by CityDoWCY on 2021/1/28.
//

#import "UITextField+WeicyCommon.h"
#import <objc/runtime.h>

#define PlaceholderColorKey     @"placeholderColorKey"
#define PlaceholderFontKey      @"placeholderFontKey"
#define TextFiledLimitCountKey  @"textFiledLimitCountKey"

@implementation UITextField (WeicyCommon)

- (UIColor *)placeholderColor {
    return objc_getAssociatedObject(self, PlaceholderColorKey);
}

- (void)setPlaceholderColor:(UIColor *)placeholderColor {
    [self willChangeValueForKey:@"_placeholderColor"];
    objc_setAssociatedObject(self, PlaceholderColorKey, placeholderColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self changePlaceholderColor:placeholderColor placeholderFont:self.font];
    [self didChangeValueForKey:@"_placeholderColor"];
}

- (UIFont *)placegolderFont {
    return objc_getAssociatedObject(self, PlaceholderFontKey);
}

- (void)setPlacegolderFont:(UIFont *)placegolderFont {
    [self willChangeValueForKey:@"_placegolderFont"];
    objc_setAssociatedObject(self, PlaceholderFontKey, placegolderFont, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self changePlaceholderColor:nil placeholderFont:placegolderFont];
    [self didChangeValueForKey:@"_placegolderFont"];
}

- (NSInteger)limitCount {
    return [objc_getAssociatedObject(self, TextFiledLimitCountKey) integerValue];
}

- (void)setLimitCount:(NSInteger)limitCount {
    [self willChangeValueForKey:@"_limitCount"];
    objc_setAssociatedObject(self, TextFiledLimitCountKey, @(limitCount), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (limitCount > 0) {
        [self addTarget:self action:@selector(textfieldChange) forControlEvents:UIControlEventValueChanged];
        [self addTarget:self action:@selector(textfieldChange) forControlEvents:UIControlEventEditingChanged];
    }
    [self didChangeValueForKey:@"_limitCount"];
}

- (void)changePlaceholderColor:(UIColor *)placeholderColor placeholderFont:(UIFont *)placeholderFont {
    NSString *holderText = self.placeholder;
    NSMutableAttributedString *placeholder = [[NSMutableAttributedString alloc] initWithString:holderText];
    if (placeholderColor) {
        [placeholder addAttribute:NSForegroundColorAttributeName value:placeholderColor range:NSMakeRange(0, holderText.length)];
    }
    [placeholder addAttribute:NSFontAttributeName value:placeholderFont range:NSMakeRange(0, holderText.length)];
    self.attributedPlaceholder = placeholder;
}

- (void)textfieldChange {
    if (self.text.length > self.limitCount) {
        UITextRange *markedRange = [self markedTextRange];
        if (markedRange) {
            return;
        }
        NSRange range = [self.text rangeOfComposedCharacterSequenceAtIndex:self.limitCount];
        self.text = [self.text substringToIndex:range.location];
    }
}

@end
