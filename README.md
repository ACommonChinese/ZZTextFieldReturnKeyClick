# ZZTextFieldReturnKeyClick
做项目时遇到一个需求：封装一个TextField继承于UITextField, 点下键盘的return键:

1. 如果设置了代理，不影响代理方法的调用，如果有callback, 走callback
2. 如果不设置代理，有callback, 走callback

这个时候，想法是捕捉到按下键盘的return键时的方法，但发现没有对应的键盘通知，于是只有在它的delegate的方法`- (BOOL)textFieldShouldReturn:(UITextField *)textField`中作处理，但是如果封装的自己的TextField内部设置了delegate = self, 那在外部给textField设置代理就会冲突，即delegate这个指针只能指向一个对象。  
解决方法是hook代理方法并在内部作处理，让方法实现交换，可参见`ZZTextField` 和 `ViewController`

但我的这个做法太不优雅，如果用上第三方库 `Aspects` 来处理就会变得好的多，可参见 `ZZTextField_2` 和 `SecondViewController`，`Aspects`写的非常好，可见其作者对运行时的理解是多么的深入。要想看懂 `Aspects`，就需要有深厚的运行时功底。  

这个链接：<https://www.ianisme.com/ios/2019.html> 对运行时的解释不错，可以参考一下。本Demo的重点在于使用 `Aspects` 解决我在做项目时遇到的一个小问题。

**Note:**  
刚发现一个问题，在SecondViewController中，在textField_3中输入东西，然后点击键盘的return, textField_4的回调也被打印了，这点不对，正在研究中。若发现解决方法请联系我 liuxing8807@126.com

