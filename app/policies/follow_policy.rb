# frozen_string_literal: true

class FollowPolicy < ApplicationPolicy
  def create?
    @record.id != @user.id
  end

  def destroy?
    @record.id != @user.id
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
