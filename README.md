# DDDeviceInfo

## 描述

本pods能获取的所有设备信息如下所示 <br>

**核心功能是实现了目前已知所有苹果设备的设备名称获取(deviceName字段)，更新至2020新设备发布后，并将持续维护更新** <br>

**设备列表(pods已更新至iPhone12 Max，示例代码不再更新)：** <br>

```objective-c
// iPhone
    if ([platform isEqualToString:@"iPhone12,5"])   return @"iPhone 11 Pro Max";
    if ([platform isEqualToString:@"iPhone12,3"])   return @"iPhone 11 Pro";
    if ([platform isEqualToString:@"iPhone12,1"])   return @"iPhone 11";
    if ([platform isEqualToString:@"iPhone11,8"])   return @"iPhone XR";
    if ([platform isEqualToString:@"iPhone11,6"])   return @"iPhone XS Max Global";
    if ([platform isEqualToString:@"iPhone11,4"])   return @"iPhone XS Max";
    if ([platform isEqualToString:@"iPhone11,2"])   return @"iPhone XS";
    if ([platform isEqualToString:@"iPhone10,6"])   return @"iPhone X";
    if ([platform isEqualToString:@"iPhone10,5"])   return @"iPhone 8 Plus (A1897)";
    if ([platform isEqualToString:@"iPhone10,4"])   return @"iPhone 8 (A1905)";
    if ([platform isEqualToString:@"iPhone10,3"])   return @"iPhone X Global";
    if ([platform isEqualToString:@"iPhone10,2"])   return @"iPhone 8 Plus (A1864/A1898/A1899)";
    if ([platform isEqualToString:@"iPhone10,1"])   return @"iPhone 8 (A1864/A1898/A1899)";
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
    if ([platform isEqualToString:@"iPhone6,2"])    return @"iPhone 5s Global";
    if ([platform isEqualToString:@"iPhone6,1"])    return @"iPhone 5s GSM";
    if ([platform isEqualToString:@"iPhone5,4"])    return @"iPhone 5c Global";
    if ([platform isEqualToString:@"iPhone5,3"])    return @"iPhone 5c GSM";
    if ([platform isEqualToString:@"iPhone5,2"])    return @"iPhone 5 (CDMA)";
    if ([platform isEqualToString:@"iPhone5,1"])    return @"iPhone 5 (GSM)";
    if ([platform isEqualToString:@"iPhone4,1"])    return @"iPhone 4S";
    if ([platform isEqualToString:@"iPhone3,3"])    return @"iPhone 4 (CDMA)";
    if ([platform isEqualToString:@"iPhone3,2"])    return @"iPhone 4 (GSM Rev A)";
    if ([platform isEqualToString:@"iPhone3,1"])    return @"iPhone 4 (GSM)";
    if ([platform isEqualToString:@"iPhone2,1"])    return @"iPhone 3GS";
    if ([platform isEqualToString:@"iPhone1,2"])    return @"iPhone 3G";
    if ([platform isEqualToString:@"iPhone1,1"])    return @"iPhone 1G";
    
    // iPod touch
    if ([platform isEqualToString:@"iPod9,1"])      return @"iPod touch 7";
    if ([platform isEqualToString:@"iPod7,1"])      return @"iPod touch 6G";
    if ([platform isEqualToString:@"iPod5,1"])      return @"iPod Touch 5G (A1421/A1509)";
    if ([platform isEqualToString:@"iPod4,1"])      return @"iPod Touch 4G (A1367)";
    if ([platform isEqualToString:@"iPod3,1"])      return @"iPod Touch 3G (A1318)";
    if ([platform isEqualToString:@"iPod2,1"])      return @"iPod Touch 2G (A1288)";
    if ([platform isEqualToString:@"iPod1,1"])      return @"iPod Touch 1G (A1213)";
    
    // iPad
    if ([platform isEqualToString:@"iPad11,4"])     return @"iPad Air 3";
    if ([platform isEqualToString:@"iPad11,3"])     return @"iPad Air 3 WiFi";
    if ([platform isEqualToString:@"iPad11,2"])     return @"iPad Mini 5";
    if ([platform isEqualToString:@"iPad11,1"])     return @"iPad Mini 5 WiFi";
    if ([platform isEqualToString:@"iPad8,8"])      return @"iPad Pro 3 (12.9-inch) (A1895/A1983/A2014)";
    if ([platform isEqualToString:@"iPad8,7"])      return @"iPad Pro 3 (12.9-inch) (A1895/A1983/A2014)";
    if ([platform isEqualToString:@"iPad8,6"])      return @"iPad Pro 3 (12.9-inch) (A1876)";
    if ([platform isEqualToString:@"iPad8,5"])      return @"iPad Pro 3 (12.9-inch) (A1876)";
    if ([platform isEqualToString:@"iPad8,4"])      return @"iPad Pro (11-inch) (A1934/A1979/A2013)";
    if ([platform isEqualToString:@"iPad8,3"])      return @"iPad Pro (11-inch) (A1934/A1979/A2013)";
    if ([platform isEqualToString:@"iPad8,2"])      return @"iPad Pro (11-inch) (A1980)";
    if ([platform isEqualToString:@"iPad8,1"])      return @"iPad Pro (11-inch) (A1980)";
    if ([platform isEqualToString:@"iPad7,6"])      return @"iPad 6 (Cellular)";
    if ([platform isEqualToString:@"iPad7,5"])      return @"iPad 6 (WiFi)";
    if ([platform isEqualToString:@"iPad7,4"])      return @"iPad Pro 10.5-inch (Cellular)";
    if ([platform isEqualToString:@"iPad7,3"])      return @"iPad Pro 10.5-inch (WiFi)";
    if ([platform isEqualToString:@"iPad7,2"])      return @"iPad Pro 12.9-inch 2nd-gen (Cellular)";
    if ([platform isEqualToString:@"iPad7,1"])      return @"iPad Pro 12.9-inch 2nd-gen (WiFi)";
    
    if ([platform isEqualToString:@"iPad6,12"])     return @"iPad 5 (Cellular)";
    if ([platform isEqualToString:@"iPad6,11"])     return @"iPad 5 (WiFi)";
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
    
    //AirPods
    if ([platform isEqualToString:@"AirPods2,1"])   return @"AirPods 2";
    if ([platform isEqualToString:@"AirPods1,1"])   return @"AirPods 1";
    
    //Apple TV
    if ([platform isEqualToString:@"AppleTV6,2"])   return @"AppleTV 4K";
    if ([platform isEqualToString:@"AppleTV5,3"])   return @"AppleTV 4";
    if ([platform isEqualToString:@"AppleTV3,2"])   return @"AppleTV 3(A1469)";
    if ([platform isEqualToString:@"AppleTV3,1"])   return @"AppleTV 3(A1427)";
    if ([platform isEqualToString:@"AppleTV2,1"])   return @"AppleTV 2";
    
    //Apple Watch
    if ([platform isEqualToString:@"Watch4,4"])     return @"Apple Watch Series 4 (A1976/A2008)";
    if ([platform isEqualToString:@"Watch4,3"])     return @"Apple Watch Series 4 (A1975/A2007)";
    if ([platform isEqualToString:@"Watch4,2"])     return @"Apple Watch Series 4 (A1978)";
    if ([platform isEqualToString:@"Watch4,1"])     return @"Apple Watch Series 4 (A1977)";
    if ([platform isEqualToString:@"Watch3,4"])     return @"Apple Watch Series 3 (A1859)";
    if ([platform isEqualToString:@"Watch3,3"])     return @"Apple Watch Series 3 (A1858)";
    if ([platform isEqualToString:@"Watch3,2"])     return @"Apple Watch Series 3 (A1861/A1891/A1892)";
    if ([platform isEqualToString:@"Watch3,1"])     return @"Apple Watch Series 3 (A1860/A1889/A1890)";
    if ([platform isEqualToString:@"Watch2,7"])     return @"Apple Watch Series 1 (A1803)";
    if ([platform isEqualToString:@"Watch2,6"])     return @"Apple Watch Series 1 (A1802)";
    if ([platform isEqualToString:@"Watch2,4"])     return @"Apple Watch Series 2 (A1758/A1817)";
    if ([platform isEqualToString:@"Watch2,3"])     return @"Apple Watch Series 2 (A1757/A1816)";
    if ([platform isEqualToString:@"Watch1,2"])     return @"Apple Watch 1 (A1554/A1638)";
    if ([platform isEqualToString:@"Watch1,1"])     return @"Apple Watch 1 (A1553)";
    
    //HomePod
    if ([platform isEqualToString:@"AudioAccessory1,2"])      return @"HomePod";
    if ([platform isEqualToString:@"AudioAccessory1,1"])      return @"HomePod (A1639)";
    
    if ([platform isEqualToString:@"i386"])      return @"iPhone Simulator";
    if ([platform isEqualToString:@"x86_64"])    return @"iPhone Simulator";
```
**获取其他属性列表：**<br>

```objective-c
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
@property (nonatomic, strong) NSString *idfa;
```



## Requirements

## Installation

DDDeviceInfo is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "DDDeviceInfo"
```

## Author

DDStrongman, lishengshu232@gmail.com

## License

DDDeviceInfo is available under the MIT license. See the LICENSE file for more info.
