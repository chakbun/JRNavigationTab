# JRNavigationTab




===========================
custom a navigaiton tab with NSLayoutConstraint, first time to use NSLayoutConstraint in code. it make me crazy , i just fell autolayout in storyboard and xib indeed is great!!!

i meet much trap in it and i will update it as soon as posstible！
translatesAutoresizingMaskIntoConstraints

===========================

JRNavigationTab 是个用在顶部切换的

#效果(demo)



#用法(how to use)
* 初始化 JRNavTabView

```obj-c
    
    //init JRNavTabView
    JRNavTabView *navTabView = [[JRNavTabView alloc] initWithItemsName:@[@"基本资料",@"健康报告"]];
```

* 样式设置

```obj-c
    
    //背景色 
    navTabView.bottomColor = [UIColor defaultThemeColor];
    
    //前景色
    navTabView.surfaceColor = [UIColor whiteColor];    
```

* 事件响应

依靠tabSelectedBlock处理响应

```obj-c
    
    navTabView.tabSelectedBlock = ^(NSInteger tabIndex) {
        [weakSelf showViewsWithTabIndex:tabIndex];
    };
    
    // 默认选择
    navTabView.seletedIndex = 0; 
```

*  最后

利用frame 或者 autolayout 加入需要显示的视图中

```obj-c
    [self.view addSubview:navTabView];
```






