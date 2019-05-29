require 'rails_helper'

RSpec.describe Article, type: :model do
  describe 'Database table' do
    it { is_expected.to have_db_column :id }
    it { is_expected.to have_db_column :title }
    it { is_expected.to have_db_column :ingress}
    it { is_expected.to have_db_column :body }
    it { is_expected.to have_db_column :image }
    it { is_expected.to have_db_column :written_by }
    it { is_expected.to have_db_column :category_id }
  end

  describe 'Validations' do 
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:ingress) }
    it { is_expected.to validate_presence_of(:body) }
    it { is_expected.to validate_presence_of(:image) }
    it { is_expected.to validate_presence_of(:written_by) }
    it { is_expected.to validate_presence_of(:category_id) }
  end

  describe 'Association' do
    it { is_expected.to belong_to(:category) }
  end
  
  describe 'Factory' do
    it 'should have valid factory' do
    expect(FactoryBot.create(:article)).to be_valid
    end
  end  
end
