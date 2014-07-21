require 'rails_helper'

RSpec.describe Post, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"

  let(:user) { FactoryGirl.create(:user) }
  before do
    @post = user.posts.build(content: "Menna" )
    
  end
  subject { @post }

  it { should respond_to (:content) }
  it { should respond_to (:user_id) }
   it { should respond_to (:user) }
     it "should have the same user " do
     	
     end


  it { should be_valid }

  describe "when user id is not present" do
  	before { @post.user_id = nil }

  	it { should_not be_valid }

  
   end
   describe "with blank content" do
     before { @post.content = "" }
       it { should_not be_valid }

   end

    describe "with content that is too long"  do

      before { @post.content = "a" * 141 }
      it { should_not be_valid }
    end
end
