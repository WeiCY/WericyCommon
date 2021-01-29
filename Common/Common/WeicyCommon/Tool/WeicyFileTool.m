//
//  WeicyFileTool.m
//  Common
//
//  Created by CityDoWCY on 2021/1/26.
//

#import "WeicyFileTool.h"
#import "UIApplication+WeicyCommon.h"

@implementation WeicyFileTool

#pragma mark - 遍历文件夹
+ (NSArray *)weicy_listFilesInDirectoryAtPath:(NSString *)path deep:(BOOL)deep {
    NSArray *listArr;
    NSError *error;
    NSFileManager *manager = [NSFileManager defaultManager];
    if (deep) {
        // 深遍历
        NSArray *deepArr = [manager subpathsOfDirectoryAtPath:path error:&error];
        if (!error) {
            listArr = deepArr;
        }else {
            listArr = nil;
        }
    }else {
        // 浅遍历
        NSArray *shallowArr = [manager contentsOfDirectoryAtPath:path error:&error];
        if (!error) {
            listArr = shallowArr;
        }else {
            listArr = nil;
        }
    }
    return listArr;
}

+ (NSArray *)weicy_listFilesInHomeDirectoryByDeep:(BOOL)deep {
    return [self weicy_listFilesInDirectoryAtPath:[UIApplication sharedApplication].homePath deep:deep];
}

+ (NSArray *)weicy_listFilesInDocumentDirectoryByDeep:(BOOL)deep {
    return [self weicy_listFilesInDirectoryAtPath:[UIApplication sharedApplication].documentsPath deep:deep];
}

+ (NSArray *)weicy_listFilesInLibraryDirectoryByDeep:(BOOL)deep {
    return [self weicy_listFilesInDirectoryAtPath:[UIApplication sharedApplication].libraryPath deep:deep];
}

+ (NSArray *)weicy_listFilesInCachesDirectoryByDeep:(BOOL)deep {
    return [self weicy_listFilesInDirectoryAtPath:[UIApplication sharedApplication].cachesPath deep:deep];
}

+ (NSArray *)weicy_listFilesInTmpDirectoryByDeep:(BOOL)deep {
    return [self weicy_listFilesInDirectoryAtPath:[UIApplication sharedApplication].tmpPath deep:deep];
}

#pragma mark - 文件属性
+ (id)weicy_attributeOfItemAtPath:(NSString *)path forKey:(NSString *)key {
    return [[self weicy_attributesOfItemAtPath:path] objectForKey:key];
}

+ (id)weicy_attributeOfItemAtPath:(NSString *)path forKey:(NSString *)key error:(NSError *__autoreleasing *)error {
    return [[self weicy_attributesOfItemAtPath:path error:error] objectForKey:key];
}

+ (NSDictionary *)weicy_attributesOfItemAtPath:(NSString *)path {
    return [self weicy_attributesOfItemAtPath:path error:nil];
}

+ (NSDictionary *)weicy_attributesOfItemAtPath:(NSString *)path error:(NSError *__autoreleasing *)error {
    return [[NSFileManager defaultManager] attributesOfItemAtPath:path error:error];
}

#pragma mark - 创建文件(夹)
+ (BOOL)weicy_createDirectoryAtPath:(NSString *)path {
    return [self weicy_createDirectoryAtPath:path error:nil];
}

+ (BOOL)weicy_createDirectoryAtPath:(NSString *)path error:(NSError *__autoreleasing  _Nullable *)error {
    NSFileManager *manager = [NSFileManager defaultManager];
    /* createDirectoryAtPath:withIntermediateDirectories:attributes:error:
     * 参数1：创建的文件夹的路径
     * 参数2：是否创建媒介的布尔值，一般为YES
     * 参数3: 属性，没有就置为nil
     * 参数4: 错误信息
     */
    BOOL isSuccess = [manager createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:error];
    return isSuccess;
}

+ (BOOL)weicy_createFileAtPath:(NSString *)path {
    return [self weicy_createFileAtPath:path content:nil overwrite:YES error:nil];
}

+ (BOOL)weicy_createFileAtPath:(NSString *)path error:(NSError *__autoreleasing  _Nullable *)error {
    return [self weicy_createFileAtPath:path content:nil overwrite:YES error:error];
}

+ (BOOL)weicy_createFileAtPath:(NSString *)path overwrite:(BOOL)overwrite {
    return [self weicy_createFileAtPath:path content:nil overwrite:overwrite error:nil];
}

+ (BOOL)weicy_createFileAtPath:(NSString *)path overwrite:(BOOL)overwrite error:(NSError *__autoreleasing  _Nullable *)error {
    return [self weicy_createFileAtPath:path content:nil overwrite:overwrite error:error];
}

+ (BOOL)weicy_createFileAtPath:(NSString *)path content:(NSObject *)content {
    return [self weicy_createFileAtPath:path content:content overwrite:YES error:nil];
}

+ (BOOL)weicy_createFileAtPath:(NSString *)path content:(NSObject *)content error:(NSError *__autoreleasing  _Nullable *)error {
    return [self weicy_createFileAtPath:path content:content overwrite:YES error:error];
}

+ (BOOL)weicy_createFileAtPath:(NSString *)path content:(NSObject *)content overwrite:(BOOL)overwrite {
    return [self weicy_createFileAtPath:path content:content overwrite:overwrite error:nil];
}

+ (BOOL)weicy_createFileAtPath:(NSString *)path content:(NSObject *)content overwrite:(BOOL)overwrite error:(NSError *__autoreleasing  _Nullable *)error {
    // 如果文件夹路径不存在，那么先创建文件夹
    NSString *directoryPath = [self directoryAtPath:path];
    if (![self weicy_isExistsAtPath:directoryPath]) {
        // 创建文件夹
        if (![self weicy_createDirectoryAtPath:directoryPath error:error]) {
            return NO;
        }
    }
    // 如果文件存在，并不想覆盖，那么直接返回YES。
    if (!overwrite) {
        if ([self weicy_isExistsAtPath:path]) {
            return YES;
        }
    }
    /*创建文件
     *参数1：创建文件的路径
     *参数2：创建文件的内容（NSData类型）
     *参数3：文件相关属性
     */
    BOOL isSuccess = [[NSFileManager defaultManager] createFileAtPath:path contents:nil attributes:nil];
    if (content) {
        [self weicy_writeFileAtPath:path content:content error:error];
    }
    return isSuccess;
}

+ (NSDate *)weicy_creationDateOfItemAtPath:(NSString *)path {
    return [self weicy_creationDateOfItemAtPath:path error:nil];
}
//获取文件创建的时间
+ (NSDate *)weicy_creationDateOfItemAtPath:(NSString *)path error:(NSError *__autoreleasing *)error {
    return (NSDate *)[self weicy_attributeOfItemAtPath:path forKey:NSFileCreationDate error:error];
}

+ (NSDate *)weicy_modificationDateOfItemAtPath:(NSString *)path {
    return [self weicy_modificationDateOfItemAtPath:path error:nil];
}
//获取文件修改的时间
+ (NSDate *)weicy_modificationDateOfItemAtPath:(NSString *)path error:(NSError *__autoreleasing *)error {
    return (NSDate *)[self weicy_attributeOfItemAtPath:path forKey:NSFileModificationDate error:error];
}

#pragma mark - 删除文件(夹)
+ (BOOL)weicy_removeItemAtPath:(NSString *)path {
    return [self weicy_removeItemAtPath:path error:nil];
}

+ (BOOL)weicy_removeItemAtPath:(NSString *)path error:(NSError *__autoreleasing *)error {
    return [[NSFileManager defaultManager] removeItemAtPath:path error:error];
}

#pragma mark 清空文件夹
+ (BOOL)weicy_clearCachesDirectory {
    NSArray *subFiles = [self weicy_listFilesInCachesDirectoryByDeep:NO];
    BOOL isSuccess = YES;
    
    for (NSString *file in subFiles) {
        NSString *absolutePath = [[UIApplication sharedApplication].cachesPath stringByAppendingPathComponent:file];
        isSuccess &= [self weicy_removeItemAtPath:absolutePath];
    }
    return isSuccess;
}

+ (BOOL)weicy_clearTmpDirectory {
    NSArray *subFiles = [self weicy_listFilesInTmpDirectoryByDeep:NO];
    BOOL isSuccess = YES;
    
    for (NSString *file in subFiles) {
        NSString *absolutePath = [[UIApplication sharedApplication].tmpPath stringByAppendingPathComponent:file];
        isSuccess &= [self weicy_removeItemAtPath:absolutePath];
    }
    return isSuccess;
}

#pragma mark - 写入文件内容
+ (BOOL)weicy_writeFileAtPath:(NSString *)path content:(NSObject *)content {
    return [self weicy_writeFileAtPath:path content:content error:nil];
}

+ (BOOL)weicy_writeFileAtPath:(NSString *)path content:(NSObject *)content error:(NSError *__autoreleasing  _Nullable *)error {
    //判断文件内容是否为空
    if (!content) {
        [NSException raise:@"非法的文件内容" format:@"文件内容不能为nil"];
        return NO;
    }
    // 判断文件(夹)是否存在
    if ([self weicy_isExistsAtPath:path]) {
        if ([content isKindOfClass:[NSMutableArray class]]) {
            // 文件内容为可变数组
            [(NSMutableArray *)content writeToFile:path atomically:YES];
        } else if ([content isKindOfClass:[NSArray class]]) {
            // 文件内容为不可变数组
            [(NSArray *)content writeToFile:path atomically:YES];
        } else if ([content isKindOfClass:[NSMutableData class]]) {
            // 文件内容为可变NSMutableData
            [(NSMutableData *)content writeToFile:path atomically:YES];
        } else if ([content isKindOfClass:[NSData class]]) {
            // 文件内容为NSData
            [(NSData *)content writeToFile:path atomically:YES];
        } else if ([content isKindOfClass:[NSMutableDictionary class]]) {
            // 文件内容为可变字典
            [(NSMutableDictionary *)content writeToFile:path atomically:YES];
        } else if ([content isKindOfClass:[NSDictionary class]]) {
            // 文件内容为不可变字典
            [(NSDictionary *)content writeToFile:path atomically:YES];
        } else if ([content isKindOfClass:[NSJSONSerialization class]]) {
            // 文件内容为JSON类型
            [(NSDictionary *)content writeToFile:path atomically:YES];
        } else if ([content isKindOfClass:[NSMutableString class]]) {
            // 文件内容为可变字符串
            [[((NSString *)content) dataUsingEncoding:NSUTF8StringEncoding] writeToFile:path atomically:YES];
        } else if ([content isKindOfClass:[NSString class]]) {
            // 文件内容为不可变字符串
            [[((NSString *)content) dataUsingEncoding:NSUTF8StringEncoding] writeToFile:path atomically:YES];
        } else if ([content isKindOfClass:[UIImage class]]) {
            // 文件内容为图片
            [UIImagePNGRepresentation((UIImage *)content) writeToFile:path atomically:YES];
        } else if ([content conformsToProtocol:@protocol(NSCoding)]) {//文件归档
            
#warning 之后研究归档解归档
//            if (@available(iOS 12.0, *)) {
//                [NSKeyedArchiver archivedDataWithRootObject:content requiringSecureCoding:NO error:nil];
//            } else {
                [NSKeyedArchiver archiveRootObject:content toFile:path];
//            }
        } else {
            [NSException raise:@"非法的文件内容" format:@"文件类型%@异常，无法被处理。", NSStringFromClass([content class])];
            return NO;
        }
    }else {
        return NO;
    }
    return YES;
}

#pragma mark - 复制文件
+ (BOOL)weicy_copyItemAtPath:(NSString *)path toPath:(NSString *)toPath {
    return [self weicy_copyItemAtPath:path toPath:toPath overwrite:NO error:nil];
}

+ (BOOL)weicy_copyItemAtPath:(NSString *)path toPath:(NSString *)toPath error:(NSError *__autoreleasing *)error {
    return [self weicy_copyItemAtPath:path toPath:toPath overwrite:NO error:error];
}

+ (BOOL)weicy_copyItemAtPath:(NSString *)path toPath:(NSString *)toPath overwrite:(BOOL)overwrite {
    return [self weicy_copyItemAtPath:path toPath:toPath overwrite:overwrite error:nil];
}

+ (BOOL)weicy_copyItemAtPath:(NSString *)path toPath:(NSString *)toPath overwrite:(BOOL)overwrite error:(NSError *__autoreleasing  _Nullable *)error {
    // 先要保证源文件路径存在，不然抛出异常
    if (![self weicy_isExistsAtPath:path]) {
        [NSException raise:@"非法的源文件路径" format:@"源文件路径%@不存在，请检查源文件路径", path];
        return NO;
    }
    //获得目标文件的上级目录
    NSString *toDirPath = [self directoryAtPath:toPath];
    if (![self weicy_isExistsAtPath:toDirPath]) {
        // 创建复制路径
        if (![self weicy_createDirectoryAtPath:toDirPath error:error]) {
            return NO;
        }
    }
    // 如果覆盖，那么先删掉原文件
    if (overwrite) {
        if ([self weicy_isExistsAtPath:toPath]) {
            [self weicy_removeItemAtPath:toPath error:error];
        }
    }
    // 复制文件，如果不覆盖且文件已存在则会复制失败
    BOOL isSuccess = [[NSFileManager defaultManager] copyItemAtPath:path toPath:toPath error:error];
    
    return isSuccess;
}

#pragma mark - 移动文件(夹)
+ (BOOL)weicy_moveItemAtPath:(NSString *)path toPath:(NSString *)toPath {
    return [self weicy_moveItemAtPath:path toPath:toPath overwrite:NO error:nil];
}

+ (BOOL)weicy_moveItemAtPath:(NSString *)path toPath:(NSString *)toPath error:(NSError *__autoreleasing *)error {
    return [self weicy_moveItemAtPath:path toPath:toPath overwrite:NO error:error];
}

+ (BOOL)weicy_moveItemAtPath:(NSString *)path toPath:(NSString *)toPath overwrite:(BOOL)overwrite {
    return [self weicy_moveItemAtPath:path toPath:toPath overwrite:overwrite error:nil];
}

+ (BOOL)weicy_moveItemAtPath:(NSString *)path toPath:(NSString *)toPath overwrite:(BOOL)overwrite error:(NSError *__autoreleasing  _Nullable *)error {
    // 先要保证源文件路径存在，不然抛出异常
    if (![self weicy_isExistsAtPath:path]) {
        [NSException raise:@"非法的源文件路径" format:@"源文件路径%@不存在，请检查源文件路径", path];
        return NO;
    }
    //获得目标文件的上级目录
    NSString *toDirPath = [self directoryAtPath:toPath];
    if (![self weicy_isExistsAtPath:toDirPath]) {
        // 创建移动路径
        if (![self weicy_createDirectoryAtPath:toDirPath error:error]) {
            return NO;
        }
    }
    // 判断目标路径文件是否存在
    if ([self weicy_isExistsAtPath:toPath]) {
        //如果覆盖，删除目标路径文件
        if (overwrite) {
            //删掉目标路径文件
            [self weicy_removeItemAtPath:toPath error:error];
        }else {
            //删掉被移动文件
            [self weicy_removeItemAtPath:path error:error];
            return YES;
        }
    }
    
    // 移动文件，当要移动到的文件路径文件存在，会移动失败
    BOOL isSuccess = [[NSFileManager defaultManager] moveItemAtPath:path toPath:toPath error:error];
    return isSuccess;
}


#pragma mark - 判断文件(夹)是否存在
+ (BOOL)weicy_isExistsAtPath:(NSString *)path {
    return [[NSFileManager defaultManager] fileExistsAtPath:path];
}

+ (BOOL)weicy_isEmptyItemAtPath:(NSString *)path {
    return [self weicy_isEmptyItemAtPath:path error:nil];
}

+ (BOOL)weicy_isEmptyItemAtPath:(NSString *)path error:(NSError *__autoreleasing *)error {
    return ([self weicy_isFileAtPath:path error:error] &&
            [[self weicy_sizeOfItemAtPath:path error:error] intValue] == 0) ||
    ([self weicy_isDirectoryAtPath:path error:error] &&
     [[self weicy_listFilesInDirectoryAtPath:path deep:NO] count] == 0);
}

+ (BOOL)weicy_isDirectoryAtPath:(NSString *)path {
    return [self weicy_isDirectoryAtPath:path error:nil];
}

+ (BOOL)weicy_isDirectoryAtPath:(NSString *)path error:(NSError *__autoreleasing *)error {
    return ([self weicy_attributeOfItemAtPath:path forKey:NSFileType error:error] == NSFileTypeDirectory);
}

+ (BOOL)weicy_isFileAtPath:(NSString *)path {
    return [self weicy_isFileAtPath:path error:nil];
}

+ (BOOL)weicy_isFileAtPath:(NSString *)path error:(NSError *__autoreleasing *)error {
    return ([self weicy_attributeOfItemAtPath:path forKey:NSFileType error:error] == NSFileTypeRegular);
}

+ (BOOL)weicy_isExecutableItemAtPath:(NSString *)path {
    return [[NSFileManager defaultManager] isExecutableFileAtPath:path];
}

+ (BOOL)weicy_isReadableItemAtPath:(NSString *)path {
    return [[NSFileManager defaultManager] isReadableFileAtPath:path];
}

+ (BOOL)weicy_isWritableItemAtPath:(NSString *)path {
    return [[NSFileManager defaultManager] isWritableFileAtPath:path];
}

#pragma mark - 获取文件(夹)大小
+ (NSNumber *)weicy_sizeOfItemAtPath:(NSString *)path {
    return [self weicy_sizeOfItemAtPath:path error:nil];
}

+ (NSNumber *)weicy_sizeOfItemAtPath:(NSString *)path error:(NSError *__autoreleasing *)error {
    return (NSNumber *)[self weicy_attributeOfItemAtPath:path forKey:NSFileSize error:error];
}

+ (NSNumber *)weicy_sizeOfFileAtPath:(NSString *)path {
    return [self weicy_sizeOfFileAtPath:path error:nil];
}

+ (NSNumber *)weicy_sizeOfFileAtPath:(NSString *)path error:(NSError *__autoreleasing *)error {
    if ([self weicy_isFileAtPath:path error:error]) {
        return [self weicy_sizeOfItemAtPath:path error:error];
    }
    return nil;
}

+ (NSNumber *)weicy_sizeOfDirectoryAtPath:(NSString *)path {
    return [self weicy_sizeOfDirectoryAtPath:path error:nil];
}

+ (NSNumber *)weicy_sizeOfDirectoryAtPath:(NSString *)path error:(NSError *__autoreleasing *)error {
    if ([self weicy_isDirectoryAtPath:path error:error]) {
        //深遍历文件夹
        NSArray *subPaths = [self weicy_listFilesInDirectoryAtPath:path deep:YES];
        NSEnumerator *contentsEnumurator = [subPaths objectEnumerator];
        
        NSString *file;
        unsigned long long int folderSize = 0;
        
        while (file = [contentsEnumurator nextObject]) {
            NSDictionary *fileAttributes = [[NSFileManager defaultManager] attributesOfItemAtPath:[path stringByAppendingPathComponent:file] error:nil];
            folderSize += [[fileAttributes objectForKey:NSFileSize] intValue];
        }
        return [NSNumber numberWithUnsignedLongLong:folderSize];
    }
    return nil;
}

+ (NSString *)weicy_sizeFormattedOfItemAtPath:(NSString *)path {
    return [self weicy_sizeFormattedOfItemAtPath:path error:nil];
}

+ (NSString *)weicy_sizeFormattedOfItemAtPath:(NSString *)path error:(NSError *__autoreleasing *)error {
    NSNumber *size = [self weicy_sizeOfItemAtPath:path error:error];
    if (size) {
        return [self sizeFormatted:size];
    }
    return nil;
}

+ (NSString *)weicy_sizeFormattedOfFileAtPath:(NSString *)path {
    return [self weicy_sizeFormattedOfFileAtPath:path error:nil];
}

+ (NSString *)weicy_sizeFormattedOfFileAtPath:(NSString *)path error:(NSError *__autoreleasing *)error {
    NSNumber *size = [self weicy_sizeOfFileAtPath:path error:error];
    if (size) {
        return [self sizeFormatted:size];
    }
    return nil;
}

+ (NSString *)weicy_sizeFormattedOfDirectoryAtPath:(NSString *)path {
    return [self weicy_sizeFormattedOfDirectoryAtPath:path error:nil];
}

+ (NSString *)weicy_sizeFormattedOfDirectoryAtPath:(NSString *)path error:(NSError *__autoreleasing *)error {
    NSNumber *size = [self weicy_sizeOfDirectoryAtPath:path error:error];
    if (size) {
        return [self sizeFormatted:size];
    }
    return nil;
}

#pragma mark - private methods
+ (BOOL)isNotError:(NSError **)error {
    return ((error == nil) || ((*error) == nil));
}

+ (NSString *)directoryAtPath:(NSString *)path {
    return [path stringByDeletingLastPathComponent];
}

#pragma mark 将文件大小格式化为字节
+(NSString *)sizeFormatted:(NSNumber *)size {
    /*NSByteCountFormatterCountStyle枚举
     *NSByteCountFormatterCountStyleFile 字节为单位，采用十进制的1000bytes = 1KB
     *NSByteCountFormatterCountStyleMemory 字节为单位，采用二进制的1024bytes = 1KB
     *NSByteCountFormatterCountStyleDecimal KB为单位，采用十进制的1000bytes = 1KB
     *NSByteCountFormatterCountStyleBinary KB为单位，采用二进制的1024bytes = 1KB
     */
    return [NSByteCountFormatter stringFromByteCount:[size unsignedLongLongValue] countStyle:NSByteCountFormatterCountStyleFile];
}

@end
