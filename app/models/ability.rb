class Ability
    include CanCan::Ability
  
    def initialize(user)
      user ||= User.new # guest user (not logged in)
  
      if user.role == 'admin'
        can :manage, :all
      else
        can :read, :all
        can :create, Post
        can :update, Post, user_id: user.id
        can :destroy, Post, user_id: user.id
        can :create, Comment
        can :update, Comment, user_id: user.id
        can :destroy, Comment, user_id: user.id
      end
    end
  end