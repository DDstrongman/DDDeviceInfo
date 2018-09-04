# DDDeviceInfo


## 描述
**获取iOS设备信息的工具类**<br>
属性列表： <br>
```
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
**具体内容请参考.h文件内说明**

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
