---
title: Nginx设置404页面
date: 2018-07-08 14:35:39
tags: 
 - Nginx
 - 404
categories:
  - 问题解决
photos: 
  - "https://ws1.sinaimg.cn/large/006tKfTcgy1ft2g5aerxcj31hy0n8n5e.jpg"
description: 最近在站点上设置了一下关于404页面的跳转, 因为不是很熟悉Nginx, 所以走了不少弯路, 此处记录一下, 希望可以帮助大家解决问题.
---

### 1. 404 页面

首先我们需要一个 404 的页面, 这个页面我把所有的 css 和 js 以及 html 放在一个页面中.存在的位置可以由你自行设置, 我存放的位置是服务器的 nginx 目录下. 名字叫做 404.html

```
/etc/nginx/error/404.html
```

### 2. nginx 配置文件

我们需要来配置一下 nginx.conf 文件中关于 404 错误页面的跳转

```
http {

  ...
  ...
  ...

  server {

    ...
    ...
    ...

    error_page 404 /404.html;
    location = /404.html {
        root /etc/nginx/error;
    }
  }  
}
```

网上能找到的也大多数都是这个样子, 然后就是反复试了多次还是没有任何作用. 最后找了一条关于 proxy_intercept_errors 的属性, 试了一下, 配置如下.

```
http {

  ...
  ...
  ...

  proxy_intercept_errors: on;

  ...
  ...
  ...

  server {

    ...
    ...
    ...

    error_page 404 /404.html;
    location = /404.html {
        root /etc/nginx/error;
    }
  }  
}
```

然后就可以了. 在配置的过程中, 曾有分号忘记添加而导致页面不正常显示, 大家这里也需要注意一下.
以上就是关于 nginx 上关于 404 页面的配置.
效果见[点击](https://blog.julysong.com/404)
