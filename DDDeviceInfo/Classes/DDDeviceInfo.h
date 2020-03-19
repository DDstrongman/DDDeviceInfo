//
//  DDDeviceInfo.h
//  XXDNew
//
//  Created by DDLi on 2017/6/5.
//  Copyright © 2017年 DDLi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DDDeviceInfo : NSObject

+ (DDDeviceInfo *)ShareInstance;

/**
 app名称
 */
@property (nonatomic, strong) NSString *appName;
/**
 app版本号
 */
@property (nonatomic, strong) NSString *appVersion;
/**
 设备型号名
 */
@property (nonatomic, strong) NSString *deviceName;
/**
 手机系统版本号
 */
@property (nonatomic, strong) NSString *systemVersion;
/**
 手机当前所处网络的IP
 */
@property (nonatomic, strong) NSString *deviceIP;
/**
 是模拟器还是手机，模拟器：@“0”，手机：“1”
 */
@property (nonatomic, strong) NSString *deviceReal;
/**
 手机的uuid
 */
@property (nonatomic, strong) NSString *uuid;
/**
 手机的idfa
 */
@property (nonatomic, strong) NSString *idfa

@end
