# guitarparty-ruby-client

Lightweight, easy-to-use ruby client for the guitarparty API
(find more info on them at http://www.guitarparty.com/developers/)

##Setup

To initialize a new client, generate a new guitarparty client with your API key as such:
(the below key is fake)

```ruby
guitarparty_client = Guitarparty::Client.new("f97b51d89ce0aab433e06258def19cbe20bf8bbc")
```

##To Use:

All song-finding and artist-finding methods return JSON.

###Find a song
By ID:
```ruby
guitarparty_client.get_song(1)

guitarparty_client.get_artist(1)
```
Or find a song/artist using a query:
```ruby
guitarparty_client.search_songs('Jolene')

guitarparty_client.search_artists('Dolly Parton')
```


###Finding the chords to a song
I wrote a method that returns a ruby hash of the title, artist, and chords of a song, in sequential order:
```ruby
guitarparty_client.get_song_chords(1)
```


###Additional Info

I wrote this in a small amount of time over an afternoon -- there's some work to be done on adding additional features, which I will work on through time.

Enjoy!




