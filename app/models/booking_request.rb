class BookingRequest < ApplicationRecord
  belongs_to :user
  belongs_to :camper
  validates :user, presence: true
  validates :date_from, presence: true
  validates :date_to, presence: true
  validates :cost, presence: true
  validates_date :date_from, on_or_after: -> { Date.current }, message: "date must be after today"
  validates_date :date_to, after: -> { :date_from }, message: "date must be after the initial date"
  validates_each :camper do |record, attr, value|
    record.errors.add(attr, 'camper is not available for booking') unless value.available?(:date_from, :date_to)
  end
end
