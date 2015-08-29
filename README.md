# gtfs-to-parse

## GTFS to Parse.com samples

GTFS specification is [this](https://developers.google.com/transit/gtfs/).
These samples use [gtfs](https://github.com/nerdEd/gtfs) and [parse-ruby-client](https://github.com/adelevie/parse-ruby-client).

1. Run script and generate json file.
Samples read the file google_transit.zip in same folder.
```ruby
ruby agency.rb
```

2. Upload json file to parse.com and import.
