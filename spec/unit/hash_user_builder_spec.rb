require 'spec_helper'
require 'dojo_rest'
require 'hash_user_builder'

describe 'load a user from json' do
  let(:json) { {"user" => {"gender"=>"male","name"=>{"title"=>"mr","first"=>"david","last"=>"cooper"},"location"=>{"street"=>"8013 e sandy lake rd","city"=>"tacoma","state"=>"california","zip"=>"53207"},"email"=>"david.cooper83@example.com","username"=>"brownlion837","password"=>"select","salt"=>"kp4EXpvy","md5"=>"48e870ea3be636e1c3afb9d847582233","sha1"=>"f94ad835e98119c97b8e2eb707d8edf9e358d76e","sha256"=>"c5b1e099d2dcf5e6a89df06f30c651028ebfcf777404e13e109dbfbbd4006356","registered"=>"1172900555","dob"=>"2531535","phone"=>"(530)-919-5345","cell"=>"(276)-932-9980","SSN"=>"171-82-1481","picture"=>{"large"=>"http://api.randomuser.me/portraits/men/53.jpg","medium"=>"http://api.randomuser.me/portraits/med/men/53.jpg","thumbnail"=>"http://api.randomuser.me/portraits/thumb/men/53.jpg"},"version"=>"0.4.1"} }}

  let(:builder) { DojoRest::HashUserBuilder.new }
  it "does not throw an error" do
    expect { builder.create_user_from_hash json }.to_not raise_error
  end

  context "with a user" do
    subject(:user) { builder.create_user_from_hash json }

    it "returns a user instance" do
      should be_instance_of DojoRest::User
    end
    it "user has name" do
      expect(user.name).to_not be_nil
      expect(user.password).to_not be_nil
      expect(user.gender).to_not be_nil
      expect(user.gender).to eq "male"
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