class PostPolicy < ApplicationPolicy

  def destroy?
    @record.user.id == @user.id
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
