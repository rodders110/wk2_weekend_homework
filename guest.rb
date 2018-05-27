class Guest
  attr_reader :name, :favourite_song, :money

  def initialize (name, favourite_song, money)
    @name = name
    @favourite_song = favourite_song
    @money = money
  end

  def pay_up(amount)
    @money -= amount
    return amount
  end

  def cheer (song)
    if song == @favourite_song
      return "WOOHOO!!!"
    end
  end
end
