class RecipeReportPolicy < ApplicationPolicy
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

  def update?
    user_is_admin?
  end

  private

  def user_is_admin?
    user.admin
  end
end
