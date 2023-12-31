# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the user here. For example:
    #
    #   return unless user.present?
    #   can :read, :all
    #   return unless user.admin?
    #   can :manage, :all
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, published: true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/blob/develop/docs/define_check_abilities.md


    return unless user.present?

    my_campaign_ids = Campaign
                        .left_joins(:dungeon_masters)
                        .left_joins(:players)
                        .where('campaigns.owner_id = ? OR dungeon_masters.user_id = ? OR players.user_id = ?', user.id, user.id, user.id)
                        .pluck(:id)

    # =========
    # Campaigns
    # =========
    can :create, Campaign
    can :read,
        Campaign,
        id: my_campaign_ids
    can :update, Campaign, owner: user
    can :destroy, Campaign, owner: user

    # =======
    # Players
    # =======
    can :read, Player

    # =============
    # PlayerInvites
    # =============
    can :read, PlayerInvite, campaign_id: my_campaign_ids
    can :create, PlayerInvite, campaign: { owner: user }
  end
end
