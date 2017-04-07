## `ZXStructs-Swift`

>
通用UI配置，通用工具类
>
空余时间完善中....

- `Tags`：0.1.1

### `UIConfig`

#### `1、主体颜色配置使用`
- `ZXTintColorConfig.plist`

>
![colorConfig](https://github.com/iFallen/ZXStructs-Swift/raw/master/imgs/colorConfig.png)


- `使用:`

```
self.view.backgroundColor = UIColor.zx_backgroundColor
UIColor.zx_tintColor
UIColor.zx_borderColor
```

- `...`

#### `2、字体字号配置使用`
- `ZXFontConfig.plist`

>
![fontConfig](https://github.com/iFallen/ZXStructs-Swift/raw/master/imgs/fontConfig.png)

- `使用:`

```
颜色：
UIColor.zx_textColorTitle
UIColor.zx_textColorBody	
UIColor.zx_textColorMark

字体:
self.lbTitle.font   = UIFont.zx_titleFont (zx_bodyFont,zx_markFont)
self.lbTitle.font	= UIFont.zx_titleFont(20)

iconfont:
self.lbIconFont.font    = UIFont.zx_iconFont(30)
self.lbIconFont.text    = "IconFont,\u{e616}"

字号：
UIFont.zx_titleFontSize
```

- `...`

- `颜色、字体效果图`


|FIG1|
|--------|
|![fig1](https://github.com/iFallen/ZXStructs-Swift/raw/master/imgs/fig1.png)|


- [iconfont配置](http://www.iconfont.cn/plus/help/detail?helptype=code&spm=a313x.7781069.1998910419.14.1Nl48b)

#### `3、NavigationBar配置使用`
- `ZXNavBarConfig.plist`

>
![fontConfig](https://github.com/iFallen/ZXStructs-Swift/raw/master/imgs/navbarConfig.png)

- `启用配置:`

```
AppDelegate:
ZXStructs.loadnavBarConfig()
```

##### `扩展(设置navbar 左右两侧按钮):`

- `来自iconfont`

```
self.zx_navbarAddBarButtonItems(iconFontTexts: ["\u{e612}","\u{e613}"], fontSize: 30, color: UIColor.orange, at: .left)
```

- `来自纯文本`

```
self.zx_navbarAddBarButtonItems(textNames: ["Call"], font: nil, color: UIColor.white, at: .right)
```

- `来自图片`

```
self.zx_navbarAddBarButtonItems(imageNames: ["r1","r2"], useOriginalColor: true, at: .right)
```

- `自定义视图`

```
self.zx_navbarAddBarButtonItem(customView: view, at: .right)
```

- `事件`

```
override func zx_leftBarButtonAction(index: Int) {
	print("Left Action At Index:\(index)")
}

override func zx_rightBarButtonAction(index: Int) {
	print("Right Action At Index:\(index)")
}
    
```

- `修改颜色`

```
self.zx_setnavbarBackgroundColor(UIColor(red: r, green: g, blue: b, alpha: 1.0))
```

- `...`

- `NavBar 效果图`

|NAV1|NAV2|
|--------|--------|
|![nav1](https://github.com/iFallen/ZXStructs-Swift/raw/master/imgs/nav1.png)|![nav2](https://github.com/iFallen/ZXStructs-Swift/raw/master/imgs/nav2.png)|

|NAV3|NAV4|
|--------|--------|
|![nav3](https://github.com/iFallen/ZXStructs-Swift/raw/master/imgs/nav3.png)|![nav4](https://github.com/iFallen/ZXStructs-Swift/raw/master/imgs/nav4.png)|


#### `4、Tabbar配置使用`
- `ZXNavBarConfig.plist`

>
![fontConfig](https://github.com/iFallen/ZXStructs-Swift/raw/master/imgs/tabbarConfig.png)

- `启用配置:`

```
AppDelegate:
ZXStructs.loadtabBarConfig()
```

##### `扩展(添加controller)`

```
1.按钮从plist文件读取:
tabBar?.zx_addChildViewController(demoVC, fromPlistItemIndex: 0)
```

```
2.代码配置
let itemInfo                = ZXTabbarItem()
//Item 标题
itemInfo.title              = "不一样"
//未选中图片
itemInfo.normalImage        = "tabbarIcon4-normal"
//选中图片
itemInfo.selectedImage      = "tabbarIcon4-selected" 
//点击tabbar按钮是否present出来
itemInfo.showAsPresent      = false
//是否嵌入一层navigationcontroller
itemInfo.embedInNavigation  = true
tabBar?.zx_addChildViewController(ZXHHViewController(), fromItem: itemInfo)
```

```
3.系统方法
tabBar?.addChildViewController(vc)
```

- `修改颜色`

```
self.zx_settabbarBackgroundColor(UIColor.clear)
```

- `TabBar 效果图`

|有颜色|
|----|
|![tab1](https://github.com/iFallen/ZXStructs-Swift/raw/master/imgs/tabbar1.png)|

|无颜色|
|----|
|![tab1](https://github.com/iFallen/ZXStructs-Swift/raw/master/imgs/tabbar2.png)|

- `...`


### `CommonUtils`

- `ZXImagePickerUtils`
- `ZXAlertUtils`
- `更新中...`

### `Network`

- `更新中...`

### `RemoteNotification`

- `更新中...`

### `Router`

- `更新中...`

### `Web`

- `更新中...`

### `CommonUI`

- `更新中...`

---
>
- `基础版本使用见Demo`
- `方便自己、方便个别人`
