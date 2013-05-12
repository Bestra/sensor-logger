class Project
  include Mongoid::Document
  belongs_to :user
  has_many :sensors

  field :name
  field :description
end
