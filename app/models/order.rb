class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      record.errors.add attribute, (options[:message] || "is not an email")
    end
  end
end

class Order < ApplicationRecord
  enum spice_level: {
    mild: 10,
    hot: 20
  }

  PLATE_CENTS = 800
  SAUCE_CENTS = 50

  PLATES = (1..10)
  SAUCES = (0..10)

  validates :spice_level, inclusion: { in: spice_levels.keys, message: "%{value} is not a valid spice level" }
  validates_inclusion_of :plates, in: PLATES, message: "Must specify between 1 and 10 plates"
  validates_inclusion_of :extra_sauce, in: SAUCES, message: "Must specify between 0 and 10 servings extra sauce"
  validates :email, presence: true, email: true

  def price
    ((plates * PLATE_CENTS) + (extra_sauce * SAUCE_CENTS)) / 100.to_d
  end
end
