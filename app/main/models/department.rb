class Department < Volt::Model
  field :title, String

  validate :title, presence: true

  has_many :projects
end
