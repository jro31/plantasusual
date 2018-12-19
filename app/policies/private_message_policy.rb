class PrivateMessagePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(receiver: user).or(scope.where(sender: user))
    end
  end

  def create?
    return true
  end

  def show?
    record.sender == user || record.receiver == user || user.admin
  end
end
