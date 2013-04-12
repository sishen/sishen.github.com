---
title: "Teahour.fm, Static Site by Middleman"
date: 2013-04-09 10:00 +08:00
tags: teahour, middleman, static site
---

![TeahourFM](teahourfm-with-middleman/logo.png "Teahour.fm Logo")
<br/>
[Teahour.fm](http://teahour.fm) 是是由四位程序员 [Terry Tai](http://terrytai.com)，[Daniel Lv](http://lgn21st.com)，[Kevin Wang](http://knwang.com) 和我创立的聊天类节目，我们四人轮流担任主持人，每期节目自定话题并邀请对该话题深有研究的嘉宾，与大家一起分享话题背后的故事。Teahour 今年 一月十九号第一期，一周一期，到现在已经出了十一期，总共邀请了六位嘉宾，有超过一万次收听，内容涵盖 Ruby，Rails，JavaScript，Mobile，Git，个人成长，敏捷思想和开源文化多个方面。如果你是程序员但是还没听过 Teahour.fm，那赶紧听起来，不然就 old man 了，XD

这周团队在北京活动，顺便参加了 [Beijing Rubyist](http://www.bjrubyist.org/) 线下活动，分享了一些 [teahour.fm](http://teahour.fm) 网站设计和开发的一些思考。具体 slides 可以参考 [speakerdeck](https://speakerdeck.com/sishen/teahour-dot-fm)。

<script async class="speakerdeck-embed" data-id="724c59a081d00130b28222000a8e86c4" data-ratio="1.33333333333333" src="//speakerdeck.com/assets/embed.js"></script>

我们最终选择的是 [MiddleMan](http://middlemanapp.com “Hand-crafted frontend development”)，一个静态网站生成器。对于 teahour.fm，目前使用静态网站相对于动态网站来说是利大于弊。

* 不依赖数据库，不依赖解释器，只需要支持 HTML 就可以了
* Hosting 方便，目前是直接部署在 github pages，而不需要一个 VPS。
* 速度快，HTML 永远是最快的，前端也可以随便用 Apache，Nginx 这些高性能服务器。
* 写作方便，基本所有的静态网站生成器都是用 *Markdown*, *Textile* 这些模板语言，相对简单，可以本地编辑。
* 没迁移成本，不需要数据导入导出。
* 所有文件都有版本控制

当然，选择了静态网站也就失去了动态性。目前 teahour.fm 比较缺乏这三个功能。

* 切换 episodes 的时候不能走动画方式，而是整页刷新
* 不能做站内搜索，只能加 google 站内搜索
* 不能做站内评论，需要依托 disqus 这些评论解决方案

### MiddleMan ###

MiddleMan 做的取巧的地方是这个框架用的所有的东西都是你平时接触的东西，基本上你不需要去学习新的东西就可以直接上手使用。

1. 可以直接用 ERB, HAML, SCSS, LESS 等
2. 页面构成利用 Layouts 和 Partials
3. 有很多 view helpers，比如 link_to, image_tag
4. 使用 assets pipeline，基于 sprockets
5. 用 markdown 写文章

更多信息可以看 [这里](http://middlemanapp.com “Hand-crafted frontend development”)。

### How It Works ###

![Teahour Workflow](teahourfm-with-middleman/workflow.png)

1. 开始一篇新文章

    ```
    $ middleman article teahourfm-with-middleman
    ```

2. 编辑 Markdown 文件。我们使用的编辑器有 MacVim，TextMate 和 Aquamacs，:)

3. 构建整站 HTML

    ```
    $ middleman build
    ````

4. 部署

    ````
    $ cd build
    $ middleman deploy
    ````

如果你对 MiddleMan 项目组织方式感兴趣，可以查看 teahour.fm 源代码，目前我已经做了三个项目，包括本站，都是开源的。

* [Teahour.fm Sources](https://github.com/pragmaticly/teahour.fm)
* [Pragmatic.ly Blog Sources](https://github.com/pragmaticly/blog.pragmatic.ly)
* [Blog Sources](https://github.com/sishen/sishen.github.com)

### Other Choices ###

简单说一下我们当时还看过的其他构站方式。

#### [WordPress](http://wordpress.org) ####

说 WordPress 是目前最流行的构站方式都不为过。只是对于我们而言，做一个 WordPress theme 是事倍功半，不熟悉 PHP，要修改代码增删功能也不太方便。另外，我们不喜欢用 WordPress 的可见即可得编辑器。

#### [Rails](http://rubyonrails.org) ####

对于我们而言，用 Rails 搭一个 teahour.fm 应用是很简单的，但是问题是这么简单的应用有没有必要上 Rails 这个巨无霸套餐，数据库，后台，速度，等等是我们是我们直接跳过 Rails 的原因。

#### [Podrino](http://www.padrinorb.com/) ####

Podrino 号称是轻量级 ruby web 框架，最主要的特点是在 Sinatra 的基础上构建，而不依赖于 ActionPack。形象点说，Podrina 就是 Rails 1.*，那时只有些必须的功能，不像现在 Rails 给你提供了很多你可能不需要的特性。用 Podrino 是个不错的选择，比如 [robbin的自言自语](http://robbinfan.com) 就是用 Podrino 开发的。不过，我们还是不想走 Router，写 Controller，同时，直接写 View 或者存数据库都觉得缺乏写作乐趣。

#### [NestaCMS](http://nestacms.com/) ####

Podrino 相比 Rails 轻是因为他使用了 Sinatra 而非 ActionPack，但是因为它是一个通用 Web 框架，而非内容构建框架，所以我们觉得不方便。而 NestaCMS 就是一个专门的内容构建框架，也是基于 Sinatra，改进了我们所有放弃用 Podrino 的原因，不需要数据库，直接用 Markdown 或者 Textile 编写，甚至可以生成静态网站。而基于 Rack 的部署方式可以直接放到 [Heroku](http://heroku.com) 上。[PeepCode Blog](https://peepcode.com/blog) 就是 NestaCMS 的最好代言。说实话，我找不出不能用 NestaCMS 的原因，也许也就是不能放到 Gtihub Pages 和定制 theme 需要了解 NestaCMS 这个框架本身。

#### [Jekyll](https://github.com/mojombo/jekyll) ####

JekyII 是 GitHub Pages 的默认静态网站生成器，可以说目前很多新的静态网站生成器都是依托于 Jekyll 或者鉴戒了 Jekyll。Jekyll 为 Blog 而生，不太适合非 Blog 网站，比如 teahour。同时，复杂的 plugins 机制和 theme 定制都是伤心之处。

#### [Octopress](http://octopress.org/) ####

你是否觉得所有的 Octopress blog 长得一个德性？我是这么觉得的，直接 pass。

#### [Nanoc](http://nanoc.ws/) ####

Nanoc 是个好东西，满足我的所有要求，功能强大，甚至比我们选择的 MiddleMan 更强大，可惜学习曲线比较高，入门难，不利于和其他人协作。
