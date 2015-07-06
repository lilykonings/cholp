class Creator < ActiveRecord::Base

  belongs_to :user
  has_many :prints

end
