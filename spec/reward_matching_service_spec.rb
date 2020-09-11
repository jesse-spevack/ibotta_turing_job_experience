require 'spec_helper'
require './lib/reward_matching_service.rb'

describe RewardMatchingService do
  # let syntax is a way to declare a variable
  # call the variable in an it block with `expected_reward_matched_event`
  let(:expected_reward_matched_event) do  
    # This test data matches the 
    # expected reward matched event
    # that should be created off the
    # first purchase event in the
    # purchase event queue 
    { 
      :purchase_event_id => 6066107,
      :saver_id => 6784182,
      :award_amount_cents => 225
    }
  end

  # `subject` is an rspec keyword that calls out the thing
  # under test. In this case the subject is a thing
  # called `reward_matching_service`
  # `described_class` is also an rspec keyword that
  # is a way to reference the class under test. In
  # this case `described_class` is the same thing
  # as saying `RewardMatchingService`.
  subject(:reward_matching_service) { described_class.new }

  # the `#` implies that the thing being described is an
  # instance method on the described_class `RewardMatchingService`
  # the `create_reward_matched_event` is the name of the
  # method under test.
  describe '#create_reward_matched_event' do
    it 'creates a new reward matched event' do
      expect(reward_matching_service.create_reward_matched_event).to eq expected_reward_matched_event
    end
  end
end