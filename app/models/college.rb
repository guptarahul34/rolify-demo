class College < ApplicationRecord
  rolify
  after_create :assign_default_role

  validate :must_be_present, on: :update

  def assign_default_role
    self.add_role(:newcollege) if self.roles.blank?
  end

  def must_be_present
    if !roles.any?
      errors.add(:roles, "must have atleast 1 role.")
    end
  end

end
