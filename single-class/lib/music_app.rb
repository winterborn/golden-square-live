class MusicApp

    def initialize
    @list = []
    # some sort of list / array
    end

    def add(track)
        fail "Cannot have empty track name." if track.empty?
        @list << track
    # unless track has not been listened to, do not add to list?
    end
    # track will be a string of the song name.

    def list()
        return @list
    # show list of tracks
    end
end