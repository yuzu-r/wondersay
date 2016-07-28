require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  describe "account_approved" do
    user = FactoryGirl.create(:user)
    let(:mail) { UserMailer.account_approved(user) }

    it "renders the headers" do
      expect(mail.subject).to eq("Wondersays: account approved!")
      expect(mail.to).to eq([user.email])
      expect(mail.from).to eq(["noreply@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
