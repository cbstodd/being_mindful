require "spec_helper"

describe UserMailer do
  describe "welcome_email" do
    let(:mail) { UserMailer.welcome_email }

    it "renders the headers" do
      mail.subject.should eq("Welcome email")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

end
