# frozen_string_literal: true

require 'rails_helper'

describe 'Founder', type: :model do

    subject(:founder) { Founder.new } 
    
    context "valid attributes" do
        it { is_expected.to validate_presence_of(:name) }
        it { is_expected.to validate_presence_of(:title) }
        it { is_expected.to belong_to(:company) }
    end
end

