require 'rails_helper'

RSpec.describe Relationship, :type => :model do
   let(:follower) { FactoryGirl.create(:user) }
    let(:followed) { FactoryGirl.create(:user) }
     let(:relationship) { follower.relationships.build(followed_id :followed_id) }

     subject { relationships }
     it { should be_valid }
     it { should respond_to(:follower) }
     it { should respond_to(:followed) }

     it "  " do
         expect()

        end

       it " " do
         expect()
        end
end

    describe "" do

    end	
