# DreamTeam

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/DreamTeam`. To experiment with that code, run `bin/console` for an interactive prompt.

This gem allows you to get information about the steam user's games and the top 250 IMDb movies.
Information about steam games includes:  
    -Name  
    -Picture  
    -Price  
    -Developer  
    -Release date  
    -Description  
    -Number of recommendations  
    -Time spent in the game.  
Information about the films includes:  
    -Place in the rating  
    -Film name  
    -Full name  
    -Release date  
    -Picture  
    -The actors  
    -Rating  
    -Rating Count  

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add DreamTeam

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install DreamTeam

## Usage

usage example:  
        object = DreamTeam::Html_main::Html_main_page.new  
        object.create_main('Path to specify the path where the files will be created',"Steam id")

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Spoky-Loki/DreamTeam. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/Spoky-Loki/DreamTeam/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the DreamTeam project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/Spoky-Loki/DreamTeam/blob/master/CODE_OF_CONDUCT.md).
