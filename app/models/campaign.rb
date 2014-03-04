class Campaign < ActiveRecord::Base
  has_many :nomination_sources
end
