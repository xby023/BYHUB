# BYHUB
轻量级弹窗
![Demo](https://raw.githubusercontent.com/xby023/BYHUB/master/BYHUBGIF.gif)

### 使用方法
* 引入第三方框架 **SnapKit**
* 方法调用

``` swift
 //调用成功HUB
 BYHUB.BYHUBManager.showSuccessHUB(info: "Success!")
 
 //调用失败HUB
 BYHUB.BYHUBManager.showErrorHUB(info: "Error,Try Again")
 
 //调用提示信息HUB
 BYHUB.BYHUBManager.showMessageHUB(info: "Early to bed, early to rise makes a man healthy, wealthy and wise")
 
 //调用加载HUB
 BYHUB.BYHUBManager.showLoadingHUB(info: "Loading...")
 //关闭HUB
 BYHUB.BYHUBManager.hiddenHUB(deadline: DispatchTime.now() + 2,showType: BYHUBShowType.BYHUBShowTypeLoading)
```