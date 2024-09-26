class OfferPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.joins(:item).where(item: {user: user}).or(scope.where(user:user))
      # scope.where(user:user)
      # this is my item's offers                      # my offer to items belong to others
    end
  end

  def create?
    true
  end

  def edit?
    true
  end

  def update?
    true
  end

end
