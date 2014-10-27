require 'spec_helper'
require 'dojo_rest'

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

    context "with a cached user" do
      subject { client.get_user }

      it "returner a user instance" do
        should be_instance_of DojoRest::User
      end
    end
  end
end

