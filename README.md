# ZZTextField


本 Demo 的重点在于使用 `Aspects` 解决我在做项目时遇到的一个小问题。

## 需求

封装 `ZZTextField` 继承于 `UITextField` , 点击 `return` 键:

1. 有 `callback`, 走 `callback`
2. 如果也有 `delegate`，同样调用

## 想法

捕捉到按下 `return` 键时的方法，但没有发现对应的键盘通知。

只能在它的 `delegate` 方法`- (BOOL)textFieldShouldReturn:(UITextField *)textField`中作处理，但是如果自己封装的 `ZZTextField` 内部设置了 `delegate = self`, 那么外部再给 `TextField` 设置代理就会冲突，即 `delegate` 这个指针只能指向一个对象。  

**解决方法**是 `hook` 代理方法并在内部作处理，让方法实现交换，可参见`ZZTextField` 和 `ViewController`

但上述做法太不优雅，如果用上第三方库 `Aspects` 来处理就会变得好的多，可参见 `ZZTextField_2` 和 `SecondViewController`。 

`Aspects` 写的非常好，可见其作者对 `Runtime` 的理解是多么的深入。要想看懂 `Aspects`，就需要有深厚的 `Runtime` 功底。  

## 链接

- [HomeiOS
Objective-C Runtime 1 小时入门教程
](https://www.ianisme.com/ios/2019.html) 对`Runtime` 的解释不错，可以参考一下。


