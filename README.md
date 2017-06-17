# bundel-.a
.a打包静态库、Bundle文件创建使用以及两者引用一些事
* 创建静态库 —— .a
    * 新建Library 工程
    ![Image text](https://raw.githubusercontent.com/lecochao/bundel-.a/master/img/1.png)
    
    * 小工程如此干净
    
    ![Image text](https://raw.githubusercontent.com/lecochao/bundel-.a/master/img/2.png)
    
    * 给工程添加一些类（其中图片、Storyboard、xcassets、vc 都有了）
    
    ![Image text](https://raw.githubusercontent.com/lecochao/bundel-.a/master/img/3.png)
    
    * 打包静态库 .a的一些设置
    ![Image text](https://raw.githubusercontent.com/lecochao/bundel-.a/master/img/4.png)
    
    * 把需要文件 添加进去
    ![Image text](https://raw.githubusercontent.com/lecochao/bundel-.a/master/img/5.png)
    
    * 再从Project 拖到 Public中 最后就是这样啦
    ![Image text](https://raw.githubusercontent.com/lecochao/bundel-.a/master/img/6.png)
    
    * 分别选择模拟器和真机 command +B 跑一下
    ![Image text](https://raw.githubusercontent.com/lecochao/bundel-.a/master/img/7.png)
    
    * 在这里就可以找到我们的.a了（这个只是Debug版本的，可以去修改Release版的）
    ![Image text](https://raw.githubusercontent.com/lecochao/bundel-.a/master/img/8.png)
    
    * 把模拟器和真机.a合成一个
    * lipo -create "真机版本.a静态库路径" "模拟器版本.a静态库路径" -output "合并后的.a静态库路径”
    ![Image text](https://raw.githubusercontent.com/lecochao/bundel-.a/master/img/9.png)
    
    * 到此 .a完了
* 创建Bundle文件—  .bundle
    * 创建一个bundle文件
    ![Image text](https://raw.githubusercontent.com/lecochao/bundel-.a/master/img/10.png)
    
    * 把需要打包资源文件打包进去
    
    ![Image text](https://raw.githubusercontent.com/lecochao/bundel-.a/master/img/11.png)
    
    * 设置一下 Base SDK — iOS版本
    ![Image text](https://raw.githubusercontent.com/lecochao/bundel-.a/master/img/12.png)
    
    * 同样的选择![Image text](https://raw.githubusercontent.com/lecochao/bundel-.a/master/img/13.png) command + B  跑一下，budle 文件就生成好了 
    ![Image text](https://raw.githubusercontent.com/lecochao/bundel-.a/master/img/14.png)
    
* .a 和Bundle文件的使用
    * 需要把bundle .a 和暴露出的 .h文件全部放到引用工程同一目录下
    ![Image text](https://raw.githubusercontent.com/lecochao/bundel-.a/master/img/15.png)
    
    * .a 和.h 如若不在同一个目录下  import 找不到的
    ![Image text](https://raw.githubusercontent.com/lecochao/bundel-.a/master/img/16.png)
    
    * 关于使用详见详见[dome](https://github.com/lecochao/bundel-.a/tree/master/Dome)
    ![Image text](https://raw.githubusercontent.com/lecochao/bundel-.a/master/img/17.png)
    
* 需要注意的问题
    * 最主要还是路劲问题，Storyboard等会取不出来。大家在创建的时候肯定还看到了其他创建Bundle的方式，或者说直接创建文件夹把资源文件放进去，然后改名为xxx.bundle也同样生成bundle文件。为何不用呢？
        * 就是因为资源文件取不出来，可能的原因
            * xib —> nib
            * png —>tiff
            * storyboard —>storyboardc
        * 目前流程生成的bundle改变了一下东西，未知探索中（有知道的欢迎探讨）…
    * “Unknown class XXViewController in Interface Builder file.”问题处理
        *  在静态库中写了一个XXViewController类，然后在主工程的xib中，将xib的类指定为XXViewController，程序运行等，也会报了如下错误：
        * “Unknown class XXViewController in Interface Builder file.”
        * 其实这个问题与Interface Builder无关，最直接的原因还是相关的symbol没有从静态库中加载进来。这种问题的处理就是在Target的”Build Setting”–>“Other Link Flags”中加上 -all_load 和 -ObjC 这两个标识位，这样就OK了。
    * bundle中的资源文件 被静态库.a 使用 ，需要普通加载bundle资源文件的方式加载，如：
    
    ![Image text](https://raw.githubusercontent.com/lecochao/bundel-.a/master/img/18.png)
    
        * 还有其他加载方式请自行查阅！
    *  bundle 加载的问题，（有知道的道友欢迎交流）...
        * (not yet loaded)  ，打印NSBundle会出来。
        * loadAndReturnError，error有值！The bundle’s executable couldn’t be located.
* 最后效果（详见[dome](https://github.com/lecochao/bundel-.a/tree/master/Dome)，gif软件坏了）
    * 第一个页面是主工程，push过去的是 静态库.a中的Storyboard创建的。
