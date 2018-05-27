require("minitest/autorun")
require("minitest/rg")

require_relative("../song")
require_relative("../guest")
require_relative("../room")
require_relative("../bar")


class TestBar < MiniTest::Test

  def setup()
    guest1 = Guest.new("Tommy", "Highwayman", 50.00)
    guest2 = Guest.new("Alice", "Almost", 70.00)
    guest3 = Guest.new("John", "Just like a Pill", 100.00)
    guest4 = Guest.new("Toni", "I am what I am", 40.00)
    @room1 = Room.new("Africa Suite", 20.00, 5, [guest1, guest2], [])
    @room2 = Room.new("Atlantic Suite", 20.00, 10, [guest3, guest4], [])
    @bar = Bar.new("Lip Synch", [@room1, @room2])

    @room1.checkin(guest1)
    @room1.checkin(guest2)
    @room2.checkin(guest3)
    @room2.checkin(guest4)
  end

  def test_has_name()
    assert_equal("Lip Synch", @bar.name)
  end

  def test_has_rooms()
    assert_equal(2, @bar.rooms.length())
  end

  def test_has_takings
    @bar.cash_in()
    assert_equal(80.00, @bar.total_takings())
  end

  def test_can_add_songs
    @song = Song.new("Turn Back Time", "cher")
    @bar.new_song(@song, @room1)
    assert_equal(1, @room1.playlist.length)

  end


end
