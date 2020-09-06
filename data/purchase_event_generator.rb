require 'csv'
require 'json'

class PurchaseEventGenerator
  class << self
    def generate
      
      product_codes = []

      CSV.open('.rewards.csv', 'w') do |csv|
        offers = Array.new(1000).map do |i|
          product_code = rand(1000000..9999999)
          product_codes << product_code

          reward_amount_cents = [10, 25, 50, 75, 99, 100, 150, 200, 500].sample

          csv << [product_code, reward_amount_cents]
        end
      end

      savers = Array.new(30).map { |i| rand(1000000..9999999) }

      purchase_events = Array.new(100).map do |i|
        {
          purchase_event_id: rand(1000000..9999999),
          product_code_id: product_codes.sample,
          quantity: rand(1..9),
          saver_id: savers.sample
        }
      end

      File.open('purchase_events.json', 'w') do |f|
        f.write(purchase_events.to_json)
      end
    end
  end
end

PurchaseEventGenerator.generate