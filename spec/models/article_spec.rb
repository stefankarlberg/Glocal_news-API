RSpec.describe Article, type: :model do
  describe 'Database table' do
    it { is_expected.to have_db_column :id }
    it { is_expected.to have_db_column :title }
    it { is_expected.to have_db_column :ingress}
    it { is_expected.to have_db_column :body }
    it { is_expected.to have_db_column :image }
  end

  describe 'Validations' do 
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:ingress) }
    it { is_expected.to validate_presence_of(:body) }
    it { is_expected.to validate_presence_of(:image) }
  end

  describe 'Factory' do
    it 'should have valid factory' do
      expect(FactoryBot.create(:article)).to be_valid
    end
  end

end
