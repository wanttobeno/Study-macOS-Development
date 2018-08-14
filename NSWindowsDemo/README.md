
#### Mac多窗口Demo

Objc编写，Mac下实现子窗口，介绍三种方法

- oderFront 模式

父子窗口都可以单独响应鼠标事件
关闭窗口可以通过

```objc
[self.window orderOut:nil];
// 或者
 [self.window close];
```

- runModalForWindow 模态窗口

父窗口不响应鼠标事件

- beginModalSessionForWindow

beginModalSessionForWindow 和 endModalSession要配套使用。父窗口的按钮可以点击，但是不会被调用。

#### 注意
以上三种创建的窗口都是只分配一次内存空间，并不会重复分配。
特别添加了一个时间标签作为识别。

#### 隐藏窗口

隐藏窗口的方法同关闭窗口的方法

#### 参考资料

https://blog.csdn.net/y_zhangpengwei/article/details/50817132

https://blog.csdn.net/lovechris00/article/details/77922445




