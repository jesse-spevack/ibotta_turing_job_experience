require 'fileutils'
amirite = FileUtils.identical? './data/answer_reward_matched_events.json', './data/reward_matched_events_queue.json'
puts amirite