# Maze::Cli

This is a gem that generates random mazes using backtrack algorith.
It allows picking any cell in the maze and generates a maze from tahat point to the edge of the maze.

## Installation

Install from source

```ruby
rake install
```

And then execute:

    $ maze-cli --help


## Usage

    $ maze-cli --width 15 --height 6 --start 10:3

## Example usage

To generate a maze of `15X6`, and start solving at `1:1` and make sure it finishes at `X:14`

```
$ maze-cli --width 15 --height 6 --start 1:1 --finish-x 14
start: 1, 1
finish: 14, 0
 ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─
|■ ■ ■ ■| | | | | |■ ■|■ ■ ■ @|
   ─ ─   ─ ─ ─ ─ ─       ─ ─ ─
|■ ■| |■| | | | |■ ■|■ ■| | | |
 ─ ─ ─   ─ ─ ─ ─   ─ ─ ─ ─ ─ ─
|■ ■| |■ ■ ■| | |■ ■|■ ■| | | |
     ─ ─ ─   ─ ─ ─       ─ ─ ─
|■|■ ■ ■ ■ ■| |■ ■|■ ■|■| | | |
   ─ ─ ─ ─ ─ ─     ─ ─   ─ ─ ─
|■ ■| |■ ■| | |■|■|■ ■ ■| | | |
 ─   ─     ─ ─       ─ ─ ─ ─ ─
| |■ ■ ■|■ ■ ■ ■|■ ■| | | | | |
 ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─
 ```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://gitlab.com/metin/maze-cli.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Maze::Cli project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://gitlab.com/metin/maze-cli/blob/master/CODE_OF_CONDUCT.md).
