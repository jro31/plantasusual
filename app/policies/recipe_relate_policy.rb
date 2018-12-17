class RecipeRelatePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    return true
  end

  # private

  # def user_is_owner_or_admin?
  #   record.relater.user == user || user.admin
  # end
end
