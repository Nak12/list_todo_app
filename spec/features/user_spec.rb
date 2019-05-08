require 'rails_helper'

RSpec.feature "Users", type: :feature do

  let(:user){User.create(email: 'lorem@lorem.com', password: "lorem123")}

  #Feature 1 - nivel 1
  context "Testing sign in and sign up" do 
    it "user sign in should be successful" do
      visit new_user_session_path
      within('form') do
        fill_in 'Email', with: user.email
        fill_in 'Password', with: user.password
      end
      click_button 'Log in'
      expect(page).to have_selector(".alert", text: "Signed in successfully.")
    end

    it "user sign up should be fail" do 
      visit user_session_path
      expect(page).to have_content("Sign up")
      within('form') do
        fill_in 'user_email', with: user.email
        fill_in 'user_password', with: user.password
        #fill_in 'user_password_confirmation', with: user.password  #-->Erro!
      end
      click_link "Sign up"
      expect(page).to have_content("6 characters minimum")
    end
  end

  #Feature 2 - nivel 1
  context "After logging in, the user can create a task list" do
    it "user sign in, create a list and then create a task" do 
      visit new_user_session_path
      within('form') do
        fill_in 'Email', with: user.email
        fill_in 'Password', with: user.password
      end
      click_button 'Log in'
      expect(page).to have_selector(".alert", text: "Signed in successfully.")
      click_link 'Listas de Tarefas'
      expect(page).to have_content('Nova Lista de Tarefas')
      click_link 'Nova Lista de Tarefas'
      expect(page).to have_content('Nova Lista')
      within('form') do 
        fill_in 'list_list_title', with: 'Titulo teste'
      end
      click_button 'Create List'
      expect(page).to have_selector(".alert", text: "Lista criada com sucesso.")
      within('form') do 
        fill_in 'task_task_title', with: 'tarefa1'
      end
      click_button 'Create Task'
      expect(page).to have_content('Tarefa concluída!')
    end
  end


end
