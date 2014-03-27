---
title: "创业成长，从分析开始"
date: 2014-03-27 20:00 +08:00
tags: 创业, 统计分析, Growth Hacker
disqus_identifier: 'growth-from-analytics'
keywords: 创业, 技术创业, 统计分析, Growth Hacker, Marketing
description: 本文叶玎玎介绍了对于一个技术创业团队，Growth Hacking 的具体方法，以及如何通过优秀的统计分析工具如 Mixpanel、KissMetrics、Usercycle 等来更好的成长。
---

<aside class="aside">
  ![Growth Hacker Definition](growth-from-analytics/growth-hacker-definition.jpg)
</aside>

最近一两年间，继 『Lean Startup』 之后，又有一个新的 *Buzz* 名词在创业圈子里很火：『Growth Hacker』。Growth Hacker 专指那群既懂技术又懂运营，以技术的手段来驱动市场运营的人才。这里姑且不论这个名词到底是不是被玩坏了，但是其定义的背后，是很多非常好非常值得学习的实战经验，称之为 Growth Hacking。维基百科上对 『Growth Hacking』 的定义是技术创业型团队通过数据分析和量化指标来推广产品时所使用的一种市场运营技术，其中有两个非常重要的点，分析和指标。一切分析的目的都是为了更好的了解你的用户，更好的了解你的产品对于用户的价值，并以指标化数据来指导我们的下一步工作。

对于创业者而言，每天我们的工作就是让产品能变得更好一点，让客户用得更舒服一点。但是，我们如何才能知道产品是在往好的方向走还是坏的方向走？当我们添加了一个功能后，我们如何知道用户是喜欢这个新功能还是讨厌之？我们又是否知道用户为什么喜欢我们的产品，亦或到底不喜欢哪些地方？我们每天都充满了这类的疑问，而回答这些疑问的最好方式莫过于寻找到那些隐藏在产品背后的真实数字，让数字说话，建立量化模型。只有这样，才能更好更快的成长。知易行难，我相信大部分创业者都知道数据驱动的价值，但是该如何去做去获取这些数据，又应该特别关心哪些数据却是知之甚少。下面就让我们围绕着『分析』这个中心，盘点一下优秀的统计分析工具及其背后的设计思想。

READMORE

### [Google Analytics](http://www.google.com/intl/zh-CN_ALL/analytics/index.html)

![Google Analytics](growth-from-analytics/google_analytics.png)

说起分析工具，估计 Google Analytics 是目前使用最广泛的，强大且免费。Google Analytics 主要给我们提供了几大关键指标：

* **页面浏览量（Page View）**：网站在某一段时间内的页面浏览量是多少。
* **用户浏览量（User View）**：网站在某一段时间内的用户浏览量是多少。
* **渠道来源（traffic sources）**：用户流量来源于哪些不同的渠道。
* **访客特征（User demographics）**：访问用户具有哪些特征值，用来做用户分类。
* **访问路径（Flow Report）**：用户在网站上的访问行为，各个页面的进入率和跳出率。

不难发现，整个 Google Analytics 的数据是以访问为中心的，可以很方便的了解网站的访问和渠道转化情况，可以说对于大部分的网站尤其是内容类网站来说已经足够。但是，对于像[『风车』](https://fengcheco.com) 这样的客户驱动型 SaaS 产品类网站，Google Analytics 就显得不合适了。比如说，当我知道了风车首页每天的访问量达到了一千或者一万，来自于[36氪](http://36kr.com)或者[我的博客](http://yedingding.com)的比例分别是多少，页面之间的转化率和退出率是多少等等这些访问信息，我下一步该怎么办，我该如何改进？不知道！对我来说，关键的数据不在于这些数字化的访问量，而是用户本身，真正有价值的是用户从访问到注册、从注册到使用、从使用到订阅服务，分别是怎样的一个过程。

所以，以访问为中心的分析工具并不足够，我需要的是以用户为中心的分析工具。目前，比较流行的两个选择是 Mixpanel 和 KissMetrics。

### [Mixpanel](https://mixpanel.com)

![Mixpanel](growth-from-analytics/mixpanel.png)

Mixpanel 从页面访问量数据的局限跳出来，转而以用户行为为驱动。Mixpanel 主要给我们提供了几大关键指标：

* **用户动态分析（Trends）**：你关心的用户行为发生了多少次，占总比例多少。
* **行为漏斗模型（Funnels）**：某些关键行为是怎么发生了，每一步有多少的留存率和流失率。
* **用户活跃度（Cohorts）**：网站用户的活跃度如何，可以用来区分忠实用户和普通用户。
* **单用户行为分析（People）**：单个用户在网站上做了哪些操作，过程是如何的。

所有的用户行为对应一个事件，你需要事先规划好你想跟踪哪些事件。比如以[风车](https://fengcheco.com)的注册转化率为例，我们希望了解所有访问的用户中，有百分之几的比例注册了，首次访问注册的比例是多少，这些用户是怎么注册的，是通过顶部的注册快捷按钮，还是查看产品信息后注册的，亦或是查看了其他如用户教程页面后注册的。在我们的首页，有多少用户是查看了产品一览图后就注册的，有多少用户是查看了更多的信息后注册等等，都是我们预设的一个事件。有了这些信息后，我们在提高注册转化率这个目标上，就能更有针对性更有方向性的做实验，也能很直观的了解到底每个变化是带来了提升还是降低。

### [KissMetrics](https://www.kissmetrics.com)

![KissMetrics](growth-from-analytics/KissMetrics.png)

KissMetrics 跟 Mixpanel 很类似，都是以用户行为为导向的分析工具，所提供的功能也基本一致。不过 KissMetrics 在针对用户的行为分析上做的更深入也更简单，能让你更加清楚地了解用户行为背后的各方数据。Mixpanel 也能做，就是需要更多的去学习它的功能。

至于是选用 Mixpanel 还是 KissMetrics，总体上来说我觉得都是很不错的分析工具，都可以去试试。如果你有所犹豫不知道该选哪个的话，我的建议是抓阄，:) 开个玩笑，我不建议浪费时间在选择上，重要的是开始做了。但是如果你真想评测一下哪个更适合你的产品场景，推荐尝试一下 [Segment.io](https://segment.io)，一个在各种统计分析工具前面的代理，可以同时使用 Mixpanel 和 KissMetrics，做结果比较，当然也就可以无缝地切换 Mixpanel 和 KissMetrics。

到此为止，现在我们已经有用户数据了，也知道问题在哪里，那么我们该如何来解决这些问题吗？前面也介绍过了，分析的目的是为了指导下一步工作，让执行更有方向性和目的性。这时就需要更加专业化的进阶分析工具，如 UserCycle、Customer.io 和 Optimize.ly。

### [UserCycle](http://usercycle.com)

![UserCycle](growth-from-analytics/usercycle.png)

UserCycle 的卖点很简单，你并不需要大量的数据，你真正需要的是每次专注一个指标，获取能让你用来提升这个指标的目标数据，进而提供执行的辅助。如果说 Google Analytics、Mixpanel 和 KissMetrics 是纯粹的分析工具的话，UserCycle 则做得更多，从统计到用户分组、从分组到生命周期维护、从生命周期到分组实验测试，各方面了解用户行为，提升用户的价值。

* **统计分析（Trends） & 用户分组（Cohorts）**：跟前面的几类一样，以用户行为为中心，让数据说话。也根据用户对于产品的参与程度不同，划分成不同的群组。
* **生命周期维护（Lifecycle Messaging）**：与用户不停的保持互动，既让客户更满意，也知道为何流失用户。基于之前的用户分组，方便根据用户的不同情况，采取不同的互动方式。
* **分组实验测试（Split-Test Experiments）**：当知道用户为什么喜欢你的产品或者讨厌你的产品的时候，你就可以有目的去改进产品了。在改进产品的时候可以多采用分组测试，看不同的变化带来的改进会有什么不同，寻找到最优解。

### [Customer.io](http://customer.io/)

![Customer.io](growth-from-analytics/customer.png)

Customer.io 做的事情比起来就简单多了，它也只做了整个分析过程中的某一点，**生命周期邮件（Lifecycle Email）**。一个产品的成功与否，关键在于看有多少忠诚的客户，邮件互动就是为了制造忠诚的客户。而邮件互动的关键又在于如何在正确的时间给正确的用户发正确的内容来提高邮件打开率。同样以[风车](https://fengcheco.com)为例，对于活跃的用户我需要跟用户互动的目标和跟一次性用户互动的目标显然会不同，所以也就不能给同样的邮件内容。所以，我必须了解用户之间的差异，基于用户的不同行为发送不同的邮件来互动，而这，就是 Customer.io 在解决的问题，专注在邮件互动这一块。

同类的产品还有 [Vero](https://www.getvero.com/)。不过风车目前没有在使用这些工具，一是因为 Cohorts 功能跟 Mixpanel 有所重复，二是因为邮件发送我们直接使用了 SendCloud，没必要再使用一套。但是这两个产品的创始人都是很好的 Growth Hacker，推荐订阅其产品的邮件列表。

### [Optimize.ly](https://www.optimizely.com/)

![Optimizely](growth-from-analytics/optimizely.png)

非常简单直接的标语，Optimize.ly 就是 A/B 测试的利器。A/B 测试对于现在的创业者来说已经不再陌生，但是如何去做以及怎么做对于很多人来说都略显陌生。当我们定义好我们想去尝试的实验，可以通过 Optimize.ly 非常简单的修改页面，然后剩下的就不用操心了，可以说即使是没有技术背景的市场人员也能很简单的学会如何做 A/B 测试。Optimize.ly 会根据用户行为的不同，给出不同的测试报告，让我们能真真切切的了解对于转化率的影响，持续的改进流程和页面来让产品变得更好。

除了 Optimize.ly，[Unbouce](http://unbounce.com/) 也是不错的 A/B 测试工具。或者你也可以不使用这类第三方工具，全部自己控制来做一些测试，只是相对会更耗时间，要权衡一下是否值得。

## 一切为了成长

了解和使用了上面所说的这么多工具，其实目的也非常明确，就是为了更好的成长。这正是 Growth Hacking 的核心目标。而成长，从分析开始。Dave McClure 曾对评估成长提出了一个很简单的 AARRR 指标模型：Acquisition（用户访问）、Activation（注册转化）、Retention（用户留存）、Referral（推荐分享）和 Revenue（客户转化）。所有的分析和执行正是为了提高这些数值。我们很幸运在现在这个时代，能有这么多人出来分享他们的经验，能看到有这么多优秀的应用能帮助我们更好的的成长。准备好了，以目标为导向，以数据为基础，善用第三方工具，不停的实验，不要害怕犯错，然后去享受这成长的过程吧。

## 广告时间

[风车](https://fengcheco.com?utm_content=techstartup)是一款以任务管理为基础，最适合技术创业团队的高效项目管理工具。创业路上，统计分析工具帮助你在市场上更好的成长，而风车协作工具则帮助你的团队更好的成长。[现在就开始！](https://fengcheco.com?utm_content=techstartup)

---

<span class="footnotes">
  It's easier to teach an engineer business than it is to teach a business person engineering. - by Paul Graham
</span>
