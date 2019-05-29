RSpec.describe Review, type: :model do
  describe 'Database table' do
    it { is_expected.to have_db_column :id }
    it { is_expected.to have_db_column :score }
    it { is_expected.to have_db_column :comment }
  end

  describe 'Validations' do 
    it { is_expected.to validate_presence_of(:score) }
    it { is_expected.to validate_presence_of(:comment) }
  end

  describe 'Relations' do
    it { is_expected.to belong_to :article }
  end

  describe 'Factory' do
    it 'should have valid factory' do
      expect(FactoryBot.create(:review)).to be_valid
    end
  end
end