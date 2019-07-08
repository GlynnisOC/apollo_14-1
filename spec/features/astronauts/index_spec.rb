require 'rails_helper'

RSpec.describe 'astronaut index page' do
  describe 'as a visitor' do
    it "shows list of astronauts and details" do
      larry = Astronaut.create(name: "larry", age: 25, job: "sheriff")
      pete = Astronaut.create(name: "pete", age: 37, job: "commander")

      visit astronauts_path

      expect(page).to have_content(larry.name)
      expect(page).to have_content(larry.age)
      expect(page).to have_content(larry.job)

      expect(page).to have_content(pete.name)
      expect(page).to have_content(pete.age)
      expect(page).to have_content(pete.job)
    end

    it "has the average age for astronauts" do
      larry = Astronaut.create(name: "larry", age: 25, job: "sheriff")
      pete = Astronaut.create(name: "pete", age: 37, job: "commander")

      visit astronauts_path

      expect(page).to have_content("Average Age: 31")
    end
  end
end
