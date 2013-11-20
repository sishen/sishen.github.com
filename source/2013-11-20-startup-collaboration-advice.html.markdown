---
title: "小团队如何高效协作"
date: 2013-11-20 18:00 +08:00
tags: startup, collaboration, productivity
disqus_identifier: "startup-collaboration-advice"
---

<aside class="aside-block">
  <blockquote>
    <p>本文摘自我发表在 [《程序员》](http://programmer.csdn.net/) 杂志 10 月刊的文章。内容跟其他几篇博文有重叠的地方，大家凑合着看。</p>
  </blockquote>
</aside>

毫无疑问，[Stephen R. Covey](https://www.stephencovey.com/‎) 的[《The 7 Habits of Highly Effective People》](https://www.stephencovey.com/7habits/7habits.php)和 [David Allen](www.davidco.com/) 的 [《Getting Things Done: The Art of Stress-Free Productivity》](https://secure.davidco.com/store/catalog/GETTING-THINGS-DONE-PAPERBACK-p-16175.php) 是个人管理类的超级畅销书，让我们学会如何才能成为高效能人士。然而，即使团队里的所有人都是高效能人士，这个团队也不一定是 个高效能团队。我们常说“一个和尚有水喝，两个和尚挑水喝，三个和尚没水喝”，正是出于这个道理。顾名思义，团队协作是指所有团队成员之间协同、合作，里 面会有分工、沟通、协调，甚至会有妥协，所以我们需要一些规则和工具来帮助团队提高协作效率。本文的一些心得和实践来自于我在小团队（<10）的经验，并且在团队内部相互信任、目标一致的基础上，所以不涉及办公室人事管理，适合于创业型开发团队。

<aside class="aside">
  ![Same Goal](startup-collaboration-advice/collaboration-hands.jpg)
  &copy; [Ideachampions.com](http://www.ideachampions.com/weblogs/archives/2011/03/35_awesome_quot.shtml)
</aside>

### 目标一致

不仅要确保团队的长期目标一致，还要确保短期目标一致。如同在足球场踢球，刚开始比赛时，大家战术和思想都是一致的。而一旦进球后，就会出现有人想守，有人想攻的情况，这种不一致会造成局面被动并可能导致输球。创业团队也是如此。所以在任何时候，团队成员都要保持一致意见：现阶段的目标是什么，什么事情对团队最重要，然后所有做的事情都配合这个目标来完成。

READMORE

### 合理安排

小团队人少，永远有做不完的事，所以在做计划时总是害怕资源出现闲置而添加过多任务。我们一开始也是如此。但慢慢发现，这样不仅弄得团队身心俱疲，不停地赶进度，而且也会因为不停地延期导致团队很沮丧、压力过大影响工作的心情和状态。因此，现在每次迭代只会给大家 80%~90% 的工作量。有意思的是，很多时 候时间都是刚刚够。

<aside class="aside">
  ![Easier First](startup-collaboration-advice/easier-first.jpg)
</aside>

### 易者优先

如果讨论时遇到意见分歧，且这些不一致的意见不涉及对错，那么会很容易陷入各自试图说服别人接受自己观点的困境，纯属浪费时间。所以我们采用易者优先原则，设置了单任务最长讨论时间。 一旦超过讨论时间又无法达成共识，就会选择最简单的方案，先做出来，然后大家测试，最后再做改进，毕竟创业最需要的是进度，是前进。

### 免扰模式

确定项目计划后，我们就基本启动了免扰模式。我们不鼓励在工作时随意地打断别人，即使是一起在办公室工作时。在我们看来，每一次粗暴的打扰（例如电话、 IM）都是对效率的损害，我们更需要的是100%专注在要做的事情上。因此，我们要求每个人如果需要讨论，就先想清楚整个问题，然后在 Pragmatic.ly 或者 HipChat 里发出来。短时间来看可能回复会有延时，但从长期来看反而能让大家都能更深入的思考、更专注的工作。

尽量避免会议。只有一个例外是遇到困难需要头脑风暴时，因为开会比起文字是效率更高的选择。但只有任务涉及者才需要参与，而不需要浪费其他人的时间。

<aside class="aside">
  ![Sync the state](startup-collaboration-advice/pragmaticly.png)
</aside>

### 状态同步

团队人越多，沟通成本越高，尤其是需要知道团队的当前状态时，例如目前进度如何，接下来有哪些事情要做，做完的时候需不需要其他成员帮忙审查，或者有没有卡 在某些地方需要帮助。这些状态和信息同步是非常耗时的，我们更倾向于用眼睛看代替嘴巴说，而 Pragmatic.ly 就很好地满足了这点。项目里的所有信息和状态都会实时地同步给整个团队。

### 代码审查

作为开发团队，我们不一定能保证每个任务都有充足的测试覆盖而且也不追求 100% 覆盖率。但每一段代码、每一次修改，都必须有其他人来审查，通过后才能进入 主干。代码审查中可以发现当事者没考虑过的设计细节和一些实现上的 Bug，保证了软件质量。通过代码审查，每个人可以学习到其他人好的思维方式和编码方 式，也会提出做的不好的地方和改进意见，是整个团队在代码级别的另一种沟通和思考，促进了团队的成长。代码审查也能避免单点故障，万一出了问题，即使代码 编写者不在，仍然有其他人能立刻去修正。

<aside class="aside">
  ![Retrospective Meeting](startup-collaboration-advice/retrospective-meeting.jpeg)
</aside>

### 过程审查

除代码需要审查外，过程也是一个很有审查必要的事情。所以我们会不定时地一起进行一次简单的回顾，各自对这个周期的一些工作提出意见，然后在下一个周期里有针对性地改进。整个工作过程就是这样不断地在迭代式调整和改进，让我们根据自身的情况，实践出最适合团队的方式。

### 健康工作

要想工作好，身体先练好。一个健康的成员才可能高效地工作，每次运动过后，我都能感觉到身心得到放松，更加容易集中注意力，思维也更加的敏捷。所以我们团队每个人基本每天都会有至少一个小时的专门的运动时间，跑步、游泳，或者健身房，我们也会互相督促做比较，让运动成为一个团队习惯。

----
<span class="footnotes">
最后帮高大上朋友公司招人：

* Strikingly 招前端工程师，坐标上海，[要求看这](http://www.strikingly.com/apply?utm_source=yedingding)。了解团队请听[这期 Teahour](http://teahour.fm/2013/08/21/strikingly-yc-and-startup.html)。
* 课程格子招 Rails 工程师，坐标北京，[点这联系](mailto:joinus@creatingev.com)。了解团队请听[这期 Teahour](http://teahour.fm/2013/10/14/interview-with-tstyle11-about-kechenggezi.html)。
</span>
