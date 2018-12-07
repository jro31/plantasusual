class RecipePolicy < ApplicationPolicy
  # REMEMBER
  # user == current_user
  # record == @recipe

  class Scope < Scope
    def resolve
        scope.all # ANYONE CAN VIEW ANY RECIPE. scope.all HAS THE SAME MEANING AS Restaurant.all.

      # scope.where(user: user)  # THIS WOULD MEAN THAT ONLY THE RECIPES OWNED BY THE CURRENT USER WOULD BE DISPLAYED
    end
  end

  # def new?
  #   return true
  # end

  def create?
    return true
  end

  def show?
    return true
  end

  # def edit?
  #   record.user == user
  # end

  def update?
    user_is_owner_or_admin?
  end

  private

  def user_is_owner_or_admin?
    # record.user == user || user.admin
    record&.user == user || user&.admin  # CHANGED TO THIS THANKS TO STACK OVERFLOW - I DON'T REALLY UNDERSTAND WHY, BUT IT WORKS

    # record.user == user IS EQUIVALENT TO:
    # if record.user == user
    #   return true
    # else
    #   return false
    # end
  end
end
