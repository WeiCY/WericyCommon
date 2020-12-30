//
//  WeicyCommonMacros.h
//  Common
//
//  Created by CityDoWCY on 2020/12/24.
//

#ifndef WeicyCommonMacros_h
#define WeicyCommonMacros_h

#pragma mark - ////////////////////////////// 常用宏相关 //////////////////////////////

#pragma mark ********** 1.缩写 ************
#define kApplication        [UIApplication sharedApplication]
#define kKeyWindow          [UIApplication sharedApplication].keyWindow // KeyWindow
#define kAppDelegate        [UIApplication sharedApplication].delegate  // AppDelegate
#define kNotificationCenter [NSNotificationCenter defaultCenter] // 通知中心
#define kMethodDeprecated(instead) DEPRECATED_MSG_ATTRIBUTE("Please use " # instead " instead") // 方法失效

#pragma mark ********** 2.自定义高效率的 NSLog ************
#ifdef DEBUG // 输出日志 (格式: [编译时间] [文件名] [方法名] [行号] [输出内容])
#define NSLog(FORMAT, ...) fprintf(stderr,"------- 🎈输出日志 🎈-------\n编译时间:%s\n文件名:%s\n方法名:%s\n行号:%d\n打印信息:%s\n\n", __TIME__,[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String],__func__,__LINE__,[[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String])
#else
#define NSLog(FORMAT, ...) nil
#endif

#pragma mark ********** 3.弱引用 *********
/**
 Synthsize a weak or strong reference.
 
 Example:
 @weakify(self)
 [self doSomething^{
 @strongify(self)
 if (!self) return;
 ...
 }];
 
 */
#ifndef weakify
    #if DEBUG
        #if __has_feature(objc_arc)
        #define weakify(object) autoreleasepool{} __weak __typeof__(object) weak##_##object = object;
        #else
        #define weakify(object) autoreleasepool{} __block __typeof__(object) block##_##object = object;
        #endif
    #else
        #if __has_feature(objc_arc)
        #define weakify(object) try{} @finally{} {} __weak __typeof__(object) weak##_##object = object;
        #else
        #define weakify(object) try{} @finally{} {} __block __typeof__(object) block##_##object = object;
        #endif
    #endif
#endif

#ifndef strongify
    #if DEBUG
        #if __has_feature(objc_arc)
        #define strongify(object) autoreleasepool{} __typeof__(object) object = weak##_##object;
        #else
        #define strongify(object) autoreleasepool{} __typeof__(object) object = block##_##object;
        #endif
    #else
        #if __has_feature(objc_arc)
        #define strongify(object) try{} @finally{} __typeof__(object) object = weak##_##object;
        #else
        #define strongify(object) try{} @finally{} __typeof__(object) object = block##_##object;
        #endif
    #endif
#endif

#pragma mark ********** 4.NaviBar和Tabbar *********
// statusBar height
#define kSTATUSBAR_HEIGHT [[UIApplication sharedApplication] statusBarFrame].size.height
// navigationBar height
#define kNAVIGATION_HEIGHT (44.f)
// (navigationBar + statusBar) height
#define kSTATUSBAR_NAVIGATION_HEIGHT (kSTATUSBAR_HEIGHT+kNAVIGATION_HEIGHT)
// tabar距底边高度
#define kBOTTOM_SPACE_HEIGHT (kSTATUSBAR_HEIGHT>20 ? 34.0f : 0.0f)
// tabBar height
#define kTABBAR_HEIGHT (kSTATUSBAR_HEIGHT>20 ? (49.f+34.f):49.f)

#pragma mark ********** 5.尺寸相关  *********
// 屏幕尺寸
#define kScreenSize ([UIScreen mainScreen].bounds.size)
#define kScreenW    ([UIScreen mainScreen].bounds.size.width)
#define kScreenH    ([UIScreen mainScreen].bounds.size.height)
#define kRect       CGRectMake(0, 0, kScreenW, kScreenH)
// AutoSize
#define kAutoW(r)   (r * kScreenW / 375.0)
#define kAutoH(r)   (r * kScreenH / 667.0)

// TODO:暂时有问题
/// 支持横屏可以用下面的宏
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 80000
#define kLandscapeScreenW    ([[UIScreen mainScreen] respondsToSelector:@selector(nativeBounds)]?[UIScreen mainScreen].nativeBounds.size.width/[UIScreen mainScreen].nativeScale:[UIScreen mainScreen].bounds.size.width)
#define kLandscapeScreenH    ([[UIScreen mainScreen] respondsToSelector:@selector(nativeBounds)]?[UIScreen mainScreen].nativeBounds.size.height/[UIScreen mainScreen].nativeScale:[UIScreen mainScreen].bounds.size.height)
#define kLandscapeScreenSize ([[UIScreen mainScreen] respondsToSelector:@selector(nativeBounds)]?CGSizeMake([UIScreen mainScreen].nativeBounds.size.width/[UIScreen mainScreen].nativeScale,[UIScreen mainScreen].nativeBounds.size.height/[UIScreen mainScreen].nativeScale):[UIScreen mainScreen].bounds.size)
#else
#define kLandscapeScreenW    [UIScreen mainScreen].bounds.size.width
#define kLandscapeScreenH    [UIScreen mainScreen].bounds.size.height
#define kLandscapeScreenSize [UIScreen mainScreen].bounds.size
#endif

#pragma mark ********** 6.颜色相关  *********
#define RGBColor(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
#define RGBAColor(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

#pragma mark ********** 7.非空判断  *********
//字符串是否为空
#define kStringIsEmpty(str) ([str isKindOfClass:[NSNull class]] || str == nil || [str length] < 1 ? YES : NO )
//数组是否为空
#define kArrayIsEmpty(array) (array == nil || [array isKindOfClass:[NSNull class]] || array.count == 0)
//字典是否为空
#define kDictIsEmpty(dic) (dic == nil || [dic isKindOfClass:[NSNull class]] || dic.allKeys == 0)
//是否是空对象
#define kObjectIsEmpty(_object) (_object == nil \
|| [_object isKindOfClass:[NSNull class]] \
|| ([_object respondsToSelector:@selector(length)] && [(NSData *)_object length] == 0) \
|| ([_object respondsToSelector:@selector(count)] && [(NSArray *)_object count] == 0))

#pragma mark ********** 8.方法  *********
#define kDELEGATE_HAS_METHOD(method)  self.delegate&&[self.delegate respondsToSelector:@selector(method)]
// 属性快速声明（建议使用代码块）
#define K_PROPERTY_STRING(name) @property(nonatomic,copy)NSString *name
#define K_PROPERTY_ASSIGN(name) @property(nonatomic,assign)NSInteger name
#define K_PROPERTY_STRONG(type,name) @property(nonatomic,strong)type *name
// 获取类名
#define K_GET_CLASS_NAME(x) [NSString stringWithUTF8String:object_getClassName([x class])]

// runtime 为对象类型属性快速生成get/set方法
#define K_SYNTHESIZE_CATEGORY_OBJ_PROPERTY(propertyGetter, propertySetter)\
- (id)propertyGetter{ return objc_getAssociatedObject(self, @selector(propertyGetter));}\
- (void)propertySetter(id)obj{ objc_setAssociatedObject(self, @selector(propertyGetter), obj, OBJC_ASSOCIATION_RETAIN_NONATOMIC);}
// 为基本数据类型属性快速生成get/set方法
#define K_SYNTHESIZE_CATEGORY_VALUE_PROPERTY(valueType, propertyGetter, propertySetter)\
- (valueType)propertyGetter{\
valueType ret = {0};\
[objc_getAssociatedObject(self, @selector(propertyGetter)) getValue:&ret];\
return ret;\
}\
- (void)propertySetter(valueType)value{\
NSValue *valueObj = [NSValue valueWithBytes:&value objCType:@encode(valueType)];\
objc_setAssociatedObject(self, @selector(propertyGetter), valueObj, OBJC_ASSOCIATION_RETAIN_NONATOMIC);\
}

#pragma mark ********** 9.单例  *********
/* 单例宏 单例的目的 : 希望对象只创建一个实例，并且提供一个全局的访问点
 使用方法:
 .h文件
 kSingletonImplementation_H(类名)
 
 .m文件
 kSingletonImplementation_M(类名)
 
 调用方法
 类名 *vc = [类名 shared类名];
*/
// 1. 解决.h文件
#define kSingletonImplementation_H(className) \
+ (instancetype)shared##className;
// 2. 解决.m文件
// 判断 是否是 ARC
#define kSingletonImplementation_M(className) \
static id instance; \
+ (instancetype)allocWithZone:(struct _NSZone *)zone { \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
instance = [super allocWithZone:zone]; \
}); \
return instance; \
} \
+ (instancetype)shared##className { \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
instance = [[self alloc] init]; \
}); \
return instance; \
} \
- (id)copyWithZone:(NSZone *)zone { \
return instance; \
}

#pragma mark ********** 10.字体相关  *********
#define RegularFont(size)  [UIFont systemFontOfSize:size weight:UIFontWeightRegular]
#define MediumFont(size)   [UIFont systemFontOfSize:size weight:UIFontWeightMedium]
#define LightFont(size)    [UIFont systemFontOfSize:size weight:UIFontWeightLight]
#define SemiboldFont(size) [UIFont systemFontOfSize:size weight:UIFontWeightSemibold]
#define BoldFont(size) [UIFont systemFontOfSize:size weight:UIFontWeightBold]

#endif /* WeicyCommonMacros_h */
