# frozen_string_literal: true

class StoryPolicy < ApplicationPolicy
  def destroy?
    @record.user.id == @user.id
  end

  def create?
    @record.user.id == @user.id
  end

  def show?
    @record.user.id == @user.id
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
