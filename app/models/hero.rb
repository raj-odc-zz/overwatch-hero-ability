class Hero < ApplicationRecord
	has_many :abilities

	validates_presence_of :name, :real_name, :health, :armour, :shield
  validates_numericality_of :health, :armour, :shield
end
