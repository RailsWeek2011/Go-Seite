class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    can :read, :all

    if user.role? :admin
      can :manage, :all
    end
    if user.role? :fModerator
      can :manage, ForumArea
      can :manage, ForumThread
      can :manage, ForumPost
    end
    if user.role? :blModerator
    end
    if user.role? :tModerator
    end
    if user.role? :author
      can :create, ForumThread
      can :create, ForumPost
      can :edit, ForumPost, :user_id => user.id
    end
  end

end
