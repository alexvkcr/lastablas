class Shift < ActiveRecord::Base
  belongs_to :room
  has_many :offsprings, dependent: :nullify
  validates :day_of_week, :presence => true, numericality: { only_integer: true, greater_than_or_equal_to:1, less_than_or_equal_to:7 }
  validates :start_time, :presence => true
  validates :end_time, :presence => true
  validates :prebooked, :presence => true, numericality: { only_integer:true }
  validates_each :prebooked do |shift,room|
      shift.errors.add(:shift, "no puede ser mayor que la capacidad de la sala") unless shift.sites_available?
  end
  before_save :always_same_week

  def sites_available?
    return self.room.capacity- self.prebooked-self.offsprings.count > 0
  end

  def sites_available
    spare_seats = self.room.capacity- self.prebooked-self.offsprings.count
    #return self.room.capacity- self.prebooked-self.offsprings.count
    return spare_seats
  end

  private

    def always_same_week
      day=self.day_of_week
      #day=1 unless (1..7).include?(day)
      self.start_time ||= "00:00"
      self.end_time ||= "01:00"
    end
end
