require 'spec_helper'
require './lib/reward_matched_event_publisher'

describe RewardMatchedEventPublisher do
  let(:reward_matched_event) do
    { 
      saver_id: 12345,
      purchase_event_id: 678901234,
      reward_amount_cents: 50
    }
  end

  it 'publishes event to stdout' do
    expected = reward_matched_event.to_json + "\n"
    expect { described_class.publish(reward_matched_event) }.to output(expected).to_stdout
  end
end