class Camper < ApplicationRecord
  belongs_to :user
  has_many :booking_requests, dependent: :destroy

  def available?(date_from, date_to)
    bs = booking_requests.select do |b|
      (date_from >= b.date_from && date_from <= b.date_to) ||
        (date_to >= b.date_from && date_to <= b.date_to)
    end
    puts bs
    return bs.empty?
  end
end
