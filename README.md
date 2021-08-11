# FrameAndBoundsDemo
测试frame和bounds的demo，以及探索UIScrollView的实现原理

frame是以父视图为坐标轴
bounds是以自身为坐标轴

```
// 1: 修改子视图的bounds的原点，不影响frame
    self.sonView.bounds = CGRectMake(10, 10, 50, 50);
    [self showLog];
    
    // 2: 修改父视图的bounds的原点，可以看到子视图的frame没变，但是显示的布局缺变了，往左上角偏移了(-10,-10)。bounds原点的改变总是和子视图相反，也就是x增大，那么，子视图往左移，x减小，子视图往右移，y同理。
    self.fatherView.bounds = CGRectMake(10, 10, 200, 200);
    [self showLog];
    
    // 3: 修改子视图的bounds的size，会保持子视图的中心点不变，缩放子视图大小，修改子视图的frame
    self.sonView.bounds = CGRectMake(10, 10, 100, 100);
    [self showLog];
```


UIScroll就是通过修改其bounds来修改添加在她上面的子视图的所在位置，但是子视图的frame保持不变。因此也不会触发子视图的`layoutSubviews`方法
