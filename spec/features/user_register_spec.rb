require 'rails_helper'

feature 'User autenticate on site' do
	scenario 'Successfully' do
		visit root_path
		click_on 'Criar Conta'
		fill_in 'Email', with: 'capybara@zoo.com.br'
		fill_in 'Password', with: '123456'
		fill_in 'Password confirmation', with: '123456'
		click_on 'Sign up'
		
		expect(current_path).to eq root_path
		expect(page).to have_content('Bem vindo capybara@zoo.com.br')
		expect(page).not_to have_link('Criar Conta')
	end

	scenario 'and sign in successfully' do
		user = create(:user)

		visit root_path
		click_on 'Entrar'
		fill_in 'Email', with: user.email
		fill_in 'Password', with: user.password
		click_on 'Log in'
		
		expect(current_path).to eq root_path
		expect(page).to have_content("Bem vindo #{ user.email }")
		expect(page).not_to have_link('Criar Conta')
		expect(page).not_to have_link('Entrar')
	end

	scenario 'and sign out successfully' do
		user = create(:user)

		visit root_path
		click_on 'Entrar'
		fill_in 'Email', with: user.email
		fill_in 'Password', with: user.password
		click_on 'Log in'
		click_on 'Sair'

		expect(current_path).to eq root_path
		expect(page).not_to have_content("Bem vindo #{ user.email }")
		expect(page).to have_link('Criar Conta')
		expect(page).to have_link('Entrar')
	end
end 