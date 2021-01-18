//
//  LBSystemPhotoPicker.h
//  PerpetualCalendar
//
//  Created by 刘彬 on 2019/7/26.
//  Copyright © 2019 BIN. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Photos/Photos.h>
NS_ASSUME_NONNULL_BEGIN

@interface LBSystemPhotoPicker : NSObject

/**
 -(void)showPhotoPicker{
     LBSystemPhotoPicker *picker = [[LBSystemPhotoPicker alloc] init];
     [picker addImagePickerSourceType:UIImagePickerControllerSourceTypePhotoLibrary title:@"相册"];
     [picker addImagePickerSourceType:UIImagePickerControllerSourceTypeCamera title:@"相机"];
     picker.didFinishPickingMedia = ^(NSDictionary * _Nullable info, NSString * _Nullable errorDesc) {
         NSLog(@"%@",errorDesc);
     };
 //    picker.onlySourceType = @(UIImagePickerControllerSourceTypePhotoLibrary);
     [picker showInViewController:self animated:YES completion:nil];
 }
 */
@property (nonatomic, strong) UIImagePickerController *imagePicker;
@property (nonatomic, copy, nullable)void (^didFinishPickingMedia)(NSDictionary<UIImagePickerControllerInfoKey, id> *_Nullable imageInfo,NSString * _Nullable errorDesc);
@property (nonatomic, strong, nullable) NSNumber *onlySourceType;//UIImagePickerControllerSourceType，使用该属性将不弹出actionSheet选择器
@property(nonatomic, assign) UIModalPresentationStyle modalPresentationStyle;

-(void)addImagePickerSourceType:(UIImagePickerControllerSourceType )sourceType title:(NSString *)title;

-(void)showInViewController:(UIViewController *)viewController animated: (BOOL)flag completion:(void (^ __nullable)(void))completion;
@end

NS_ASSUME_NONNULL_END
