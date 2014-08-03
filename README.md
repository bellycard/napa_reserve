Napa Reserve
============

*"Like a fine wine, web services get better with age..."*

Napa Reserver is an addon to the Napa gem which provides additional functionality to help keep older services up to date.

## Installation

Add this line to your application's Gemfile:

    gem 'napa_reserve'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install napa_reserve

## Usage

To enable NapaReserve simply add an initializer to your app:

#### config/initializers/napa_reserve.rb
```
NapaReserve::Initializer.run
```

With the initializer in place, NapaReserve will take care of the rest from there. You will start to see deprecation notices in your logs and you will see details on all your services gem dependencies when the service boots.


## Contributing

1. Fork it ( http://github.com/<my-github-username>/napa_reserve/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
