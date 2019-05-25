RSpec.describe Category, type: :model do
  describe 'Database table' do
    it { is_expected.to have_db_column :name }
  end

  describe 'Validations' do 
    it { is_expected.to validate_presence_of(:name) }
  end
end
