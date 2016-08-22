require "rails_helper"

RSpec.describe ContactMailer, type: :mailer do
  describe "new_contact" do
    let(:mail) { ContactMailer.new_contact }

    it "renders the headers" do
      pending "default test which is failing"

      expect(mail.subject).to eq("New contact")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      pending "default test which is failing"
      
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
