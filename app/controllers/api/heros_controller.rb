class Api::HerosController < ApplicationController
	include ApiResponse
	def index
		per_page = params[:per_page] || 24
		current_page = params[:page] || 1
		heros = Hero.all.paginate(page: current_page, per_page: per_page)

		render json: { data: heros, per_page: per_page, metadata: pagination_meta(heros) }
	end

	def show
		hero = Hero.find(params[:id])
		render json: {data: hero}
	end

	def abilities
		hero = Hero.find(params[:id])
		render json: {data: hero.abilities.as_json}
	end
end
