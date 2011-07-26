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
      can :manage, GermanGoLeague
    end
    if user.role? :tModerator
      can :manage, TournamentResult
      can :manage, TournamentPlayer
      can :manage, TournamentInformation
    end
    if user.role? :author
      can :create, ForumThread
      can :create, ForumPost
      can :update, ForumPost, :user_id => user.id
      can :edit, ForumPost, :user_id => user.id
    end
  end

end
