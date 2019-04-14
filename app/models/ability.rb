class Ability < ApplicationRecord
	belongs_to :hero
	validates_presence_of :name, :description

	def as_json
		{
      id: self.id,
			name: self.name,
			description: self.description,
			is_ultimate: self.is_ultimate,
			created_at: self.created_at,
      updated_at: self.updated_at
		}
	end
end
