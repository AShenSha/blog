---
title: 阿里云免费Https证书申请使用
date: 2018-07-08 15:34:56
tags: 
  - 阿里云
  - https
  - Nginx
categories:
  - 问题解决
photos: 
  - "https://ws1.sinaimg.cn/large/006tKfTcgy1ft2hs8ps1wj30go08mjrg.jpg"
description: 超文本传输安全协议（英语：Hypertext Transfer Protocol Secure，缩写：HTTPS，常称为HTTP over TLS，HTTP over SSL或HTTP Secure）是一种透过计算机网络进行安全通信的传输协议。HTTPS经由HTTP进行通信，但利用SSL/TLS来加密数据包。HTTPS开发的主要目的，是提供对网站服务器的身份认证，保护交换数据的隐私与完整性。这个协议由网景公司（Netscape）在1994年首次提出，随后扩展到互联网上。本文主要介绍如何申请免费的https证书, 以及使用。
---

### 1. Why?(为什么要使用?)

> 传统的 HTTP 模式，存在着大量的灰色中间环节，相关信息很容易被窃取，但 HTTPS 却是通过认证用户与服务器，将数据准确地发送到客户机与服务器，并采用加密方式以防数据中途被盗取，大大降低了第三方窃取信息、篡改冒充身份的风险.

### 2. What?(优缺点各是什么?)

#### 优点:

> ##### 安全方面
>
> 1、使用 HTTPS 协议可认证用户和服务器，确保数据发送到正确的客户机和服务器;
>
> 2、HTTPS 协议是由 SSL+HTTP 协议构建的可进行加密传输、身份认证的网络协议，要比 http 协议安全，可防止数据在传输过程中不被窃取、改变，确保数据的完整性。
>
> 3、HTTPS 是现行架构下最安全的解决方案，虽然不是绝对安全，但它大幅增加了中间人攻击的成本。

#### 缺点:

> ##### 技术方面
>
> 1、相同网络环境下，HTTPS 协议会使页面的加载时间延长近 50%，增加 10%到 20%的耗电。此外，HTTPS 协议还会影响缓存，增加数据开销和功耗。
>
> 2、HTTPS 协议的安全是有范围的，在黑客攻击、拒绝服务攻击、服务器劫持等方面几乎起不到什么作用。
>
> 3、最关键的，SSL 证书的信用链体系并不安全。特别是在某些国家可以控制 CA 根证书的情况下，中间人攻击一样可行。
>
> ##### 成本方面
>
> 1、SSL 的专业证书需要购买，功能越强大的证书费用越高。个人网站、小网站可以选择入门级免费证书。
>
> 2、SSL 证书通常需要绑定 固定 IP，为服务器增加固定 IP 会增加一定费用。
>
> 3、HTTPS 连接服务器端资源占用高较高多，相同负载下会增加带宽和服务器投入成本。

此处不做多说, 以上主要参考[传送门](http://www.chinaz.com/web/2017/0224/663236.shtml#content-media5), 想了解的可以去参考.

### 3. How?(怎么做?)

> 以下的前提建立于你已有阿里云服务器.

#### 1. 找到证书服务

首先点击"产品与服务", 输入"证书", 选择"安全(云盾)"下的"SSL 证书(应用安全)", 如下图所示
![](https://ws3.sinaimg.cn/large/006tKfTcgy1ft2id5zvkbj31kw0baq5h.jpg)

#### 2. 购买证书

点击右侧按钮"购买证书", 跳转新页面
![](https://ws4.sinaimg.cn/large/006tKfTcgy1ft2ifk3af5j31kw09xafk.jpg)
此时跳转新页面, 可以看到价格不菲的证书
![](https://ws3.sinaimg.cn/large/006tKfTcgy1ft2ih2oj1wj31kw0qywou.jpg)
此时点击第四个 tab"Symantec"
![](https://ws4.sinaimg.cn/large/006tKfTcgy1ft2iib8kdtj31kw0qwtjm.jpg)
不需要被更加昂贵的价格吓到, 此时在证书类型里面选择"增强型 OV SSL"时, 会看到奇迹
![](https://ws3.sinaimg.cn/large/006tKfTcgy1ft2ikuy6vtj31kw0nu7ck.jpg)
是的, 你没看错, 免费的出现了.
此时, 按照正常流程进行购买.

免费证书的有几个缺点:

1.  年限短(1 年), 也就是说, 明年你需要继续购买
2.  不能使用通配符, 也就是说, 如果你有多个域名(子域名, 例如: a.test.com, test.com, b.c.test.com), 那么, 相应的如果你需要就要购买多个.

根据需要, 选择相应数量的证书, 然后去购买
![](https://ws4.sinaimg.cn/large/006tKfTcgy1ft2iple7dhj31kw0sqk0q.jpg)
支付流程走完之后, 跳转证书控制台, 我们可以看到购买成功的几个证书, 此时点击"补全", 进行信息完善
![](https://ws4.sinaimg.cn/large/006tKfTcgy1ft2irzzon2j31kw0fnjwv.jpg)
此后流程非常简单, 首先录入需要 https 的域名, 然后填写个人资料. 最后点击提交审核.
返回证书列表之后, 我们可以看到正在审核中的证书
![](https://ws2.sinaimg.cn/large/006tKfTcgy1ft2ixhdqokj31kw034dgg.jpg)
点击"进度"进入详情.
![](https://ws3.sinaimg.cn/large/006tKfTcgy1ft2j1z85rfj31kw0l3wlw.jpg)
此时看到"主机记录"和"记录值"
主机记录这里, 不清楚前面为什么有一个\_dnsauth. , 后面的 a 其实就是我刚才随便写的一个二级域名(a.lizi.com)
复制记录值, 进入左侧菜单"域名与网站(万网)"下面的"云解析(DNS)"

选择"解析设置"
![](https://ws1.sinaimg.cn/large/006tKfTcgy1ft2j8c5p84j31kw051t9a.jpg)
记录类型选择"TXT", 然后依次输入"主机记录", 也就是你的二级域名, 然后在"记录值"中填入刚刚复制的值
![](https://ws2.sinaimg.cn/large/006tKfTcgy1ft2jc2lnzbj31kw0tfn2g.jpg).
此时点击"确定", 等到审核即可, 审核的速度还是很快的.
![](https://ws2.sinaimg.cn/large/006tKfTcgy1ft2jgufbu4j31kw02uaau.jpg)
成功之后, 即可点击"下载"
根据服务器的不同, 选择不同的下载方式
![](https://ws1.sinaimg.cn/large/006tKfTcgy1ft2jiyfv5jj31kw0u6dny.jpg)
因为我是 Nginx, 所以选择第一个.
接下来存放证书, 以及 nginx 的配置信息都有给出, 如果不明白的, 还可以看下面的视频.
需要注意的是, 一定要替换

```
ssl_certificate   cert/214824738550150.pem;
ssl_certificate_key  cert/214824738550150.key;
```

这两个文件的名字, 我比较了一下, 配置信息中这串码和下载之后的文件中名字非常"相似", 但是不一样, 之前曾经因为这个地方查了很久.最后发现居然是名字不一样.
nginx reload 之后, 使用 https:// +你的域名, 即可访问你的网站了. 如果看到网页上的 https 不是绿色的, 则说明你的网站中含有 http 的请求, 需要更改替换.
但是不满足于此, 此时的网站同时支持 http 和 https, 我不想让人以 http 方式请求我的网站.
此时需要在 nginx 的配置文件中加上如下配置, 完整信息如下

```
http {

  ...
  ...
  ...

  server {

    ...
    ...
    ...

    if ($server_port = 80){
      return 301 https://$server_name$request_uri;
    }
    if ($scheme = http){
      return 301 https://$server_name$request_uri;
    }
  }

  ...
  ...
  ...

}
```

想要了解这两个 if 的含义, 可以另外自行查阅资料.
本章结束, 如果有不对的地方欢迎指出.
