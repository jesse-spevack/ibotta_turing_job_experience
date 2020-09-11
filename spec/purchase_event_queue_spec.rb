require 'spec_helper'
require './lib/purchase_event_queue'

describe PurchaseEventQueue do
  subject(:queue) { described_class.new }

  describe '#get_next_purchase_event' do
    context 'when the queue contains events' do
      subject(:queue) { described_class.new }

      let(:purchase_event) do
          {
            'purchase_event_id' => 6066107,
            'product_code_id' => 6535813,
            'quantity' => 3,
            'saver_id' => 6784182
          }
      end

      it 'returns the next purchase event from the queue' do
        expect(queue.get_next_purchase_event).to eq purchase_event
      end
    end

    context 'when queue is empty' do
      it 'returns nil' do
        Array.new(100).each { queue.get_next_purchase_event }
        expect(queue.get_next_purchase_event).to eq nil
      end
    end
  end
end