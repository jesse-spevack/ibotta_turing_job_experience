# Ibotta - Turing Job Experience Day
This repository includes materials and activities for the Ibotta-Turing Job Experience day. The goal of the Job Experience Day is to give students who about 10 weeks into their Turing journeys a glimpse at some of what to expect as they embark on their new high fullfillment careers in technology.

## Day in the Life of an Ibotta Developer

### Tools
The following tools I enjoy using nearly everyday, but never used at Turing:
- [iterm2](https://iterm2.com/)
- [github command line interface](https://github.com/cli/cli)
- [ohmyzsh](https://ohmyz.sh/)
- Vim keybindings for [atom](https://atom.io/packages/vim-mode) or [vscode](https://github.com/VSCodeVim/Vim)
- [My brag sheet](docs.google.com)
- [Google Sheets](sheets.new)
- [ssh](https://www.ssh.com/ssh/)
- [1Password](https://1password.com/)
- [Digital Wellbeing](https://wellbeing.google/)
- [Freedom](https://freedom.to)

The following tools I use nearly everyday, but never used at Turing:
- [Jira](https://www.atlassian.com/software/jira)
- [Confluence](https://www.atlassian.com/software/confluence)
- [rvm](https://rvm.io/)
- [Docker](https://www.docker.com/)
- [Travis](https://travis-ci.org/)
- [Code Climate](https://codeclimate.com/)
- [DataDog](https://www.datadoghq.com/)
- [SumoLogic](https://www.sumologic.com/)
- [New Relic](https://newrelic.com/)
- [Qubole](https://www.qubole.com/)
- [Pager Duty](https://www.pagerduty.com/)
- [AWS](https://aws.amazon.com/console/)

### Schedule
My typical day involves:
- A run
- Check slack and email
- Team standup
- Work on a story (best case writing ruby, worst case investigating)
- Lunch
- More coding
- Dinner

[Here](https://docs.google.com/spreadsheets/d/e/2PACX-1vTNwmXHCptfvSzNENShDD4YHoJ73o31PbE7OcDFzFQHJydx31oRh01EY4Nkw4zwz3rRKiYFYpPveYfb/pubchart?oid=541947029&format=interactive) is a break down of what my calendar looks like on an average week.

## Tech Challenge

Let's implement a `RewardMatchingService`!

Ibotta receives many different formats of purchase data from users. Purchases may be an image of a receipt, a row of a csv file, a webhook, etc. Purchase data is normalized to make it easier for our system to treat purchases from different sources the same. Today, you will implement the core business functionality of Ibotta - matching purchases with rewards. 

A reward is a coupon or offer for cash back on a purchase. For example, Ibotta may have a reward that says savers (an Ibotta user) should earn $0.50 when they buy a package of Oreos. We can determine whether or not there is a match between what the saver has purchased and the reward by comparing the product code of the item purchased with the product code on the reward. If the product codes are the same, the saver is entitled to a cash back award.

First, the service should use the following to read purchase event `json` from the [queue](https://en.wikibooks.org/wiki/A-level_Computing/AQA/Paper_1/Fundamentals_of_data_structures/Queues).

```ruby
queue = PurchaseEventQueue.new
queue.get_next_purchase_event
```

Second the `RewardMatchingService` should use the `product_code` from the purchase event to find the `reward_amount_cents` in the `rewards.csv`. The csv has two columns; the first is the product code and the second is the amount in cents to be be paid to a saver for purchasing this product. 

Third the `RewardMatchingService` should create a `RewardMatchedEvent` with the following structure:

```ruby
{ 
  # This is a reward_matched_event.
  # It shows how much money to award a particular saver for a particular purchase event.
  saver_id: <the saver id from the purchase event>,
  purchase_event_id: <the purchase event id>,
  reward_amount_cents: <the amount in cents the saver earns for this purchase>
}
```

Note that the `PurchaseEvent` may contain a quantity purchased greater than 1. In that case the `reward_amount_cents` from the `rewards.csv` must be multiplied by the quantity to arrive at the correct amount to award the saver.

Finally, publish the `RewardMatchedEvent` using the `RewardMatchedEventPublisher` by calling `RewardMatchedEventPublisher.publish(reward_matched_event)`.

You are encouraged to write tests for your `RewardMatchingService` and encapsulate functionality within multiple methods.

## Quick Advice

### Developer Advice
Talks I Like
- [Breaking up with your test suite](https://www.youtube.com/watch?v=9_3RsSvgRd4)
- [Primitive Obsessions](https://www.youtube.com/watch?v=LhX5COR8WXc&t)

Newsletters I like
- [Ruby Weekly](https://rubyweekly.com/)

Things I think I am good at
- Ruby
- Asking questions
- Object Oriented Programming
- Test Driven Development
- Working with others
- Here's my [resume](https://docs.google.com/document/d/1YCUa9rONtHtwjBCBezwG8vaRPGrFVkUCORRmRW8Uk6o/edit?usp=sharing)

Things I think I would like to be better at
- Ruby
- Asking questions
- Object Oriented Programming
- Functional Programming
- Working with others 
- SQL, Rails, StimulusJS


### Job Search Advice
I wrote some [things](http://www.jessespevack.com/blog/2017/3/8/get-hired-how-i-went-from-bootcamp-grad-to-engineer) about my job hunt experience. I also wrote some other [things](http://www.jessespevack.com/blog/2019/3/4/stop-asking-about-mentorship) about framing your Turing experience while on your own job hunt.