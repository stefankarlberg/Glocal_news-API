RSpec.describe Category, type: :model do
  describe 'Database table' do
    it { is_expected.to have_db_column :name }
  end

  describe 'Validations' do 
    it { is_expected.to validate_presence_of(:name) }
  end

  describe 'Associations' do
    it { is_expected.to have_many(:articles)}
  end

  describe 'Factory' do
    it 'should have valid factory' do
      expect(FactoryBot.create(:category)).to be_valid
    end
  end
end
