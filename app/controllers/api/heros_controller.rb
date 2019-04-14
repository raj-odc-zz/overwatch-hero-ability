class Api::HerosController < ApplicationController
	def index
		heros = Hero.all
		render json: {heros: heros}
	end

	def show
		hero = Hero.find(params[:id])
		render json: {hero: hero}
	end

	def abilities
		hero = Hero.find(params[:id])
		render json: {abilities: hero.abilities}
	end
end
