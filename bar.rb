
class Bar

  attr_reader :name, :rooms, :total_takings
  attr_writer :rooms, :total_takings

  def initialize(name, room_array)
    @name = name
    @rooms = room_array
    @total_takings = 0
  end

  def cash_in()
    for room in @rooms
      @total_takings += room.takings
    end
  end

  def new_song(song, room_choice)
    for room in @rooms
      if room.name == room_choice.name
        room_choice.playlist << song
      end
    end
  end

end
