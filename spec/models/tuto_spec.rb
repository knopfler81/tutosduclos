require 'rails_helper'

describe Tuto do
  it { should have_many(:reviews)}
  it { should belong_to(:user)}
  it { should belong_to(:category)}
  it { should validate_presence_of(:title)}
  it { should validate_presence_of(:content)}
  it { should validate_presence_of(:description)}


  describe '#rating_average' do
    it "returns the rating average" do
      tuto = create(:tuto, title: "The Super", content: "The best tuto ever")
      [1, 5].each do |r|
        FactoryGirl.create(:review, rating: r, tuto: tuto)
      end
      expect(tuto.rating_average).to eq(3)
    end
  end
end
