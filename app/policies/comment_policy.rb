# frozen_string_literal: true

class CommentPolicy < ApplicationPolicy
  def create?
    @record.user.id == @user.id
  end

  def destroy?
    @record.user.id == @user.id
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
