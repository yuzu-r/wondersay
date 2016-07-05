require 'rails_helper'
RSpec.describe Quote, type: :model do
  it "has a valid factory" do
    num_quotes = Quote.count
    q = FactoryGirl.create(:quote)
    expect(Quote.count).to eq num_quotes+1
  end
end

