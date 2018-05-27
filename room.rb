class Room

attr_reader :name, :entry_fee, :playlist, :occupancy, :takings, :guest_array

attr_writer :occupancy, :takings, :guest_array

def initialize(name, entry_fee, occupancy, guest_array, playlist)
  @name = name
  @entry_fee = entry_fee
  @occupancy = occupancy
  @guest_array = guest_array
  @playlist = playlist
  @takings = 0

  @occupancy -= guest_array.length()
end

def checkout(individual)
  for guest in @guest_array
    if guest.name == individual
      @guest_array.delete(guest)
      @occupancy += 1
    end
  end
end

def checkin(individual)
  if (@occupancy != 0 && individual.money >= @entry_fee)
    @guest_array << individual
    @takings += individual.pay_up(@entry_fee)
    @occupancy -= 1
  end
end

def new_song(song)
  @playlist << song
end





end
