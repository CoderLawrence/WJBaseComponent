//
// Created by Lawrence on 2017/8/19.
//

#import "WJUserDefaults.h"


@implementation WJUserDefaults

/*
 * 删除对象
 * @param key key
 */
+ (void)removeObjectForKey:(NSString *)key {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults removeObjectForKey:key];
    [userDefaults synchronize];
}

/*
 * 删除所有对象
 */
+ (void)removeAllObjects {

    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *appDomainString = [[NSBundle mainBundle] bundleIdentifier];
    [userDefaults removePersistentDomainForName:appDomainString];
    [userDefaults synchronize];
}

/*
 * 获取对象(number)
 * @param key key
 */
+ (id)objectForKey:(NSString *)key {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    return [userDefaults objectForKey:key];
}

/*
 * 获取字符串
 * @param key key
 */
+ (NSString *)stringForKey:(NSString *)key {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    return [userDefaults stringForKey:key];
}

/*
 * 保存对象到归档
 * @param value 保存的对象
 * @param key 保存对象的key
 */
+ (void)setObject:(id)value forKey:(NSString *)key {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:value forKey:key];
    [userDefaults synchronize];
}

/*
 * 获取保存的数组对象
 * @param key 保存的key
 */
+ (NSMutableArray *)arrayForKey:(NSString *)key {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSArray *array = [userDefaults objectForKey:key];
    if (array && [array isKindOfClass:[NSArray class]]) {
        return [NSMutableArray arrayWithArray:array];
    } else {
        return [NSMutableArray array];
    }
}

/*
 * 保存数组对象
 * @param value 数组对象（mutable）
 * @param key 保存的key
 */
+ (void)setArray:(NSMutableArray *)mutableArray forKey:(NSString *)key {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSArray *array = [NSArray arrayWithArray:mutableArray];
    [userDefaults setObject:array forKey:key];
    [userDefaults synchronize];
}

/*
 * 获取集合
 * @param key 集合保存的key
 */
+ (NSMutableSet *)setForKey:(NSString *)key {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSArray *array = [userDefaults objectForKey:key];
    if (array && [array isKindOfClass:[NSArray class]]) {
        return [NSMutableSet setWithArray:array];
    } else {
        return [NSMutableSet set];
    }
}

/*
 * 保存set
 * @param key 保存的key
 */
+ (void)setSet:(NSMutableSet *)mutableSet forKey:(NSString *)key {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSArray *array = [mutableSet allObjects];
    [userDefaults setObject:array forKey:key];
    [userDefaults synchronize];
}

/*
 * 获取保存的字典
 * @param key 对象保存的key
 */
+ (NSMutableDictionary *)dictionaryForKey:(NSString *)key {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSDictionary *dictionary = [userDefaults objectForKey:key];

    if (dictionary && [dictionary isKindOfClass:[NSDictionary class]]) {
        return [NSMutableDictionary dictionaryWithDictionary:dictionary];
    } else {
        return [NSMutableDictionary dictionary];
    }
}

/*
 * 保存字典对象
 * @param key 对象保存的key
 */
+ (void)setDictionary:(NSMutableDictionary *)mutableDictionary forKey:(NSString *)key {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSDictionary *dictionary = [NSDictionary dictionaryWithDictionary:mutableDictionary];
    [userDefaults setObject:dictionary forKey:key];
    [userDefaults synchronize];
}

/*
 * 序列化后的数组
 * @param key 对象保存的key
 */
+ (NSMutableArray *)unArchiveArrayForKey:(NSString *)key {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSArray *array = [userDefaults objectForKey:key];

    if (array && [array isKindOfClass:[NSArray class]]) {
        NSMutableArray *unArchiveArray = [NSMutableArray array];
        for (NSData *data in array) {
            id object = [NSKeyedUnarchiver unarchiveObjectWithData:data];
            [unArchiveArray addObject:object];
        }
        return [NSMutableArray arrayWithArray:unArchiveArray];
    } else {
        return [NSMutableArray array];
    }
}

/*
 * 保存序列化后的数组
 * @param key 保存的key
 */
+ (void)setArchivedArray:(NSMutableArray *)mutableArray forKey:(NSString *)key {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSMutableArray *archivedArray = [NSMutableArray array];
    for (id object in mutableArray) {
        NSData *data = [object archivedDataWithRootObject:object];
        [archivedArray addObject:data];
    }
    NSArray *array = [NSArray arrayWithArray:archivedArray];
    [userDefaults setObject:array forKey:key];
    [userDefaults synchronize];
}

+ (NSDate *)unArchiveDateObjectForKey:(NSString *)key {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSData *data = [userDefaults objectForKey:key];
    NSDate *date = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    return date;
}

+ (void)setArchiveDate:(NSDate *)date forKey:(NSString *)key {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:date];
    [userDefaults setObject:data forKey:key];
    [userDefaults synchronize];
}

@end
