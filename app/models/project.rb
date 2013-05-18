class Project
  include Mongoid::Document
  belongs_to :user
  embeds_many :sensors

  field :name
  field :description
end
