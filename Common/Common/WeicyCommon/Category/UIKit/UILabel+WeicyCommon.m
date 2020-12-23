//
//  UILabel+WeicyCommon.m
//  Common
//
//  Created by CityDoWCY on 2020/12/22.
//

#import "UILabel+WeicyCommon.h"

@implementation UILabel (WeicyCommon)

#pragma mark - 修改间距

- (void)weicy_changeLineSpace:(float)space {
    NSString *labelText = self.text;
    if (labelText.length > 0) {
        NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:labelText];
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        [paragraphStyle setLineSpacing:space];
        [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];
        self.attributedText = attributedString;
        [self sizeToFit];
    }
}

- (void)weicy_changeWordSpace:(float)space {
    NSString *labelText = self.text;
    if (labelText.length > 0) {
        NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:labelText attributes:@{NSKernAttributeName:@(space)}];
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];
        self.attributedText = attributedString;
        [self sizeToFit];
    }
}

/// 修改行间距、字间距
/// @param lineSpace 行间距
/// @param wordSpace 字间距
- (void)weicy_changeLineSpace:(float)lineSpace wordSpace:(float)wordSpace {
    NSString *labelText = self.text;
    if (labelText.length > 0) {
        NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:labelText attributes:@{NSKernAttributeName:@(wordSpace)}];
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        [paragraphStyle setLineSpacing:lineSpace];
        [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];
        self.attributedText = attributedString;
        [self sizeToFit];
    }
}

#pragma mark - 富文本改字体颜色
- (void)weicy_attributedStringTextFont:(UIFont *)font range:(NSRange)range {
    [self weicy_attributedStringTextAttributes:@{NSFontAttributeName:font} range:range];
}

- (void)weicy_attributedStringTextColor:(UIColor *)color range:(NSRange)range {
    [self weicy_attributedStringTextAttributes:@{NSForegroundColorAttributeName:color} range:range];
}

- (void)weicy_attributedStringTextFont:(UIFont *)font textColor:(UIColor*)color range:(NSRange)range {
    [self weicy_attributedStringTextAttributes:@{
                                NSFontAttributeName:font,
                                NSForegroundColorAttributeName:color}
    range:range];
}

- (void)weicy_attributedStringTextAttributes:(NSDictionary *)attributes range:(NSRange)range {
    if (self.attributedText.length == 0) {
        self.attributedText = [[NSAttributedString alloc] initWithString:self.text];
    }
    
    if (range.location < 0 || range.length+range.location > self.text.length) {
        return;
    }
    
    NSMutableAttributedString *mutableAttributedString = [[NSMutableAttributedString alloc] initWithAttributedString:self.attributedText];
    
    for (NSString *name in attributes){
        [mutableAttributedString addAttribute:name value:[attributes objectForKey:name] range:range];
    }
    self.attributedText = mutableAttributedString;
}

@end
