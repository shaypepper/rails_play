class Event < ActiveRecord::Base
  belongs_to :user
  has_many :attendees
  has_many :users, through: :attendees
  has_many :comments

  validates :name, :date, :user, presence: true
  validates :state, :city, :date, presence: true
  validate :event_cannot_be_in_the_past, :event_must_be_in_us_state

  def event_cannot_be_in_the_past
    if date.present? && date < Date.today
      errors.add(:date, "can't be in the past")
    end
  end

  def event_must_be_in_us_state
    states = ["AK","AL","AZ","AR","CA","CO","CT","DE","FL","GA",
              "HI","ID","IL","IN","IA","KS","KY","LA","ME","MD",
              "MA","MI","MN","MS","MO","MT","NE","NV","NH","NJ",
              "NM","NY","NC","ND","OH","OK","OR","PA","RI","SC",
              "SD","TN","TX","UT","VT","VA","WA","WV","WI","WY"]
    if state.present? && !states.include?(state)
      errors.add(:state, "must be in the US")
    end
  end
end
