class Project < Volt::Model
  field :title, String
  field :description, String

  validate :title, presence: true

  belongs_to :department
end
