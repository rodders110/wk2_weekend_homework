require ("minitest/autorun")
require ("minitest/rg")

require_relative("../song")


class TestSong < MiniTest::Test

  def setup()
    @song = Song.new("Poison", "Alice Cooper")
  end

  def test_has_song_name()
    assert_equal("Poison", @song.name)
  end

  def test_has_song_artist
    assert_equal("Alice Cooper", @song.singer)
  end

end
