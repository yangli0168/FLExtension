//
//  UITextField+FLExtension.m
//  FLExtensionDemo
//
//  Created by 杨利 on 2018/9/3.
//  Copyright © 2018年 yangli. All rights reserved.
//

#import "UITextField+FLExtension.h"
#import <objc/runtime.h>

static const void *FLTextFieldMaxLenghtKey = &FLTextFieldMaxLenghtKey;
static const void *FLTextFieldAddChangedKey = &FLTextFieldAddChangedKey;

@implementation UITextField (FLExtension)

-(void)setKMaxLength:(NSInteger)kMaxLength
{
    objc_setAssociatedObject(self, &FLTextFieldMaxLenghtKey, [NSNumber numberWithInteger:kMaxLength], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    BOOL isAdd = [objc_getAssociatedObject(self, &FLTextFieldAddChangedKey) boolValue];
    if (!isAdd) {
        [self addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
        objc_setAssociatedObject(self, &FLTextFieldAddChangedKey, [NSNumber numberWithBool:YES], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
}

-(NSInteger)kMaxLength
{
    return [objc_getAssociatedObject(self, &FLTextFieldMaxLenghtKey) integerValue];
}

- (void)textFieldDidChange:(UITextField *)textField
{
    if (textField != self) {
        return;
    }
    NSInteger kMaxLength = self.kMaxLength;
    NSString *toBeString = textField.text;
    NSString *lang = [[UIApplication sharedApplication]textInputMode].primaryLanguage; //ios7之前使用[UITextInputMode currentInputMode].primaryLanguage
    if ([lang isEqualToString:@"zh-Hans"]) { //中文输入
        
        UITextRange *selectedRange = [textField markedTextRange];
        //获取高亮部分
        UITextPosition *position = [textField positionFromPosition:selectedRange.start offset:0];
        if (!position) {// 没有高亮选择的字，则对已输入的文字进行字数统计和限制
            
            if (toBeString.length > kMaxLength) {
                textField.text = [toBeString substringToIndex:kMaxLength];
            }
        } else{//有高亮选择的字符串，则暂不对文字进行统计和限制
            
        }
        
    }else{//中文输入法以外的直接对其统计限制即可，不考虑其他语种情况
        
        if (toBeString.length > kMaxLength) {
            textField.text = [toBeString substringToIndex:kMaxLength];
        }
    }
}




@end
