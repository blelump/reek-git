This is quick https://github.com/m4i/rubocop-git port to Reek. 

# Reek::Git

Reek for git diff.

## Installation

Add this line to your application's Gemfile:

    gem 'reek-git', github: 'necolt/reek-git'

And then execute:

    $ bundle

## Usage

    Usage: reek-git [options] [[commit] commit]
        -c, --config FILE                Specify configuration file
        -r, --require FILE               Require Ruby file
        -d, --debug                      Display debug info
        -D, --display-cop-names          Display cop names in offense messages
            --cached                     git diff --cached
            --staged                     synonym of --cached
            --hound                      Hound compatibility mode

## Contributing

1. Fork it ( https://github.com/sauliusgrigaitis/reek-git/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
