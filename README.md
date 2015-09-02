# guitarparty-ruby-client

Lightweight, easy-to-use ruby client for the guitarparty API
(find more info on them at http://www.guitarparty.com/developers/)

##Setup

To install:

```
gem install guitarparty-ruby
```

To initialize a new client, generate a new guitarparty client with your API key as such:
(the below key is fake)

```ruby
require 'guitarparty'
guitarparty_client = Guitarparty::Client.new("f97b51d89ce0aab433e06258def19cbe20bf8bbc")
```

##To Use:

All song-finding and artist-finding methods return JSON.

###Find a song
By ID:
```ruby
guitarparty_client.get_song(1)
# {"authors"=>[{"name"=>"John Lennon", "types"=>["lyrics", "melody"], "uri"=>"/v2/artists/17/"}, {"name"=>"The Beatles", "types"=>["cover"], "uri"=>"/v2/artists/3/"}, ...

guitarparty_client.get_artist(1)
# {"bio"=>"Dolly Rebecca Parton (born January 19, 1946) is an American country singer, songwriter, composer, producer, entrepreneur, author and...
```
Or find a song/artist using a query:
```ruby
guitarparty_client.search_songs('Jolene')
# {"objects"=>[{"authors"=>[{"name"=>"Dolly Parton", "types"=>["cover", "melody", "lyrics"], "uri"=>"/v2/artists/1/"}],...

guitarparty_client.search_artists('Dolly Parton')
# {"objects"=>[{"bio"=>"Dolly Rebecca Parton (born January 19, 1946) is an American country singer, songwriter, composer, producer, entrepreneur, author and...
```

Note how the search method returns a Hash that has a key, objects, pointing to an array of objects that matches the search query.


###Finding the chords to a song
I wrote a method that returns a ruby hash of the title, artist, and chords of a song, in sequential order:
```ruby
guitarparty_client.get_song_chords(1)
# {:title=>"A Hard Day's Night", :artist=>"John Lennon", :chords=>["G", "G", "F", "G", "G", "F", "G", "C", "D", "G", "G", "G", "G", "F", "G", "G", "F", "G", "C", "D", "G", "G", "G", "C", "D", "G", "G", "F", "G", "G", "F", "G", "C", "D", "G", "G", "C", "D", "G", "G", "G", "C", "D", "G", "G", "F", "G", "G", "F", "G", "C", "D", "G", "G", "G", "G"]}
```


###Additional Info

I wrote this in a small amount of time over an afternoon -- there's some work to be done on adding additional features, which I will work on through time. Currently most methods return an HTTParty Response object, I'm working on returning a ruby hash to make things easier.

Enjoy!




