# ActiveErrors

[![Gem Version](https://badge.fury.io/rb/active_errors.svg)](http://badge.fury.io/rb/active_errors)
[![Build Status](https://travis-ci.org/drexed/active_errors.svg?branch=master)](https://travis-ci.org/drexed/active_errors)

ActiveErrors provides an API for generating and accessing in the identical format as ActiveModel::Errors but without the need for all those extra cruft.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'active_errors'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install active_errors

## Table of Contents

* [Usage](#usage)

## Usage

```ruby
class Shipment

  def errors
    @errors ||= ActiveErrors::Messages.new
  end

  def messages
    @errors.full_messages
  end

  def process
    ShipmentItem.each do |item|
      item.add_to_box!
    rescue Shipment::OutOfStock => e
      errors.add(item.name, I18n.t('errors.out_of_stock'))
    rescue Shipment::DoesNotExist => e
      errors[item.name] = I18n.t('errors.does_not_exist')
    rescue ActiveRecord::RecordInvalid
      errors.merge!(item.errors)
    end
  end

end
```

## Contributing

Your contribution is welcome.

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
