class CommentReportPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.admin?
        scope.all
      else
        scope.none
      end
    end
  end

  def create?
    return true
  end

  def index?
    user.admin
  end
end
