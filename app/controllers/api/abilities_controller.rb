class Api::AbilitiesController < ApplicationController
	include ApiResponse
	def index
		per_page = params[:per_page] || 24
		current_page = params[:page] || 1
		abilities = Ability.all.paginate(page: current_page, per_page: per_page)

		render json: { data: abilities.as_json, per_page: per_page, metadata: pagination_meta(abilities) }
	end

	def show
		ability = Ability.find(params[:id])
		render json: {data: ability.as_json}
	end
end
