---
title: "开始 node-webkit 前，你应该知道的"
date: 2014-07-28 12:00 +08:00
tags: node-webkit, 应用开发
keywords: node-webkit, 应用开发, 桌面开发
---

<aside class="aside">
  ![node-webkit](node-webkit-intro/nw.jpg)
</aside>

上周末在 [Teahour](http://teahour.fm/2014/07/22/node-webkit-with-rogerwang.html) 邀请到了 node-webkit 的作者[王文睿](https://twitter.com/wwr)来做客，聊了一下 node-webkit 的故事和 HTML5 技术在应用程序开发领域的发展，很有收获。最近几年，用 Web 技术来开发应用程序的框架层出不穷，如 node-webkit, Chrome Apps, Titanium, TideSDK, Atom Shell，而 node-webkit 正是这些框架中的一个佼佼者。

[node-webkit](https://github.com/rogerwang/node-webkit) 这个项目开始于 2011 年，是一个让开发者可以用 Web 技术，也就是 HTML5、CSS 和 JavaScript 来编写桌面程序的应用框架。作为开发者，我们只需要写一份代码，就能编译成跑在 Windows、Mac 和 Linux 下的应用程序。目前在 github 上，node-webkit 有将近 15000 个 Star，1600 个 Fork，可以说是由国人开发的一个非常流行的开源软件。在本期节目中，文睿介绍了目前使用 node-webkit 开发的一些典型应用，大致可以分成这么几类，

* 桌面开发 IDE，比如 [Light Table](http://www.lighttable.com/)
* 游戏，比如 [Brandon Must Die!](http://www.brandonmustdie.com/)
* 媒体类应用，比如 [Popcorn Time](http://popcorntime.io/)
* 工具软件，比如 [Haroopod](http://pad.haroopress.com/)
* 企业内部应用，比如数据显示应用
* 终端应用，比如 POS 机。

可以看出，领域非常丰富，其中也不乏一些设计精良体验优美的应用。可以说，很大程度上，这得益于目前硬件的性能提升和 Web 的发展，动画、图形、音频、视频、2D、3D、WebGL 等等，都让基于 HTML5 的应用开发充满了想象力。

从本质上来说，node-webkit 只是一个 web 应用的桌面运行环境。当我们说到桌面应用的时候，我们会想到需要有呈现给用户的界面，也需要能响应用户行为，跟系统打交道。那么，node-webkit 是怎么做到这点的。要了解这个，必须得先了解 node 和 webkit。

Node 是一个基于 Google Chrome V8 引擎的轻量级 Javascript 运行平台。Node 采用 C++ 编写，直接在操作系统的应用层上，支持很多系统级的 API，如文件操作、网络编程等，所以可以用来编写系统级应用或者服务端应用等。

Webkit 是 Web 内容的渲染引擎。举个例子，一个网页由 HTML、CSS 和 JavaScript 组成，页面加载后会被语法分析器解析成树，然后交由 Webkit 做渲染，这样才得到一个我们看到的页面。在 node-webkit 里，选择了是基于 Webkit 二次开发的 Blink 引擎，正好其 JavaScript 解析引擎也是 node 所采用的 V8 引擎。

由于浏览器安全模型的缘故，Webkit 并不能访问到系统调用，而这却是桌面应用的必须。Node 本身支持系统级的 API，但是缺乏对于渲染的支持，所以文睿在 2011 就有了做 node-webkit 的想法，把两者揉合在一起，既能对接操作系统，又能提供用户交互。在做简单尝试用 webkit-gtk 和 node 来做实验后，在 2012 年开始转向 Chromium，从一开始使用的 Chromium Embeded Framework（CEF）到后面完全基于 Chromium。

得益于 Node 和 Chromium 自身的蓬勃发展，node-webkit 也发展的很快，到今天已经发布到了 0.10 版本。下面来讲讲 node-webkit 的一些主要实现细节。

Node 是一个事件驱动的框架，消息处理基于 libuv 实现。Webkit 的 JS 引擎也是事件驱动的，是 Chrome 自己实现的 MessagePump。所谓事件驱动，简单说就是当某个事件发生的时候，比如有用户输入进来，去执行对应的处理代码。 所以，node-webkit 统一了 node 和 webkit 中的事件处理方式，在一个消息循环中去处理 node 里和 webkit 里的不同事件。

解决了事件处理统一的问题后，node 和 webkit 的揉合还需要互相能访问。node-webkit 里面存在着两个 context，node context 和 webkit context，互相访问也就是 Context 能互通，访问各自的对象。所以在 node-webkit 初始化的时候，node context 会被注入到 WebKit 里面。之后，Webkit context 就可以访问到 node context 了。

同时，node-webkit 对 Webkit 的安全模型也做了一些修改。在 node-webkit 中，有两种不同的 frames，node frame 和 normal frame[^1]。熟悉 Web 开发的朋友应该知道，对不同的站点发起一个 AJAX 请求会返回跨域错误，也就是 [Same-origin Policy](http://en.wikipedia.org/wiki/Same_origin_policy)。node-webkit 中的 normal frame，跟浏览器中的一样，仍然有这个限制。但是在 node frame 中，将不再有这个限制，所有的 node frame 中共享同一个 security token，包括 node context
和 webkit context，跨域访问被允许，也就能访问到 node context 中的对象。所以作为应用开发者，对于不受信任的用户行为输入一定要做保护，防止因为这个造成一些破坏性行为，或者放入 normal frame 中。

<aside class="aside">
  ![Chromium Layers](node-webkit-intro/chromium-layers.jpg)
  <small>Chromium Conceptual Application Layers</small>
</aside>

值得注意的是，尽管 Chrome 本身对于 HTML5 的支持已经比较完备了，但是有些特性是在浏览器层即上图的 Browser 实现，而 node-webkit 中 webkit 只到了 Content Layer 即上图的 WebContent，node-webkit 本身的实现等于浏览器层。所以，node-webkit 对于一些 HTML5 特性还缺乏支持，比如 Web Notification[^2]。不过，目前 Chromium 团队正在把这些 HTML5 特性的支持解耦移动到 Content Layer，这个对于 node-webkit 来说绝对是个非常好的消息。

如果你细心的看上图的话，你会发现浏览器层还有 UI 绘制部分。node-webkit 也是一样，实现了直接绘制原生 UI 控件的 API，比如菜单、系统托盘、剪贴板等。这部分实现，的确也是主要参考了 Chromium 的跨平台 UI 实现。

目前 node-webkit 的正式版是 0.10.0，基于 Node v0.11.13 和 Chromium 35.0.1916.113。node-webkit 的大版本更新策略是跟着 Chromium 的版本升级而升级，比如 0.10.0 中的 10。如果 node-webkit 本身有更新或者 node 版本有更新，对应升级的是第三个数字，也就是 0.10.0 中的最后一个 0。

如果你想了解最多 node-webkit 的信息，可以听听我们这期 [Teahour 节目](http://teahour.fm/2014/07/22/node-webkit-with-rogerwang.html)。如果你想开发跨平台的桌面应用，那么官方的 [Wiki](https://github.com/rogerwang/node-webkit/wiki) 绝对是个很好的开始。

[^1]: 对于 node-webkit 的安全模型，具体可以参考 https://github.com/rogerwang/node-webkit/wiki/Security, 了解如何使用这两种不同的 Frame。

[^2]: 目前已经有 [PR](https://github.com/rogerwang/node-webkit/pull/1951) 实现了 Notification，相信不久会在 node-webkit 正式版中被支持。
