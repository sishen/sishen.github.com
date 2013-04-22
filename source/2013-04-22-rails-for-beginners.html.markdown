---
title: "Rails 初学者指南"
date: 2013-04-22 17:42 +08:00
tags: rails, learning
disqus_identifier: rails-for-beginners
---

![DHH Talks About Rails And Beginner](rails-for-beginners/dhh-talks-about-rails-and-beginners.png)

今年 2 月初，我 和 [Daniel](http://lvguoning.com)，[Terry](http://terrytai.com)，[Kevin](http://knwang.com) 在 [Teahour.FM](http://teahour.fm) 上聊了一期 Ruby 与 Rails 的学习经历和对初学者的学习建议 [How to Learn Ruby and Rails](http://teahour.fm/2013/02/03/learning-ruby-and-rails.html)。而这竟然成为了目前 Teahour 这么多期里面最受欢迎的一期。Rails 4 发布在即，看上去 Rails 已经越来越不适合初学者学习。所以对于初学者而言，了解正确的学习方式无痛上路显得就格外重要。

我在 06 年底开始接触 Rails 的时候，Rails 版本还是 1.2，Ruby 版本 1.8.6。那时我主要是一个后端开发程序员，不懂 Web 开发，不会 HTML，CSS，JS。但是那时的 Rails 学习起来比较简单，特别是搭配着 [Agile Web Development With Rails (2nd Edition)](http://pragprog.com/book/rails4/agile-web-development-with-rails)，跟着例子走基本就了解了 Rails 的方方面面。再跟自己的已知的知识体系做结合，也算非常平滑的学习曲线。

而如今，你在学习 Rails 的时候，你会发现很多额外的东西，比如 CoffeeScript，Asset Pipeline。而 Rails 4 很多新特性如 Cache Digest (Russion-Doll caching), TuoboLinks，Frontend JavaScript MVC 友好更是会让新手直接晕掉。我们现在已经听到越来越多的新手抱怨 Rails 难学了。DHH 曾经发过一篇很有名的博文 [Rails is omakase](http://david.heinemeierhansson.com/2012/rails-is-omakase.html)，中文翻译版见[这里](http://ruby-china.org/topics/7791)。在 DHH 和 Rails Core Team 眼里，Rails 框架希望提供的是他们认为的 Web 开发的最佳实践，而这个最佳实践，必然跟他们过去这么多年的开发经历相关。在我看来，基本上 Rails 的框架演变过程跟 Web 开发技术的演变过程是一致的。但是对于初学者而言，在没有经历过足够的痛的前提下，要理解很多**改进**就成了一件不容易的事情。特别是当目前 Web 开发开始向前端倾斜的时候，对开发人员的素质要求越来越高，全能化，全栈化，摆在初学者面前的是个极大的挑战。

READMORE

**但是，我还是认为，Rails 是一个适合初学者学习的 Web 开发框架，只是在学习方法上需要有所改变。**

越思考这个问题，我越同意 Kevin 在第二期介绍的温室培养模式。他尽量会让初学者在温室环境中成长，也就是让他们了解最朴素的东西，而不用过多追求一些细节，以最快速度看到一个站点的建造过程。甚至 Ruby 语言的很多细节，元编程之类，都不需要在一开始了解。Rails 之于其他框架更适合初学者的原因在于它尽管代表着目前 Web 开发的先进浪潮，但是都提供了一个默认值。而这个默认值非常关键，它能让初学者免于选择也不用关心细节，几分钟就可以开始上手练习。这种方式会把一些开发上的痛延缓到了后期发生，也就是一些初学者在向中级水平发展时会经历的一段痛苦时光，但是这点恰恰在我认为是对初学者友好的。

从我自己的经历而言，我在键盘上敲点东西然后最后在浏览器里面看到真实效果，获得的成就感是最大的，也会让我自己更有动力去学习。这也是我认为 Agile Web Development With Rails (AWDWR) 这本书特别适合初学者学习 Rails 的原因，因为它让你关注如何去构建一个站点，其次让你关注如何用 Rails 去构建，内容循序渐进，很多 Rails 中相对高级的特性都放到了最后去介绍，而这些特性当你有了一定基础以后其实也就并不是那么的难了。美中不足的是，AWDWR 这本书中文版只出到第 2 版，跟最新的 Rails 版本脱节太久，而啃英文书对大多数初学者来说都不是一件容易的事情。虽然学好英语对于学好 Rails 是一个基本条件，但是我还是希望初学者能在一开始学习的时候少因为语言问题而多碰壁。这个问题目前来看并没有很好的解，不过希望 Terry 和我能在未来改善一下现状。如果时间上允许的话，我们很希望能原创一本面向初学者的中文书，当然，收费，XD

偷偷的说一下，这里有一段我未经 Terry 许可偷偷录的一段关于初学者应该如何学习 Rails 的讨论，非常值得大家收听，:)

<audio controls name="media">
  <source src="http://screencasts.b0.upaiyun.com/podcasts/rails_for_beginner.m4a" type="audio/mpeg">
</audio>

#### 相关资源 ####

* [Ruby China](http://ruby-china.org)  不说了，我们的大本营!
* [SegmentFault](http://segmentfault.com)  专业程序员问答社区，如果大家有 Ruby/Rails 方面的问题，这里是最纯粹的问答地方。
* QQ 群，群号 **231618869**。Terry 以前建的一个 Ruby/Rails 学习俱乐部，如果有问题也可以来这里发问。
* 新浪微群 [Ruby/Rails 学习俱乐部](http://q.weibo.com/1686875)
* [Learn Ruby on Rails](http://blog.ashchan.com/archive/2011/08/21/learn-ruby-on-rails/) Ash 写的一篇学习 Rails 的书籍推荐。


最后我要强调的是，学习编程最好的方法永远是 Code！Code！Code！。敲代码永远比只看书来的效果好，勤加练习才是王道。
