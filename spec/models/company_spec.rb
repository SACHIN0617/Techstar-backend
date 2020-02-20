# frozen_string_literal: true

require 'rails_helper'

describe 'Company', type: :model do

    subject(:company) { Company.new } 

    context "valid attributes" do
        it { is_expected.to validate_presence_of(:name) }
        it { is_expected.to validate_presence_of(:city) }
        it { is_expected.to validate_presence_of(:state) }
        it { is_expected.to have_many(:founders) }
    end

    context "Delete all founders" do
        it "delete all founders of that company" do
            company1 = create(:company, :with_founders)
            company1.destroy
            expect(company1.founders.count).to eq(0)
        end
    end
end

