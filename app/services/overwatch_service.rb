class OverwatchService
	include HTTParty

	BASE_URL = 'https://overwatch-api.net/api/v1/hero/'

	def replicate_data(url = BASE_URL)
		response = HTTParty.get(url)
		raise "API is not responding properly, please try again" unless response.code == 200
		
		response['data'].each do |hero_data|
			hero = Hero.create(hero_attr(hero_data))
			set_abilities(hero_data['url'], hero)
		end

		get_api_data(response['next']) if response['next']
	end

	def set_abilities(url, hero)
		response = HTTParty.get(url)
		raise "API is not responding properly, please try again" unless response.code == 200
		
		response['abilities'].each do |ability|
			hero.abilities.create(ability_attr(ability))
		end
	end


	private

	def hero_attr(hero)
		{
			name: hero['name'],
			real_name: hero['real_name'],
			health: hero['health'],
			armour: hero['armour'],
			shield: hero['shield']
		}
	end

	def ability_attr(ability)
		{
			name: ability['name'],
			description: ability['description'],
			is_ultimate: ability['is_ultimate']
		}
	end
end