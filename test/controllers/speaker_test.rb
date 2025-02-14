require "rails_helper"

RSpec.describe Speaker, type: :model do
  it "is not valid without a name" do
    speaker = Speaker.new(email: "test@gmail.com")
    expect(speaker.save).to be_falsey, "Saved the speaker without a name"
  end

  it "is not valid without an email" do
    speaker = Speaker.new(name: "Test, Test")
    expect(speaker.save).to be_falsey, "Saved the speaker without an email"
  end

  it "is not valid with an invalid email" do
    speaker = Speaker.new(name: "Test, Test", email: "invalid_email!com")
    expect(speaker.save).to be_falsey, "Saved the speaker with an invalid email"
  end

  it "is valid with a name and a valid email" do
    speaker = Speaker.new(name: "Andy, Test", email: "andycorrales7@gmail.com")
    expect(speaker.save).to be_truthy, "Did not save the speaker with a valid name and email"
  end
end
