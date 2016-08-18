class User < ActiveRecord::Base
  has_secure_password
  has_many :attendees
  has_many :events, through: :attendees
  has_many :events_planned, source: :events
  has_many :comments

  validate :valid_state
  validates :password, length: {minimum: 8}, allow_nil: true
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
  validates :first_name, :last_name, presence:true

  def valid_state
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
