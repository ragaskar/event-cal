class Event < ActiveRecord::Base
  belongs_to :venue
  delegate :name, :address, to: :venue, prefix: true
end
