require("minitest/autorun")
require("minitest/rg")

require_relative("../room")
require_relative("../guest")
require_relative("../song")


class TestRoom < MiniTest::Test

  def setup()
    song1 = Song.new("Poison", "Alice Cooper")
    song2 = Song.new("Highwayman", "Johnny Cash")
    song3 = Song.new("Almost", "Bowling for Soup")
    @guest1 = Guest.new("Tommy", "Highwayman", 50.00)
    @guest2 = Guest.new("Alice", "Almost", 70.00)
    @room = Room.new("Africa Suite", 20.00, 5, [@guest1, @guest2], [song1, song2, song3])
  end

  def test_has_name()
    assert_equal("Africa Suite", @room.name)
  end

  def test_has_fee()
    assert_equal(20, @room.entry_fee)
  end

  def test_has_occupancy()
    assert_equal(3, @room.occupancy)
  end

  def test_has_playlist()
    assert_equal(3, @room.playlist.length())
  end

  def test_has_guests()
    assert_equal(2, @room.guest_array.length())
  end

  def test_occupancy_has_been_depleted()
    assert_equal(3, @room.occupancy)
  end

  def test_can_checkout()
    @room.checkout("Tommy")
    assert_equal(4, @room.occupancy)
    assert_equal(1, @room.guest_array.length())
  end

  def test_can_checkin()
    @guest3 = Guest.new("Charles", "Mambo No. 5", 34)
    @room.checkin(@guest3)
    assert_equal(2, @room.occupancy)
    assert_equal(3, @room.guest_array.length())
    assert_equal(14.00, @guest3.money)
  end

  def test_can_take_new_song()
    @song4 = Song.new("Turn Back Time", "cher")
    @room.new_song(@song4)
    assert_equal(4, @room.playlist.length())

  end
end
