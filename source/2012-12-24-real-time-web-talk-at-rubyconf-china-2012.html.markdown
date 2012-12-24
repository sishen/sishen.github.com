---
title: "\'Real Time Web\' talk at RubyConf China 2012"
date: 2012-12-24
tags: rubyconf, rubyconf china, realtime, ruby
---

![rubyconfchina](/2012-12-24-real-time-web-talk-at-rubyconf-china-2012/rubyconfchina.png "Dingding @ RubyConf China")

很荣幸能有机会做为演讲嘉宾参加今年的 RubyConf China。今年是第四届中国 Ruby 大会。举办一次 RubyConf 并不轻松，做为 Daniel 的朋友，更加地清楚组织者的辛苦，在这里再次感谢两位组织者吕国宁 ([@lgn21st](https://twitter.com/lgn21st))和李华顺 ([@huacnlee](https://twitter.com/huacnlee))。

参加了过往的三界大会，这次参加更有感触，总得感觉就一个词: "进步"。举办方在进步，演讲嘉宾在进步，参会者也在进步。Ruby 社区在我眼里是个非常可爱非常开放的社区，可惜这次因事没有跟大家聊尽兴，略有遗憾。

这次我的主题是实时 Web 的各种技术方案和选择策略，主要基于我这三年的工作经验。我这三年主要在做两个产品。第一个是 Present.ly, 一个企业微博工具。往企业里加入社交元素，实时性会减少沟通成本，增强员工之间的交流协作。这个项目我在 2009 年末开始做，选用了 [BOSH](http://xmpp.org/extensions/xep-0124.html)，一种在 HTTP 协议上模拟双向连接的传输协议，基本属于 [COMET](http://en.wikipedia.org/wiki/Comet_(programming\)) 的变种，只是基于 [XMPP](http://xmpp.org/) 赋予了它更多的额外价值。第二个是 [Pragmatic.ly](https://pragmatic.ly)，我今年开始的创业项目。Pragmatic.ly 是一个轻量级的敏捷开发管理工具，实时性能让团队的所有成员随时保持在同一个节奏上，同时引导团队多交流。大家可以多试用多提意见，欢迎吐槽，:)。Pragmatic.ly 在实时技术上选用了 WebSocket，而非我之前一直使用的 BOSH。主要是在启动项目时有两方面考虑，第一是 XMPP 相对更重，前期开发时间和维护时间都会有所增加。第二是 WebSocket 标准已经正式发布，目前浏览器的支持也基本跟上。不过即使现在让我回过头重新来选，我还会继续选 WebSocket，欲知详情，请看视频，;p

关于这个主题的视频和 PPT，大家可以在 [railscasts-china.com/episodes/rubyconf-2012-yedingding](http://railscast-china.com/episodes/rubyconf-2012-yedingding) 观看。我们在 [ruby-china.org/topics/6870/topics/6870](http://ruby-china.org/topics/6870) 也有更深入的讨论，也感谢 qhwa ([@qhwa](https://twitter.com/qhwa)) 指出我在 Flash Socket 上的认识误区，[对Flash Socket的补充](http://ruby-china.org/topics/6891)。如果是用 Flash 方案的话，也可以自己定义通讯协议，自己写 server，基本就是写 Socket 程序那样子做。热烈欢迎大家多讨论，希望我这块砖抛出去能引来更多的玉，:)

### One More Thing

我在我的主题演讲结束的时候说过，我会和 Terry ([@poshboytl](https://twitter.com/poshboytl)) 重新录一下我之前在 RailsCasts China 做的 Live Show。一直在等 RubyConf China 视频放出来，现在终于可以正式开始了，:)。大致想法已经跟 Terry 沟通过了，我会基于 RubyConf China 这个主题做延伸，基于各种不同方案做实现，做成一个系列。大家对于这种方式如果有什么建议，欢迎留言。
