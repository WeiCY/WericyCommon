//
//  WeicyFileTool.h
//  Common
//
//  Created by CityDoWCY on 2021/1/26.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WeicyFileTool : NSObject

#pragma mark - 遍历文件夹
/// 文件遍历
/// @param path 目录的绝对路径
/// @param deep 是否深遍历
///     1. 浅遍历：返回当前目录下的所有文件和文件夹；
///     2. 深遍历：返回当前目录下及子目录下的所有文件和文件夹)
+ (NSArray *)weicy_listFilesInDirectoryAtPath:(NSString *)path deep:(BOOL)deep;
/// 遍历沙盒主目录
/// @param deep 是否深遍历
+ (NSArray *)weicy_listFilesInHomeDirectoryByDeep:(BOOL)deep;
/// 遍历Documents目录
/// @param deep 是否深遍历
+ (NSArray *)weicy_listFilesInDocumentDirectoryByDeep:(BOOL)deep;
/// 遍历Library目录
/// @param deep 是否深遍历
+ (NSArray *)weicy_listFilesInLibraryDirectoryByDeep:(BOOL)deep;
/// 遍历Caches目录
/// @param deep 是否深遍历
+ (NSArray *)weicy_listFilesInCachesDirectoryByDeep:(BOOL)deep;
/// 遍历tmp目录
/// @param deep 是否深遍历
+ (NSArray *)weicy_listFilesInTmpDirectoryByDeep:(BOOL)deep;

#pragma mark - 文件属性
/// 根据key获取文件某个属性
/// @param path 路径
/// @param key key值
+ (id)weicy_attributeOfItemAtPath:(NSString *)path forKey:(NSString *)key;

/// 根据key获取文件某个属性(错误信息error)
/// @param path 路径
/// @param key key值
/// @param error 错误信息
+ (id)weicy_attributeOfItemAtPath:(NSString *)path forKey:(NSString *)key error:(NSError **)error;

/// 获取文件属性集合
/// @param path 路径
+ (NSDictionary *)weicy_attributesOfItemAtPath:(NSString *)path;

/// 获取文件属性集合(错误信息error)
/// @param path 路径
/// @param error 错误信息
+ (NSDictionary *)weicy_attributesOfItemAtPath:(NSString *)path error:(NSError **)error;

#pragma mark - 创建文件(夹)

/// 创建文件夹
/// @param path 路径
+ (BOOL)weicy_createDirectoryAtPath:(NSString *)path;

/// 创建文件夹(错误信息error)
/// @param path 路径
/// @param error 错误信息
+ (BOOL)weicy_createDirectoryAtPath:(NSString *)path error:(NSError **)error;

/// 创建文件
/// @param path 路径
+ (BOOL)weicy_createFileAtPath:(NSString *)path;

/// 创建文件
/// @param path 路径
/// @param error 错误信息
+ (BOOL)weicy_createFileAtPath:(NSString *)path error:(NSError **)error;

/// 创建文件
/// @param path 路径
/// @param overwrite 是否覆盖
+ (BOOL)weicy_createFileAtPath:(NSString *)path overwrite:(BOOL)overwrite;

/// 创建文件
/// @param path 路径
/// @param overwrite 是否覆盖
/// @param error 错误信息
+ (BOOL)weicy_createFileAtPath:(NSString *)path overwrite:(BOOL)overwrite error:(NSError **)error;

/// 创建带内容的文件，
/// @param path 路径
/// @param content 文件内容
+ (BOOL)weicy_createFileAtPath:(NSString *)path content:(nullable NSObject *)content;

/// 创建带内容的文件(错误信息error)
/// @param path 路径
/// @param content 文件内容
/// @param error 错误信息
+ (BOOL)weicy_createFileAtPath:(NSString *)path content:(nullable NSObject *)content error:(NSError **)error;

/// 创建带内容的文件
/// @param path 路径
/// @param content 文件内容
/// @param overwrite 是否覆盖
+ (BOOL)weicy_createFileAtPath:(NSString *)path content:(nullable NSObject *)content overwrite:(BOOL)overwrite;

/// 创建带内容的文件(错误信息error)
/// @param path 路径
/// @param content 文件内容
/// @param overwrite 是否覆盖
/// @param error 错误信息
+ (BOOL)weicy_createFileAtPath:(NSString *)path content:(nullable NSObject *)content overwrite:(BOOL)overwrite error:(NSError **)error;

/// 获取创建文件时间
/// @param path 路径
+ (NSDate *)weicy_creationDateOfItemAtPath:(NSString *)path;

/// 获取创建文件时间(错误信息error)
/// @param path 路径
/// @param error 错误信息
+ (NSDate *)weicy_creationDateOfItemAtPath:(NSString *)path error:(NSError **)error;

/// 获取文件修改时间
/// @param path 路径
+ (NSDate *)weicy_modificationDateOfItemAtPath:(NSString *)path;

/// 获取文件修改时间(错误信息error)
/// @param path 路径
/// @param error 错误信息
+ (NSDate *)weicy_modificationDateOfItemAtPath:(NSString *)path error:(NSError **)error;

#pragma mark - 删除文件(夹)
/// 删除文件
/// @param path 路径
+ (BOOL)weicy_removeItemAtPath:(NSString *)path;

/// 删除文件(错误信息error)
/// @param path 路径
/// @param error 错误信息
+ (BOOL)weicy_removeItemAtPath:(NSString *)path error:(NSError **)error;

#pragma mark 清空文件夹
/// 清空Caches文件夹
+ (BOOL)weicy_clearCachesDirectory;

/// 清空tmp文件夹
+ (BOOL)weicy_clearTmpDirectory;

#pragma mark - 写入文件内容
/// 写入文件内容
/// @param path 路径
/// @param content 内容
+ (BOOL)weicy_writeFileAtPath:(NSString *)path content:(NSObject *)content;

/// 写入文件内容(错误信息error)
/// @param path 路径
/// @param content 文件内容
/// @param error 错误信息
+ (BOOL)weicy_writeFileAtPath:(NSString *)path content:(NSObject *)content error:(NSError **)error;

#pragma mark - 复制文件(夹)
/// 复制文件
/// @param path 原路径
/// @param toPath 新路径
+ (BOOL)weicy_copyItemAtPath:(NSString *)path toPath:(NSString *)toPath;

/// 复制文件(错误信息error)
/// @param path 原路径
/// @param toPath 新路径
/// @param error 错误信息
+ (BOOL)weicy_copyItemAtPath:(NSString *)path toPath:(NSString *)toPath error:(NSError **)error;

/// 复制文件，是否覆盖
/// @param path 原路径
/// @param toPath 新路径
/// @param overwrite 是否覆盖，当要复制到的文件路径文件存在，会复制失败，这里传入是否覆盖
+ (BOOL)weicy_copyItemAtPath:(NSString *)path toPath:(NSString *)toPath overwrite:(BOOL)overwrite;

/// 复制文件，是否覆盖(错误信息error)
/// @param path  原路径
/// @param toPath 新路径
/// @param overwrite 是否覆盖，当要复制到的文件路径文件存在，会复制失败，这里传入是否覆盖
/// @param error 错误信息
+ (BOOL)weicy_copyItemAtPath:(NSString *)path toPath:(NSString *)toPath overwrite:(BOOL)overwrite error:(NSError **)error;

#pragma mark - 移动文件(夹)
/// 移动文件
/// @param path 原路径
/// @param toPath 新路径
+ (BOOL)weicy_moveItemAtPath:(NSString *)path toPath:(NSString *)toPath;

/// 移动文件(错误信息error)
/// @param path 原路径
/// @param toPath 新路径
/// @param error 错误信息
+ (BOOL)weicy_moveItemAtPath:(NSString *)path toPath:(NSString *)toPath error:(NSError **)error;

/// 移动文件，是否覆盖
/// @param path 原路径
/// @param toPath 新路径
/// @param overwrite 是否覆盖，当要移动到的文件路径文件存在，会移动失败，这里传入是否覆盖
+ (BOOL)weicy_moveItemAtPath:(NSString *)path toPath:(NSString *)toPath overwrite:(BOOL)overwrite;

/// 移动文件，是否覆盖(错误信息error)
/// @param path 原路径
/// @param toPath 新路径
/// @param overwrite 是否覆盖，当要移动到的文件路径文件存在，会移动失败，这里传入是否覆盖
/// @param error 错误信息
+ (BOOL)weicy_moveItemAtPath:(NSString *)path toPath:(NSString *)toPath overwrite:(BOOL)overwrite error:(NSError **)error;

#pragma mark - 判断文件(夹)是否存在
/// 判断文件路径是否存在
/// @param path 路径
+ (BOOL)weicy_isExistsAtPath:(NSString *)path;

/// 判断路径是否为空
/// (判空条件是文件大小为0，或者是文件夹下没有子文件)
/// @param path 路径
+ (BOOL)weicy_isEmptyItemAtPath:(NSString *)path;

/// 判断路径是否为空(错误信息error)
/// @param path 路径
/// @param error 错误信息
+ (BOOL)weicy_isEmptyItemAtPath:(NSString *)path error:(NSError **)error;

/// 判断目录是否是文件夹
/// @param path 路径
+ (BOOL)weicy_isDirectoryAtPath:(NSString *)path;

/// 判断目录是否是文件夹(错误信息error)
/// @param path 路径
/// @param error 错误信息
+ (BOOL)weicy_isDirectoryAtPath:(NSString *)path error:(NSError **)error;

/// 判断目录是否是文件
/// @param path 路径
+ (BOOL)weicy_isFileAtPath:(NSString *)path;

/// 判断目录是否是文件(错误信息error)
/// @param path 路径
/// @param error 错误信息
+ (BOOL)weicy_isFileAtPath:(NSString *)path error:(NSError **)error;

/// 判断目录是否可以执行
/// @param path 路径
+ (BOOL)weicy_isExecutableItemAtPath:(NSString *)path;

/// 判断目录是否可读
/// @param path 路径
+ (BOOL)weicy_isReadableItemAtPath:(NSString *)path;

/// 判断目录是否可写
/// @param path 路径
+ (BOOL)weicy_isWritableItemAtPath:(NSString *)path;

#pragma mark - 获取文件(夹)大小
/// 获取目录文件夹大小
/// @param path 路径
+ (NSNumber *)weicy_sizeOfItemAtPath:(NSString *)path;

/// 获取目录文件夹大小(错误信息error)
/// @param path 路径
/// @param error  错误信息
+ (NSNumber *)weicy_sizeOfItemAtPath:(NSString *)path error:(NSError **)error;

/// 获取文件大小
/// @param path 路径
+ (NSNumber *)weicy_sizeOfFileAtPath:(NSString *)path;

/// 获取文件大小(错误信息error)
/// @param path 路径
/// @param error 错误信息
+ (NSNumber *)weicy_sizeOfFileAtPath:(NSString *)path error:(NSError **)error;

/// 获取文件夹大小
/// @param path 路径
+ (NSNumber *)weicy_sizeOfDirectoryAtPath:(NSString *)path;

/// 获取文件夹大小(错误信息error)
/// @param path 路径
/// @param error 错误信息
+ (NSNumber *)weicy_sizeOfDirectoryAtPath:(NSString *)path error:(NSError **)error;

/// 获取目录大小，返回格式化后的数值
/// @param path 路径
+ (NSString *)weicy_sizeFormattedOfItemAtPath:(NSString *)path;

/// 获取目录大小，返回格式化后的数值(错误信息error)
/// @param path 路径
/// @param error 错误信息
+ (NSString *)weicy_sizeFormattedOfItemAtPath:(NSString *)path error:(NSError **)error;

/// 获取文件大小，返回格式化后的数值
/// @param path 路径
+ (NSString *)weicy_sizeFormattedOfFileAtPath:(NSString *)path;

/// 获取文件大小，返回格式化后的数值(错误信息error)
/// @param path 路径
/// @param error 路径
+ (NSString *)weicy_sizeFormattedOfFileAtPath:(NSString *)path error:(NSError **)error;

/// 获取文件夹大小，返回格式化后的数值
/// @param path 路径
+ (NSString *)weicy_sizeFormattedOfDirectoryAtPath:(NSString *)path;

/// 获取文件夹大小，返回格式化后的数值(错误信息error)
/// @param path 路径
/// @param error 错误信息
+ (NSString *)weicy_sizeFormattedOfDirectoryAtPath:(NSString *)path error:(NSError **)error;

@end

NS_ASSUME_NONNULL_END
