---
title: 重构 Rails 项目之最佳实践
date: 2013-03-04 13:52 +08:00
tags: Rails, Refactor
---

节前受 [Terry](http://terrytai.com "Terry Tai's Blog") 邀请帮助国内的一个公益项目 [Re-education](https://newclass.org "开放课堂, 设计和实践综合实践课的平台") 做代码重构。开放课堂项目是由[教育大发现社区](http://sociallearnlab.org/ "教育大发现")发起，成都 ThoughtWorks，成都彩程设计公司，成都超有爱教育科技有限公司等一起合作开发和运营的教育公益网站，是一个提供给小学3-6年级师生设计和开展综合实践课的教育开放平台。项目代码放在 [GitHub](https://github.com/twers/re-education)，采用 Ruby on Rails 作为开发框架。

很高兴我们 [Pragmatic.ly](https://pragmatic.ly) 团队能参与到这个公益项目的开发中，我相信这是个对社会很有价值的事情。征得发起方的同意，我把这次重构工作做成了一次在线秀，也正是因为这次这样的形式，和很多朋友直接在 [Join.me](https://join.me "Free Screen Sharing and Online Meetings") 上交流了很多 Rails 项目重构方面的想法。通俗点说，重构就是对内要通过修改代码结构等方法让代码变得更美，提高可阅读性和可维护性，而__对外不改变__原来的行为，不做任何功能的修改。所以我们做重构要做好两点: 1) 一次只做一件事情，不能修改了多个地方后再做验证 2) 小步增量前进，路是一步一步走出来的。同时，为了保证重构的正确性，必须要测试保护，每一次小步修改都必须要保证集成测试仍然通过。之所以要保护集成测试而非单元测试，正是因为重构只改变内部结构，而不改变外部行为，所以，单元测试是可能失败的(其实概率也不高)，而集成测试是不允许失败的。基于 Re-education 的代码，这次重构主要涉及了 Controllers 和 Models 两个方面。有兴趣的朋友可以去 [RailsCasts China](http://railscasts-china.com/episodes/refactor-openclass-by-dingding "#036 Refactor openclass by Dingding Ye") 观看视频。

Rails 做为一个 Web 开发框架，几个哲学一直影响着它的发展，比如 [CoC](http://en.wikipedia.org/wiki/Convention_over_Configuration "Convention over Congiuration"), [DRY](http://en.wikipedia.org/wiki/Don%27t_Repeat_Yourself "Don't Repeat Yourself")。而代码组织方式，则是按照 [MVC](http://en.wikipedia.org/wiki/Model%E2%80%93view%E2%80%93controller "Model–view–controller") 模式，推崇 "Skinny Controllers, Fat Models"，把应用逻辑尽可能的放在 Models 中。

让我们来看最实际的例子，来自 Re-education 的代码。

```ruby
class PublishersController < ApplicationController
  def create
    @publisher = Publisher.new params[:publisher]

    # trigger validation
    @publisher.valid?

    unless simple_captcha_valid? then
      @publisher.errors.add :validation_code, "验证码有误"
    end

    if !(params[:password_copy].eql? @publisher.password) then
      @publisher.errors.add :password, "两次密码输入不一致"
    end

    if @publisher.errors.empty? then

      @publisher.password = Digest::MD5.hexdigest @publisher.password
      @publisher.save!

      session[:user_id] = @publisher.id
      redirect_to publisher_path(@publisher)
    else
      p @publisher.errors
      render "new", :layout => true
    end
  end
end
```

按照 "Skinny Controllers, Fat Models" 的标准，这段代码有这么几个问题: 1) __action 代码量过长__ 2) __有很多 @publisher 的逻辑判断__。从权责而言，Controller 负责的是接收 HTTP Request，并返回 HTTP Response。而具体如何处理和返回什么数据，则应该交由其他模块比如 Model/View 去完成，Controller 只需要当好控制器即可。所以，从这点上讲，如果一个 action 行数超过 10 行，那绝对已经构成了重构点。如果一个 action 对一个 model 变量引用了超过 3 次，也应该构成了重构点。下面是我重构后的代码。

```ruby
class PublishersController < ApplicationController
  def create
    @publisher = Publisher.new params[:publisher]

    if @publisher.save_with_captcha
      self.current_user = @publisher
      redirect_to publisher_path(@publisher)
    else
      render "new"
    end
  end
end

class Publisher < ActiveRecord::Base
  apply_simple_captcha :message => "验证码有误"

  validates :password,
    :presence => {
      :message => "密码为必填写项"
    },
    :confirmation => {
      :message => "两次密码输入不一致"
    }

  attr_reader :password
  attr_accessor :password_confirmation

  def password=(pass)
    @password = pass
    self.password_digest = encrypt_password(pass) unless pass.blank?
  end

  private

  def encrypt_password(pass)
    Digest::MD5.hexdigest(pass)
  end
end
```

在上面的重构中，我主要遵循了两个方法。

1. 把应该属于 Model 的逻辑从 Controller 移除，放入了 Model。
2. 利用虚拟属性 password, password_confirmation 处理了本不属于 Publisher Schema 的逻辑。

关于简化 Controller，多利用 Model 方面的重构方法，[Rails Best Practices](http://rails-bestpractices.com/) 有不少不错的例子，也可以参考。

1. [Move code into model](http://rails-bestpractices.com/posts/25-move-code-into-model)
2. [Add model virtual attribute](http://rails-bestpractices.com/posts/4-add-model-virtual-attribute)
3. [Move finder to scope](http://rails-bestpractices.com/posts/1-move-finder-to-named_scope)

对于项目初期而言，做好这两个基本就够了。但是，随着逻辑的增多，代码量不断增加，我们会发现 Models 开始变得臃肿。这个时候，就意味着到了新的重构点。一般而言，我们有下面几种方法。

1. [__Concern__](http://en.wikipedia.org/wiki/Concern_(computer_science)

    Concern 其实也就是我们通常说的 Shared Mixin Module，也就是把 Controllers/Models 里面一些通用的应用逻辑抽象到一个 Module 里面做封装，我们约定叫它 Concern。而 Rails 4 已经内建支持 Concern, 也就是在创建新 Rails 项目的同时，会创建 app/models/concerns 和 app/controllers/concerns。大家可以看看 DHH 写的这篇博客 [Put chubby models on a diet with concerns](http://37signals.com/svn/posts/3372-put-chubby-models-on-a-diet-with-concerns) 和 Rails 4 的相关 [commit](https://github.com/rails/rails/commit/f6bbc3f582bfc16da3acc152c702b04102fcab81)。具体使用可以参照上面的博客和下面我们在 [Pragmatic.ly](https://pragmatic.ly "Lean Collaborative Project Management Tool") 里的实际例子。

    ```ruby
    module Membershipable
      extend ActiveSupport::Concern

      included do
        has_many :memberships, as: :membershipable, dependent: :destroy
        has_many :users, through: :memberships
        after_create :create_owner_membership
      end

      def add_user(user, admin = false)
        Membership.create(membershipable: self, user: user, admin: admin)
      end

      def remove_user(user)
        memberships.find_by_user_id(user.id).try(:destroy)
      end

      private

      def create_owner_membership
        self.add_user(owner, true)
        after_create_owner_membership
      end

      def after_create_owner_membership
      end
    end

    class Project < ActiveRecord::Base
      include Membershipable
    end

    class Account < ActiveRecord::Base
      include Membershipable
    end
    ```

    通过上面的例子，可以看到 Project 和 Account 都可以拥有很多个用户，所以 Membershipable 是公共逻辑，可以抽象成 Concern 并在需要的类里面 include，达到了 DRY 的目的。

2. [__Delegation Pattern__](http://en.wikipedia.org/wiki/Delegation_pattern)

    Delegation Pattern 是另外一种重构 Models 的利器。所谓委托模式，也就是我们把一些本跟 Model 数据结构浅耦合的东西抽象成一个对象，然后把相关方法委托给这个对象，同样看看具体例子。

    未重构前:

    ```ruby
    class User < ActiveRecord::Base
      has_one :user_profile

      def birthday
        user_profile.try(:birthday)
      end

      def timezone
        user_profile.try(:timezone) || 0
      end

      def hometown
        user_profile.try(:hometown)
      end
    end
    ```

    通过 delegate, 我们可以把代码变得更加的简单。

    ```ruby
    class User < ActiveRecord::Base
      has_one :user_profile

      delegate :birthday, :tomezone, :hometown, to: :profile

      def profile
        self.user_profile ||
          UserProfile.new(birthday: nil, timezone: 0, hometown: nil)
      end
    end
    ```

    关于更多的如何在 Rails 里使用 delegate 的方法，参考官方文档 [delegate module](http://apidock.com/rails/Module/delegate)

3.  Acts As XXX

    相信大家对 acts-as-list，acts-as-tree 这些插件都不陌生，acts-as-xxx 系列其实跟 Concern 差不多，只是它更有时不单单是一个 Module，而是一个拥有更多丰富功能的插件。这个方式在重构 Models 时也是非常的有用。还是举个例子。

    ```ruby
    module ActiveRecord
      module Acts #:nodoc:
        module Cache #:nodoc:
          def self.included(base)
            base.extend(ClassMethods)
          end

          module ClassMethods
            def acts_as_cache(options = { })
              klass = options[:class_name] || "#{self.name}Cache".constantize
              options[:delegate] ||= []

              class_eval <<-EOV
                def acts_as_cache_class
                  ::#{klass}
                end

                after_commit :create_cache, :if => :persisted?
                after_commit :destroy_cache, on: :destroy

                if #{options[:delegate]}.any?
                  delegate *#{options[:delegate]}, to: :cache
                end

                include ::ActiveRecord::Acts::Cache::InstanceMethods
              EOV
            end
          end

          module InstanceMethods
            def create_cache
              acts_as_cache_class.create(self)
            end

            def destroy_cache
              acts_as_cache_class.destroy(self)
            end

            def cache
              acts_as_cache_class.find_or_create_cache(self.id)
            end
          end
        end
      end
    end

    class User < ActiveRecord::Base
      acts_as_cache
    end

    class Project < ActiveRecord::Base
      acts_as_cache
    end
    ```

如果你在使用了这些方式重构后还是不喜欢代码结构，那么我觉得可能仅仅 MVC 三层就不能满足你需求了，我们需要更多的抽象，比如 Java 世界广而告之的 Service 层或者 Presenter 层。这个更多是个人习惯的问题，比如有些人认为应用逻辑(业务逻辑)不应该放在数据层(Model)，或者一个 Model 只应该管好他自己的事情，多个 Model 的融合需要另外的类来做代理。关于这些的争论已经属于意识形态的范畴，个人的观点是视需要而定，没必要一上来就进入 Service 或者 Presenter，保持代码的简单性，但是到了可适用范围，该引入时就引入。这里也给大家介绍一些我们在用的方法。

1.  __Service__

    之前已经提到 Controller 层应该只接受 HTTP Request，返回 HTTP Response，中间的处理部分应该交由其他部分。我们可以优先把这部分逻辑放在 Model 层处理。但是，Model 层本身从定义而言应该是只和数据打交道，而不应该过多涉及业务逻辑。这个时候我们就需要用到 Service 层。继续例子!

    ```ruby
    class ProjectHookService
      attr_reader :project, :data

      def initialize(hook_params = {})
        @project = Project.from_param(hook_params)
        @data = JSON.parse(hook_params['payload'])
      end

      def parse
        Prly.hook_services.each do |service|
          parser = service.new(@project, @data)
          if parser.parseable?
            parser.parse
          end
        end
      end

      def parseable?
        @project.present? && @data.present?
      end
    end

    class HooksController < ApplicationController
      def create
        service = ProjectHookService.new(params)
        if service.parseable?
          service.parse
          render nothing: true, status: 200
        else
          render text: 'Faled to parse the payload', status: 403
        end
      end
    end
    ```

    如果大家仔细分析这段代码的话，会发现用 Service 是最好的方法，既不应该放在 Controller，又不适合放在 Model。如果你需要大量使用这种模式，可以考虑一下看看 [Imperator](https://github.com/karmajunkie/imperator) 这个 Gem，算是 Rails 世界里对 Service Layer 实现比较好的库了。

2.  __Presenter__

    关于 Presenter，不得不提的是一个 Gem [ActivePresenter](https://github.com/jamesgolick/active_presenter)，基本跟 ActiveRecord 的使用方法一样，如果项目到了一定规模比如有了非常多的 Models，那么可以关注一下 Presenter 模式，会是一个很不错的补充。

    ```ruby
    class SignupPresenter < ActivePresenter::Base
      presents :user, :account
    end

    SignupPresenter.new(:user_login => 'dingding',
                        :user_password => '123456',
                        :user_password_confirmation => '123456',
                        :account_subdomain => 'pragmaticly')
    ```

基本上上面是我在一个 Rails 项目里重构 Controller 和 Model 时会使用的几种方法，希望对你有用。Terry Tai 上周在他的博客里分享了[他在重构方面的一些想法](http://terrytai.com/2013/02/15/refactor-session-for-re-education-in-thought-works.html)，也很有价值，推荐阅读。
