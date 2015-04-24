class Project < Volt::Model
  field :title, String
  field :description, String

  validate :title, presence: true
end
