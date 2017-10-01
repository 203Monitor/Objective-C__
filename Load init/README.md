# load init
看看+load和+initialize方法

+load会在整个文件被加载到运行时，在 main 函数调用之前被 ObjC 运行时调用的钩子方法

+load 可以说我们在日常开发中可以接触到的调用时间最靠前的方法，在主函数运行之前，load 方法就会调用。

由于它的调用不是惰性的，且其只会在程序调用期间调用一次，最最重要的是，如果在类与分类中都实现了 load 方法，它们都会被调用，不像其它的在分类中实现的方法会被覆盖，这就使 load 方法成为了方法调剂的绝佳时机。

但是由于 load 方法的运行时间过早，所以这里可能不是一个理想的环境，因为某些类可能需要在在其它类之前加载，但是这是我们无法保证的。不过在这个时间点，所有的 framework 都已经加载到了运行时中，所以调用 framework 中的方法都是安全的。

需要注意的是，load方法务必实现的精简一些，也就是要尽量减少其所执行的操作，因为整个应用程序在执行load方法时都会阻塞。如果load方法中包含复杂的代码，那么应用程序在执行期间就会变的无响应。实际上，凡是想通过load在类加载之前执行某些任务的，基本都做得不太对。其真正用途在与调试程序，比如可以在分类中编写此方法，用来判断该分类是否已经正确载入系统中。也许此方法一度很有用处，但现在完全可以说：时下编写Objective-C代码时，不需要用它。

+initialize会在第一次调用类方法时被调用
initialize方法只应该用来设置内部数据。不应该在其中调用其他方法，即便是本类自己的方法，也最好别调用。因为稍后可能还要给那些方法添加更多的功能。如果某个全局状态无法在编译期初始化，则可以放在initialize里面来做。下列代码演示了这种用法：
@interface EOCClass : NSObject

@end

#import "EOCClass.h"

static const int kInterval = 10;
static NSMutableArray *kSomeObjects;

@implementation EOCClass

+ (void)initialize {
    if (self == [EOCClass class]) {
    kSomeObjects = [NSMutableArray new];
    }
}

@end
整数可以在编译期定义，可变数组不行，因为其是个Objective-C对象，所以创建实例之前必须先激活运行期系统。注意，某些Objective-C对象也可以在编译期创建，例如NSString实例。

