FactoryBot.define do
  factory :ability do
    name { "Frag Launcher" }
		description	{ "Junkrat's Frag Launcher lobs grenades a significant distance. They bounce to reach their destination, and blow up when they strike an enemy" }
		is_ultimate { false }
		hero_id { create(:hero).id }
  end
end