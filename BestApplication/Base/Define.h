
//定义常量
//导航栏高度
#define kNaivgationBarHeight 44
//屏幕宽高
#define KSCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define KSCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

//内存管理安全释放对象
#define SAFE_RELEASE(x) [x release];x=nil

//判断系统的版本
#define kCurrentSystemVersion [[[UIDevice currentDevice] systemVersion] floatValue]

//判断是否是ios7或者更高的版本
#define IOS_VERSION_7_OR_LATER (([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)? (YES):(NO))

//当前系统的语言
#define kCurrentLanguage [[NSLocale preferredLanguages] objectAtIndex : 0]

//定义更高级的DLog
//#define DEBUG_MODE 1
#ifdef DEBUG
#define YF_Log(s,...) NSLog (@"<%p %@:(%d)> %@",self,[[NSString stringWithUTF8String:__FILE__] lastPathComponent],__LINE__,[NSString stringWithFormat:(s),##__VA_ARGS__])
#else
#define YF_Log(s,...)
#endif

//判断是不是真机
#if TARGET_OS_IPHONE
//操作
#elif TARGET_IPHONE_SIMULATOR
//操作
#endif


