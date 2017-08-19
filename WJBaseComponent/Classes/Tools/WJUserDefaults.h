//
// Created by Lawrence on 2017/8/19.
//

#import <Foundation/Foundation.h>


@interface WJUserDefaults : NSObject

/*
 * 删除对象
 * @param key key
 */
+ (void)removeObjectForKey:(NSString *)key;

/*
 * 删除所有对象
 */
+ (void)removeAllObjects;

/***********************数字、字符串***************************/

/*
 * 获取对象(number)
 * @param key key
 */
+ (id)objectForKey:(NSString *)key;

/*
 * 获取字符串
 * @param key key
 */
+ (NSString *)stringForKey:(NSString *)key;

/*
 * 保存对象到归档
 * @param value 保存的对象
 * @param key 保存对象的key
 */
+ (void)setObject:(id)value forKey:(NSString *)key;

/***********************数组***************************/

/*
 * 获取保存的数组对象
 * @param key 保存的key
 */
+ (NSMutableArray *)arrayForKey:(NSString *)key;

/*
 * 保存数组对象
 * @param value 数组对象（mutable）
 * @param key 保存的key
 */
+ (void)setArray:(NSMutableArray *)mutableArray forKey:(NSString *)key;

/***************************集合****************************/
/*
 * 获取集合
 * @param key 集合保存的key
 */
+ (NSMutableSet *)setForKey:(NSString *)key;

/*
 * 保存set
 * @param key 保存的key
 */
+ (void)setSet:(NSMutableSet *)mutableSet forKey:(NSString *)key;

/*************************字典*******************************/

/*
 * 获取保存的字典
 * @param key 对象保存的key
 */
+ (NSMutableDictionary *)dictionaryForKey:(NSString *)key;

/*
 * 保存字典对象
 * @param key 对象保存的key
 */
+ (void)setDictionary:(NSMutableDictionary *)mutableDictionary forKey:(NSString *)key;

/***************************序列化后的数组*****************************/

/*
 * 序列化后的数组
 * @param key 对象保存的key
 */
+ (NSMutableArray *)unArchiveArrayForKey:(NSString *)key;

/*
 * 保存序列化后的数组
 * @param key 保存的key
 */
+ (void)setArchivedArray:(NSMutableArray *)mutableArray forKey:(NSString *)key;

/*****************************没有序列化过的日期对象**********************************/

+ (NSData *)unArchiveDateObjectForKey:(NSString *)key;
+ (void)setArchiveDate:(NSDate *)date forKey:(NSString *)key;

@end