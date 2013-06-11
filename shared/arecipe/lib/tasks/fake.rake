namespace :fake do
  task :generate => [:environment] do
    User.transaction do
      Ingredient.destroy_all
      FAKE_COOKING[:ingredients].length.times do
        FactoryGirl.create(:ingredient)
      end

      User.destroy_all
      40.times do
        FactoryGirl.create(:user)
      end

      Recipe.destroy_all
      1000.times do
        FactoryGirl.create(:recipe)
      end

      Like.destroy_all
      5000.times do
        FactoryGirl.build(:like).save
      end
    end
  end
end