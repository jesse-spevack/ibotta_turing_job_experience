require 'csv'

class RewardMatchingService

  def initialize
    @queue = PurchaseEventQueue.new
  end

  def create_reward_matched_event
    # Grab the next purchase event off the queue
    # Find the product code id from the purchase event
    # Look up the reward amount in cents in rewards.csv
    # Find the quantity from the purchase event
    # Multiply quantity and reward amount to get the total award amount in cents
    # Get the saver_id and purchase_event_id from purchase event
    # Output a reward matched event
    return {
      saver_id: saver_id
      purchase_event_id: purchase_event_id
      saver_id: purchase_event_id
    }
  end
end