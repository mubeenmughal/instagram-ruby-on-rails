# frozen_string_literal: true

class LikePolicy < ApplicationPolicy
  def save_like?
    @record.user.id == @user.id
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
