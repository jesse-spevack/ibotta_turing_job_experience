require 'json'

class PurchaseEventQueue
  def initialize
    @events = JSON.parse(File.read('./data/purchase_events.json'))
  end

  def get_next_purchase_event
    @events.shift
  end
end