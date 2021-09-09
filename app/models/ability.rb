# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(custumer)
    custumer ||= Custumer.new
    if custumer.is_admin?
      can :manage, :all
    end

    alias_action(:create, :read, :update, :destroy, to: :crud)

    can :crud, Book do |book|
      custumer == book.custumer 
    end

    can :crud, Comment do |comment|
      custumer == comment.custumer
    end

    can(:like, Book) do |book|
      custumer.persisted? && book.custumer != custumer
    end

    can(:destroy, Like) do |like|
      like.custumer == custumer
    end

  end
end
