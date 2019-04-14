class Api::AbilitiesController < ApplicationController
	def index
		abilities = Ability.all
		render json: {abilities: abilities}
	end

	def show
		ability = Ability.find(params[:id])
		render json: {ability: ability}
	end
end
