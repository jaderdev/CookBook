require 'rails_helper'

feature 'User view last recipes' do
	scenario 'successfully' do
		old = create(:recipe, title: 'Oldest recipe' )
		create(:recipe)
		create(:recipe)
		create(:recipe)
		create(:recipe)
		create(:recipe)
		create(:recipe)

		visit root_path

		expect(page).not_to have_content(old.title)
		expect(page).to have_css("div[class*='recipe-card']", count: 6)
		expect(page).to have_link('Ver todas', href: show_all_path)
	end

	scenario 'and view all recipes clicking in view all' do
		create(:recipe)
		create(:recipe)
		create(:recipe)
		create(:recipe)
		create(:recipe)
		create(:recipe)
		create(:recipe)
		create(:recipe)
		create(:recipe)
		create(:recipe)

		visit root_path
		click_on 'Ver todas'

		expect(current_path).to eq show_all_path
		expect(page).to have_css("div[class*='recipe-card']", count: 10)
		expect(page).to have_css('h3', text: 'Todas as receitas')
	end
end