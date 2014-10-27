require 'timeout'
require 'spec_helper'
require 'dojo_rest'

describe 'load a users form the api' do
  let(:client) { DojoRest::Client.new(url) }
  let(:users_count) { 2 }

  context "when the url does not exist" do
    let(:url) { "http://api.randomuser.me/aoeu" }

    it "throws an error" do
      expect { client.get_users users_count}.to raise_error(DojoRest::NotFoundException)
    end
  end

  context "when the url is correct" do
    let(:url) { "http://api.randomuser.me" }


    it "does not throw an error" do
      expect { client.get_users 1 }.to_not raise_error
    end

    context "with users" do
      subject(:users) { client.get_users users_count}

      it "returns an array of users" do
        should be_instance_of Array
        expect(users.length).to eq(users_count)
        users.each do | user |
          expect(user).to be_instance_of DojoRest::User
        end
      end
    end
    context "when getting 50 users" do
      let(:users_count) { 50 }
      it "should not take longet than 5 seconds" do
        Timeout::timeout(5) do
          client.get_users users_count
       end
      end
    end
  end
end

