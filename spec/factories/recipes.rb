FactoryBot.define do
	factory :recipe do
		title { 'Strogonoff' }
		recipe_type
		cuisine
		difficulty { 'Super-Hard' }
		cook_time { '20' }
		ingredients { 'Frango, creme de leite, cogumelos' }
	end
end