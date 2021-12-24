# frozen_string_literal: true

class PostPolicy < ApplicationPolicy
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
