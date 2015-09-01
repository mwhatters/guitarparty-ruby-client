require 'httparty'
require 'open-uri'
# rate limit: 130 requests per hour

module GuitarParty
  class Client
    include HTTParty
    base_uri "api.guitarparty.com/v2"

    def initialize(api_key)
      @api_key = api_key
      @headers = {"Guitarparty-Api-Key" => @api_key}
    end

    def get_song(song_id)
      make_request("/songs/#{song_id}/")
    end

    def search_songs(query_string)
      make_request("/songs/?query=#{URI::encode(query_string)}")
    end

    def get_artist(artist_id)
      make_request("/artists/#{artist_id}/")
    end

    def search_artists(query_string)
      make_request("/artists/?query=#{URI::encode(query_string)}")
    end

    # Guitarparty's returning a 404 for these requests -- seems like something might be broken on their end
    # but I'll look further into it.

    # def get_songbooks
    # 	make_request("/songbooks/")
    # end

    # def create_songbook(title, description, is_public = false)
    # 	data = Hash["title", title, "description", description, "is_public", is_public]
    # 	p data
    # 	songbook = make_request("/songbooks", "post", data)
    # 	songbook
    # end

    def get_song_chords(song_id)
      song = JSON.parse((self.get_song(song_id)).body)
      grab_chords(song)
    end

    def search_song_chords(query_string)
      song = JSON.parse(self.search_songs(query_string).body)
      grab_chords(song)
    end

    private

    def make_request(uri)
      self.class.get(uri, headers: @headers)
    end

    def grab_chords(song)
      chords = song["body"].scan(/\[\w{1}\]/)
      chords.each { |chord| chord.gsub!(/\[|\]/, "")}
    end

  end
end
