class RecipeRelatePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    can_edit?
  end

  def destroy?
    can_edit?
  end

  private

  def can_edit?
    RecipePolicy.new.edit?
  end
end
