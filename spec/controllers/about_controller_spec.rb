require "rails_helper"

RSpec.shared_examples "invalid or blank parameter" do
  it "doesn't create a new contact" do
    expect do
      post :create, params
    end.not_to change { Contact.count }
  end

  it "sets flash danger message" do
    post :create, params
    expect(flash[:danger]).not_to be_blank
  end

  it "doesn't send an email" do
    post :create, params
    expect(delivery).not_to have_received(:deliver_now)
  end
end

describe AboutController do
  let(:email) { "hovno@gmail.com" }
  let(:subject) { "hovno" }
  let(:message) { "ahoj hovno" }
  let(:verify_recaptcha_result) { true }
  let(:params) { { contact: { email: email, subject: subject, message: message } } }
  let(:delivery) { double(deliver_now: nil) }

  before do
    allow(controller).to receive(:verify_recaptcha).and_return(verify_recaptcha_result)
    allow(ContactMailer).to receive(:new_contact).and_return(delivery)
  end

  it "creates new contact with data provided in params" do
    expect do
      post :create, params
    end.to change { Contact.count }.by(1)

    last_contact = Contact.last

    expect(last_contact.email).to eq email
    expect(last_contact.subject).to eq subject
    expect(last_contact.message).to eq message
  end

  it "sets flash success message" do
    post :create, params
    expect(flash[:success]).not_to be_blank
  end

  it "tries to send an email" do
    post :create, params
    expect(delivery).to have_received(:deliver_now)
  end

  context "invalid email" do
    let(:email) { "hovno@olala" }

    include_examples "invalid or blank parameter"
  end

  context "blank subject" do
    let(:subject) { "    " }

    include_examples "invalid or blank parameter"
  end

  context "blank message" do
    let(:message) { "    " }

    include_examples "invalid or blank parameter"
  end

  context "invalid captcha" do
    let(:verify_recaptcha_result) { false }

    it "doesn't create a contact" do
      expect do
        post :create, params
      end.not_to change { Contact.count }
    end

    it "sets danger flash message" do
      post :create, params
      expect(flash[:danger]).not_to be_blank
    end

    it "doesn't send an email" do
      post :create, params
      expect(delivery).not_to have_received(:deliver_now)
    end
  end
end
