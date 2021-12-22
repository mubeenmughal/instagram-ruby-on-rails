class UserPolicy < ApplicationPolicy

  def edit?
    @record.id == !@user.id
  end

  def show?
    @record.public_account? || @record.private_account?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end


end
