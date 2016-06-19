class Group < ActiveRecord::Base
  belongs_to :user
  has_many :members, dependent: :destroy
  has_many :remainders, dependent: :destroy
  # accepts_nested_attributes_for :members, allow_destroy: :true
  accepts_nested_attributes_for :remainders, allow_destroy: :true
end
