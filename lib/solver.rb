require 'csv'
require './lib/purchase_event_queue'
require './lib/reward_matched_event_publisher'

rewards = CSV.open('./data/rewards.csv')

rewards_map = rewards.reduce({}) do |result, reward| 
  result[reward.first.to_i] = reward.last.to_i
  result
end

queue = PurchaseEventQueue.new

reward_matched_events = []
Array.new(100).each do |i|
  event = queue.get_next_purchase_event

  saver_id = event['saver_id']
  purchase_event_id = event['purchase_event_id']
  product_code = event['product_code_id']
  quantity = event['quantity']
  amount = rewards_map[product_code]

  reward_matched_event = {
    saver_id: saver_id,
    purchase_event_id: purchase_event_id,
    reward_amount_cents: quantity * amount
  }

  reward_matched_events << reward_matched_event

  RewardMatchedEventPublisher.publish(reward_matched_event)
end

  reward_matched_events.each do |event|
    File.open('answer_reward_matched_events.json', 'a') do |f|
      f.write(event.to_json)
    end
  end