class UserPolicy < ApplicationPolicy

  def edit?
    @record.user.id == @user.id
  end

  def show?
    @record.account_type = "private_account" || @record.id = @user.id
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end


end
