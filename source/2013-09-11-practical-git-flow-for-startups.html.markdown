---
title: "实用 Git 工作流"
date: "2013-09-11 2:00 +08:00"
tags: 团队协作, git flow, 项目管理
disqus_identifier: "practical-git-flow"
---

 在 [「让代码审核成为你的团队习惯」](http://yedingding.com/2013/08/08/dig-into-code-review-process.html) 一文中，我们分享了我们团队做代码审核的一些经验心得，在微博上引起了热烈的讨论，引出了一些非常有意思的工作流介绍，比如下面的几点。

<blockquote>
    <p>我们有 master-dev 分支，比较大的功能才会新开 branch，小功能都是直接到 dev 上的，再加上团队在一起开发所以固定时间看昨日的代码，效果还不错。我们同样没有 QA，自己做的 ticket 也会找对方来做测试，但多是功能的完整性上的测试了。</p>
    <p><cite> - <a href="http://weibo.com/iamroody" target="_blank">@iarmroody</a></cite></p>
</blockquote>

<blockquote>
    <p>我们团队小，每个开发人员一个 git 分支，基本上工作不会互相打扰。我们的分支策略是，对于新功能，从主干开一个功能分支，然后每个开发在功能分支上开个人分支。合并时，先 BI（Backward Integration)，，再 FI（Forward Integration)。每周四定期合并，合并时 review。之所以放在周四，是因为如果合并出错，周五还有时间修复。</p>
    <p><cite> - <a href="http://weibo.com/u/2128792480" target="_blank">@施懿民</a></cite></p>
</blockquote>

每个团队都在寻找最适合自己团队的工作方法，希望能提高工作效率和团队协作。我们也是，这也是为什么我们除了代码审查之外，还需要过程审查这类的执行过程。像上面提到的两种方式，肯定也是在各自团队推行中觉得效果不错的，但是个人觉得在过程上在效率上还是有改进空间的，具体理由看下面，可以对比我们的目标和相应方式。目前我们使用的这一套 Git 工作流，是我们这几年不断的过程演进而来，目前 4 个人做 [Pragmatic.ly](https://pragmatic.ly) 在用，之前 10 个人做 Socialspring 也在用。个人觉得非常适合技术型创业团队。

在选择代码级别的项目管理工作流程的时候，我们希望能达到这样的目标：

* **能够持续交付**：我们没有固定的发布周期，而是一个更改通过审查就可以直接上线，这样我们才能很快地发布新的功能或者 bug 修复，也能快速地获得用户对修改的反馈。所以，有时一天里就会有好多次的发布。
* **方便代码审查**：我们很重视代码审查，具体可以看我们在[「让代码审核成为你的团队习惯」](http://yedingding.com/2013/08/08/dig-into-code-review-process.html) 的分享。所以这个流程必须对代码审查功能很友好。
* **使用代码沟通**：代码，是程序员沟通的最直接的手段。我们希望每一次的更改提交都是独立的，专注并只专注一件事情。这样，我们就很容易地去了解这次更改背后要传达的信息了。

所以，为了达到持续交付，我们必须随时有一个可发布的分支，同时，工作分支能很简单很早的 merge 过来。为了做到随时随地的代码审查，我们必须每一次更改都要有迹可循，且和其他更改没有交叉。为了方便代码沟通，我们必须有独立的分支来做独立的事。所以，像开头列出的两种方式，首先代码审查会很麻烦，因为代码容易混在一起，不够独立，做不到异步随时审查，而需要大家一起花时间专门执行代码审查。同时，会推迟 merge 的发生，带来的更多的不确定性，比如冲突的增加，时间的拖长等等，就更不要说持续交付了。所有这些，都是效率的杀手，是应该尽量去避免的。下面看看我们的工作流程。

![Git Flow in Pragmatic.ly](http://yedingding.com/images/practical-git-flow-for-startups/git-flow.png)

我们有三种性质的分支：1) Master  2) Feature or Bug 3) Staging。所有在时间线上的变化都只跟着 feature 或者 bug 走，跟人无关，也就是项目推进的自然法则。对了，版本控制系统我们用 Git，而不是 SVN，好处就不多讲了，主要是三点：1) 分布式 2) 建分支很容易 3) merge 很简单。如果你对这个不太了解，可以看看 [GitCafe](http://gitcafe.com) 的 [开始 Git 文档](https://gitcafe.com/beginning_git)。

#### Master 分支 ####

对于我们而言，master 分支是非常特别的，它必须是可以部署的分支，也就是通常意义上的 production。比如对于 [Pragmatic.ly](https://pragmatic.ly)，现在线上跑的等同于我们代码里的 master 分支。所以，master 上的任何代码更改都只能是从别的分支 merge 过来，在代码审查过后。

#### Feature or Bug 分支 ####

我们开发时不区分功能特性和 Bug，所有都一致按任务处理。所以，为了方便持续交付和代码审查，我们会人为的细分任务，比如在 9 月份，我们有下面这些任务计划。

![features and bugs](http://yedingding.com/images/practical-git-flow-for-startups/features-bugs.png)

我们在开始实现这个功能或者修复这个 bug 的时候，就基于 master 支持创建一个新分支。之所以基于 master，正是因为上面提到过 master 永远是可以部署的分支，那么基于 master 开的分支就可以直接被 merge 回 master 做发布。

    (yedingding)$ ~/Pragmatic.ly › git checkout -b 754_usage_analytics -t master
    Switch to a new branch named "754_usage_analytics"
    (terry)$ ~/Pragmatic.ly › git checkout -b 746_integrate_mobile -t master
    Switch to a new branch named "746_integrate_mobile"
    (roy)$ ~/Pragmatic.ly › git checkout -b 77_comment_via_email -t master
    Switch to a new branch named "77_comment_via_email"

从分支创建例子上来看，我们是按照 &lt;sid&gt;&#95;&lt;ticket title&gt; 的方式来命名。sid 是这个任务在 Pragmatic.ly 的任务 ID，ticket title 是任务在 Pragmatic.ly 上的标题概述。通过每个任务开发都基于 master 开新分支，就保证了，这个新分支能很容易的跟 master 做 diff 来做代码审查，然后被 merge 回 master。我们也把这种工作方式集成到了 [Pragmatic.ly](https://pragmatic.ly) 中，比如提交到 754&#95;usage&#95;analytics 的 commits 会自动关联到 Pragmatic.ly 这个任务的动态里，也可以在 commit 消息里加上 "ref #754", "resolved #754" 这样的文本，也会自动做关联，如下图。

![Activity](http://blog.pragmatic.ly/images/integrate-version-control-system-with-pragmat/vcs-integration.png)

这里，在创建 pull request 发布做代码审查前，我们需要先同步 master，也就是 merge master 到正在开发的分支，确保没有 break 和可以正常 merge。然后，团队其他成员会介入做代码审查，当然之前会要求齐全的测试，通过后就可以 merge 会 master 做发布了。用这种方法，需要注意的是，merge 必须得及时，不然如果留下很多个分支没有 merge 的话，解决冲突是个麻烦的事情，更不要说有时会遇到功能有依赖关系的情况时。

#### Staging 分支 ####

Staging 分支也是一个特殊的分支，是部署到我们的 staging 服务器上的版本。理想情况下，所有的更改做完代码审查后，在 merge 回 master 发布之前，会先 merge 到 staging 分支，发布到 staging 服务器做人工测试，通过后再 merge 到 master 发布到生产线上。所以，大部分时候，Staging 分支是 master 的一个备份保护，每次测尽可能少的改变。所以，还是会回到同一个注意点，要及时 merge。而且，有时候，根据任务的复杂度不同，我们可能不会通过 staging 而是会直接 merge 到 master 分支上线，比如一些简单的 bug 修复。

#### 关于 CI ####

目前，我们没有专门的 CI 服务器做持续集成测试，因为在我们团队的理解力，CI 并不是意味着必须有专门的 CI server，而是每个开发人员在提交代码时必须保证通过了集成测试。所以我们的做法是发出每个 Pull Request 的时候，必须确保我们所有的测试仍然通过。

#### Pull Request VS Merge Request ####

严格意义上来说，我们使用的是 Merge Request，而不是 Pull Request。Pull Request 要解决的问题是防止远程分支过多造成混乱，这样由每个开发人员建立自己的一个版本库，在自己的版本库建分支操作，然后往产品生产版本库发起一个 Pull 请求，同时，又要不断的跟远程的产品版本库同步保持一致，对于 10 个人以下的团队，个人感觉太重了。像[豆瓣](http://douban.com)这样的团队，为了利用好 Pull Request，专门开发了一整套工具链来自动做这些操作降低复杂度，小团队可能就没这个条件了。而对于开源项目来说，组织松散，Pull Request 是个非常好的方式。Merge Request 就是我前面一直提到的工作方式，一个远程代码库，多个分支来管理，简单直接。

### 总结 ###

以上就是我们代码级别的项目管理工作流程，希望对你有帮助。个人觉得这个流程很适合 lean 的敏捷创业团队，能快速迭代快速交付。你们是怎么做的呢，欢迎交流，可以在微博上直接 [@yedingding](http://weibo.com/presently) 或者 [@pragmaticly](http://weibo.com/pragmaticly)！
