---
title: "Teahour: 与 Hawstein 和左程云聊算法和数据结构"
date: 2019-01-01 10:30 +08:00
disqus_identifier: "teahour-ep94"
tags: algorithm, teahour
keywords: 算法, teahour, algocasts
---

<aside class="aside">
  ![Teahour 94](algo-with-hawstein-and-chengyun/teahour-94.png)
</aside>

喜大普奔，年更节目 [Teahour](https://teahour.fm?utm_source=yedingding) 今天更新了！

上个月，看到嘉和（网名：[Hawstein](http://hawstein.com/?utm_source=yedingding)）把历经半年呕心沥血之作 [AlgoCasts](https://algocasts.io/?utm_source=yedingding) 第一次在互联网上传播，又让我回想起了之前做自由职业者的时刻。这既是创作的乐趣，又是奉献的乐趣。过去三年，基本没有再录制过 Teahour，但是这三年我却从这份经历中受益良多，不少 GrowignIO 的同事，都是通过 Teahour 跟我建立连接，让我有机会跟这些优秀的小伙伴一起共事。所以，当看到 AlgoCasts，又想起过去三年，少说也面试过几百个人，发现不少工程师在算法和数据结构这一方面还是有可以提高的空间的，就萌发了冲动要录一期 Teahour 来专门聊聊算法和数据结构。于是在 2019 年元旦，约上了[左老师](https://www.nowcoder.com/courses?utm_source=yedingding)，另一个我有幸在 GrowingIO 合作过的小伙伴，也是《程序员代码面试指南》的作者、牛客网算法课程初中高级的唯一授课老师，和嘉和一起在 Teahour 侃侃大山。

因为不可言语的原因，Teahour 被微信内嵌浏览器给封掉了，尴尬地只能把文章放到自己的博客，作为传播媒介。大家可以通过下面来收听本期节目。

<audio name="media" src="http://screencasts.b0.upaiyun.com/podcasts/teahour_podcast_94.m4a">
</audio>

如果之前没有订阅 Teahour 的读者，可以通过 iTunes 播客软件来订阅，URL 是 [http://itunes.apple.com/cn/podcast/teahour.fm/id608387170](http://itunes.apple.com/cn/podcast/teahour.fm/id608387170?l=en)。很快也会更新到荔枝FM和喜马拉雅上去。

总体来说，这期节目录得很爽，嘉和和程云都是很有思想的人，各自在追求自己的精彩。如同我在节目最后的 Share Picks 所分享，生命是一件很美妙的东西，我们究其一生，在跟很多人发生连接，我们在理解自己的同时，也在寻求存在的意义。我个人跟阿德勒个体心理学理论特别有共鸣的一点是，我们生活的意义，存在的意义，是为团队贡献力量。奉献，对他人产生兴趣，继而互助合作。所以，当嘉和在节目中提到“目前让他更有成就感的是通过自己的分享和输出，让他跟很多人发生了非物理的联系，并且这个过程中他感受到他的付出有意义”，这一点让我深有感触，Teahour 于我而言最大的意义就在于此。

生活其实非常奇妙，很多点状的付出，在未来某一个点，会连接成线，继而成面，让你感觉一切都是冥冥之中自有天意。在上个月，给团队分享了一下我的一些个人经历，很多行为都是非常随机，却给我持续带来了很大的受益。比如，我今天在 GrowingIO 能和嘉和能和程云一起合作，源于他们之前听了 Teahour，知道我的存在，知道我是怎样的一个人。我三年前之所以开始做 GrowingIO，源于我在 2014 年初写了一篇文章介绍了自己做风车的一些心路历程和经验，然后在美国波士顿的 Jason 读到了这篇文章主动联系了我，后续聊得很开心也有机会去美国在他那里呆了一段时间，机缘巧合下认识了目前 GrowingIO 的 CEO Simon。我之所以能写文章介绍风车的创业经历，源于我在 2010 年伊始接受了另外一个半球美国华盛顿（我人在杭州）的一家创业公司 Intridea 的邀请，建团队做一款新的企业社交产品，认识了 Terry、Ben 这两个后续风车的合伙人一起工作。目前 Terry 是 Nervos 的 CEO，Ben 是 ImToken 的 CEO，能有机会跟他们一起共事，也是我的一个荣幸。而之所以我能在 2010 年能有缘加入 Intridea，源于我在 2008 年做自由职业者的时候，主动参与了一个开源的项目 XRuby，认识了这个项目的发起人学勇并在后续两年一直一起做一些开源的项目。后来学勇加入了 Intridea，就把这个机会介绍给了我。而我能参与到 XRuby，源于我在 2006 年刚毕业的时候，一个师兄找我加入 Keep Discovering Team 一起做创业项目，我投入了所有的业余时间到里面，在过程中第一次接触了 Web 开发、接触了 Ruby，也因为此从网易出来后开始用这些技能做自由职业。一切事情的发生，都感觉非常随机，但是过程中的确有很多事情我并没有想要什么回报，而是单独的想做一些事，想把事情做好，然后有些事情，就自然而然发生了。

元旦前，跟产品团队小伙伴们一起吃饭的时候，雷小姐问到 2019 年每个人的个人目标是什么，我想了一下是希望能重启个人的品牌建设，希望今年能录一些节目，码一些字。这很大一部分也是受到嘉和的 [AlgoCasts](https://algocasts.io/?utm_source=yedingding) 的鼓舞，让我重新燃起了冲动，去分享别人的技术人生，去记录自己的个人感悟。这期节目中，我非常喜欢嘉和和程云的一个观点，其实从来没有想过放弃，因为本来这个就是一个爱好，一个自己乐在其中的东西。不要给自己设太大压力，好玩就行。所以，也许并不能做到那么规律，但是这是一个自己需要去投入的事情，一个自己需要去沉淀的事情。

<aside class="aside">
  ![Play For Fun](algo-with-hawstein-and-chengyun/play-for-fun.png)<br/>
</aside>

2019 年，以 Teahour 开始，很好。

<audio name="media" src="http://screencasts.b0.upaiyun.com/podcasts/teahour_podcast_94.m4a">
</audio>

## 广告时间

嘉和翻译的新书《反应式设计模式》（Reactive Design Patterns）已经上市。程云的《程序员代码面试指南》第 2 版也在预售中，特别指出第 2 版。有兴趣的同学可以考虑下。
