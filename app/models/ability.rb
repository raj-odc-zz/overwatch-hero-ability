class Ability < ApplicationRecord
  belongs_to :hero
  validates_presence_of :name, :description

  def as_json
    {
      id: id,
      name: name,
      description: description,
      is_ultimate: is_ultimate,
      created_at: created_at,
      updated_at: updated_at
    }
  end
end
