class RewardMatchedEventPublisher
  class << self
    def publish(event)
      json_event = event.to_json
      puts json_event 
      queue = File.open('./data/reward_matched_events_queue.json', 'a')
      queue.write(json_event)
      queue.close
    end
  end
end