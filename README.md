# Bigquery::Table

bigquery-table is auto create bigquery table from json data.

already if the table exists , and then update the table if you examine the difference there was additional column.

## Installation

install it yourself as:

    $ gem build  bigquery-table.gemspec
    $ gem install bigquery-table-0.1.0.gem

## Usage

first, execute below command in the path of your choice:

    $ bigquery-table init

after, edit config.yml and create json data of bigquery table

example for:

    $ vi schema/sample.json

```
# sample.json
[
  { "name": "first_column", "type": "integer" },
  { "name": "second_column", "type": "string" },
  { "name": "time"," type": "timestamp" },
  { "name": "last_column", "type": "float" }
]
```

and, execute below comman:

    $ bigquery-table update

## Development

After checking out the repo, run `bundle install --path on_your_choice` to install dependencies. Run `bundle exec ./bin/bigquery-table` to use the code located in this directory, ignoring other installed copies of this gem.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/[my-github-username]/bigquery-table/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
