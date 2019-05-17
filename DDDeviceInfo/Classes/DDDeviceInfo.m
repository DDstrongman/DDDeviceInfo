//
//  DDDeviceInfo.m
//  XXDNew
//
//  Created by 李胜书 on 2017/6/5.
//  Copyright © 2017年 Xinxindai. All rights reserved.
//

#import "DDDeviceInfo.h"
#import <sys/utsname.h>
#import <arpa/inet.h>
#import <ifaddrs.h>
#import <AdSupport/ASIdentifierManager.h>

@implementation DDDeviceInfo


#pragma mark - lazy loading
- (NSString *)appName {
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"];
}

- (NSString *)appVersion {
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
}

- (NSString *)deviceName {
    return [self getDeviceName];
}

- (NSString *)systemVersion {
    return [[UIDevice currentDevice] systemVersion];
}

- (NSString *)uuid {
    return [[[UIDevice currentDevice] identifierForVendor] UUIDString];
}

- (NSString *)idfa {
    if ([[[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString] isEqualToString:@"00000000-0000-0000-0000-000000000000"]) {
        return [[[UIDevice currentDevice] identifierForVendor] UUIDString];
    }
    return [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
}

- (NSString *)deviceIP {
    return [self deviceIPAdress];
}

- (NSString *)deviceReal {
    return [self getDeviceReal];
}
#pragma mark - support methods
+ (DDDeviceInfo *)ShareInstance {
    static DDDeviceInfo *sharedDDDeviceInfoInstance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        sharedDDDeviceInfoInstance = [[self alloc] init];
    });
    return sharedDDDeviceInfoInstance;
}

/**
 获取设备型号然后手动转化为对应名称
 
 @return 手动转化后的对应名称
 */
- (NSString *)getDeviceName {
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *platform = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    
    // iPhone
    if ([platform isEqualToString:@"iPhone11,8"])   return @"iPhone XR";///< add
    if ([platform isEqualToString:@"iPhone11,6"])   return @"iPhone XS Max";///< add
    if ([platform isEqualToString:@"iPhone11,4"])   return @"iPhone XS Max";///< add
    if ([platform isEqualToString:@"iPhone11,2"])   return @"iPhone XS";///< add
    if ([platform isEqualToString:@"iPhone10,6"])   return @"iPhone X";///< add         // GSM
    if ([platform isEqualToString:@"iPhone10,5"])   return @"iPhone 8 Plus";///< add    // GSM
    if ([platform isEqualToString:@"iPhone10,4"])   return @"iPhone 8";///< add         // GSM
    if ([platform isEqualToString:@"iPhone10,3"])   return @"iPhone X";///< add         // Global
    if ([platform isEqualToString:@"iPhone10,2"])   return @"iPhone 8 Plus";///< add    // Global
    if ([platform isEqualToString:@"iPhone10,1"])   return @"iPhone 8";///< add         // Global
    // 日行两款手机型号均为日本独占，可能使用索尼FeliCa支付方案而不是苹果支付
    if ([platform isEqualToString:@"iPhone9,4"])    return @"美版、台版iPhone 7 Plus";
    if ([platform isEqualToString:@"iPhone9,3"])    return @"美版、台版iPhone 7";
    if ([platform isEqualToString:@"iPhone9,2"])    return @"港行、国行iPhone 7 Plus";
    if ([platform isEqualToString:@"iPhone9,1"])    return @"国行、日版、港行iPhone 7";
    
    if ([platform isEqualToString:@"iPhone8,4"])    return @"iPhone SE";
    if ([platform isEqualToString:@"iPhone8,2"])    return @"iPhone 6s Plus";
    if ([platform isEqualToString:@"iPhone8,1"])    return @"iPhone 6s";
    if ([platform isEqualToString:@"iPhone7,2"])    return @"iPhone 6";
    if ([platform isEqualToString:@"iPhone7,1"])    return @"iPhone 6 Plus";
    if ([platform isEqualToString:@"iPhone6,2"])    return @"iPhone 5s";
    if ([platform isEqualToString:@"iPhone6,1"])    return @"iPhone 5s";
    if ([platform isEqualToString:@"iPhone5,4"])    return @"iPhone 5c";
    if ([platform isEqualToString:@"iPhone5,3"])    return @"iPhone 5c";
    if ([platform isEqualToString:@"iPhone5,2"])    return @"iPhone 5 (CDMA)";
    if ([platform isEqualToString:@"iPhone5,1"])    return @"iPhone 5 (GSM)";
    if ([platform isEqualToString:@"iPhone4,1"])    return @"iPhone 4S";
    if ([platform isEqualToString:@"iPhone3,3"])    return @"iPhone 4 (CDMA)";
    if ([platform isEqualToString:@"iPhone3,2"])    return @"iPhone 4 (GSM Rev A)";
    if ([platform isEqualToString:@"iPhone3,1"])    return @"iPhone 4 (GSM)";
    if ([platform isEqualToString:@"iPhone2,1"])    return @"iPhone 3GS";///< add
    if ([platform isEqualToString:@"iPhone1,2"])    return @"iPhone 3G";///< add
    if ([platform isEqualToString:@"iPhone1,1"])    return @"iPhone 1G";///< add
    
    // iPod touch
    if ([platform isEqualToString:@"iPod7,1"])      return @"iPod touch 6G";///< add
    if ([platform isEqualToString:@"iPod5,1"])      return @"iPod Touch 5G (A1421/A1509)";
    if ([platform isEqualToString:@"iPod4,1"])      return @"iPod Touch 4G (A1367)";
    if ([platform isEqualToString:@"iPod3,1"])      return @"iPod Touch 3G (A1318)";
    if ([platform isEqualToString:@"iPod2,1"])      return @"iPod Touch 2G (A1288)";
    if ([platform isEqualToString:@"iPod1,1"])      return @"iPod Touch 1G (A1213)";
    
    // iPad
    if ([platform isEqualToString:@"iPad7,6"])      return @"iPad 6 (Cellular)";///< add
    if ([platform isEqualToString:@"iPad7,5"])      return @"iPad 6 (WiFi)";///< add
    if ([platform isEqualToString:@"iPad7,4"])      return @"iPad Pro 10.5-inch (Cellular)";///< add
    if ([platform isEqualToString:@"iPad7,3"])      return @"iPad Pro 10.5-inch (WiFi)";///< add
    if ([platform isEqualToString:@"iPad7,2"])      return @"iPad Pro 12.9-inch 2nd-gen (Cellular)";///< add
    if ([platform isEqualToString:@"iPad7,1"])      return @"iPad Pro 12.9-inch 2nd-gen (WiFi)";///< add
    
    if ([platform isEqualToString:@"iPad6,12"])     return @"iPad 5 (Cellular)";///< add
    if ([platform isEqualToString:@"iPad6,11"])     return @"iPad 5 (WiFi)";///< add
    if ([platform isEqualToString:@"iPad6,8"])      return @"iPad Pro 12.9-inch (Cellular)";
    if ([platform isEqualToString:@"iPad6,7"])      return @"iPad Pro 12.9-inch (WiFi)";
    if ([platform isEqualToString:@"iPad6,4"])      return @"iPad Pro 9.7-inch (Cellular)";
    if ([platform isEqualToString:@"iPad6,3"])      return @"iPad Pro 9.7-inch (WiFi)";
    
    if ([platform isEqualToString:@"iPad5,4"])      return @"iPad Air 2 (Cellular)";
    if ([platform isEqualToString:@"iPad5,3"])      return @"iPad Air 2 (WiFi)";
    if ([platform isEqualToString:@"iPad5,2"])      return @"iPad Mini 4 (Cellular)";
    if ([platform isEqualToString:@"iPad5,1"])      return @"iPad Mini 4 (WiFi)";
    
    if ([platform isEqualToString:@"iPad4,9"])      return @"iPad Mini 3 (Cellular)";
    if ([platform isEqualToString:@"iPad4,8"])      return @"iPad Mini 3 (Cellular)";
    if ([platform isEqualToString:@"iPad4,7"])      return @"iPad Mini 3 (WiFi)";
    if ([platform isEqualToString:@"iPad4,6"])      return @"iPad Mini 2G (A1491)";
    if ([platform isEqualToString:@"iPad4,5"])      return @"iPad Mini 2G (A1490)";
    if ([platform isEqualToString:@"iPad4,4"])      return @"iPad Mini 2G (A1489)";
    if ([platform isEqualToString:@"iPad4,3"])      return @"iPad Air (A1476)";
    if ([platform isEqualToString:@"iPad4,2"])      return @"iPad Air (A1475)";
    if ([platform isEqualToString:@"iPad4,1"])      return @"iPad Air (A1474)";
    
    if ([platform isEqualToString:@"iPad3,6"])      return @"iPad 4 (A1460)";
    if ([platform isEqualToString:@"iPad3,5"])      return @"iPad 4 (A1459)";
    if ([platform isEqualToString:@"iPad3,4"])      return @"iPad 4 (A1458)";
    if ([platform isEqualToString:@"iPad3,3"])      return @"iPad 3 (A1430)";
    if ([platform isEqualToString:@"iPad3,2"])      return @"iPad 3 (A1403)";
    if ([platform isEqualToString:@"iPad3,1"])      return @"iPad 3 (A1416)";
    
    if ([platform isEqualToString:@"iPad2,7"])      return @"iPad Mini 1G (A1455)";
    if ([platform isEqualToString:@"iPad2,6"])      return @"iPad Mini 1G (A1454)";
    if ([platform isEqualToString:@"iPad2,5"])      return @"iPad Mini 1G (A1432)";
    if ([platform isEqualToString:@"iPad2,4"])      return @"iPad 2 (A1395+New Chip)";
    if ([platform isEqualToString:@"iPad2,3"])      return @"iPad 2 (A1397)";
    if ([platform isEqualToString:@"iPad2,2"])      return @"iPad 2 (A1396)";
    if ([platform isEqualToString:@"iPad2,1"])      return @"iPad 2 (A1395)";
    
    if ([platform isEqualToString:@"iPad1,1"])      return @"iPad 1G (A1219/A1337)";
    
    
    
    if ([platform isEqualToString:@"i386"])      return @"iPhone Simulator";
    if ([platform isEqualToString:@"x86_64"])    return @"iPhone Simulator";
    return @"未知设备";
}

- (NSString *)getDeviceReal {
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *platform = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    if ([platform isEqualToString:@"i386"])      return @"0";
    if ([platform isEqualToString:@"x86_64"])    return @"0";
    return @"1";
}

- (NSString *)deviceIPAdress {
    NSString *address = @"an error occurred when obtaining ip address";
    struct ifaddrs *interfaces = NULL;
    struct ifaddrs *temp_addr = NULL;
    int success = 0;
    
    success = getifaddrs(&interfaces);
    
    if (success == 0)
    { // 0 表示获取成功
        
        temp_addr = interfaces;
        while (temp_addr != NULL)
        {
            if (temp_addr->ifa_addr->sa_family == AF_INET)
            {
                // Check if interface is en0 which is the wifi connection on the iPhone
                if ([[NSString stringWithUTF8String:temp_addr->ifa_name] isEqualToString:@"en0"])
                {
                    // Get NSString from C String
                    address = [NSString stringWithUTF8String:inet_ntoa(((struct sockaddr_in *)temp_addr->ifa_addr)->sin_addr)];
                }
            }
            temp_addr = temp_addr->ifa_next;
        }
    }
    
    freeifaddrs(interfaces);
    return address;
}

@end
