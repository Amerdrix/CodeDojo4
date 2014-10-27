require 'spec_helper'
require 'dojo_rest'
require 'hash_user_builder'

describe 'load a user form the api' do
  let(:client) { DojoRest::Client.new(url) }

  context "when the url does not exist" do
    let(:url) { "http://api.randomuser.me/aoeu" }

    it "throws an error" do
      expect { client.get_user }.to raise_error(DojoRest::NotFoundException)
    end
  end

  context "when the url is correct" do
    let(:url) { "http://api.randomuser.me" }

    it "does not throw an error" do
      expect { client.get_user }.to_not raise_error
    end

    context "with a user" do
      subject(:user) { client.get_user }

      it "returns a user instance" do
        should be_instance_of DojoRest::User
      end
      it "has all the user parameters" do
        expect(user.name).to_not be_nil
        expect(user.password).to_not be_nil
        expect(user.gender).to_not be_nil
        expect(user.name).to_not be_nil
        expect(user.location).to_not be_nil
        expect(user.email).to_not be_nil
        expect(user.username).to_not be_nil
        expect(user.password).to_not be_nil
        expect(user.salt).to_not be_nil
        expect(user.md5).to_not be_nil
        expect(user.sha1).to_not be_nil
        expect(user.sha256).to_not be_nil
        expect(user.registered).to_not be_nil
        expect(user.dob).to_not be_nil
        expect(user.phone).to_not be_nil
        expect(user.cell).to_not be_nil
        expect(user.SSN).to_not be_nil
        expect(user.picture).to_not be_nil
      end
    end
  end

end

