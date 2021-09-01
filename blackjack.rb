require_relative "message"

class Blackjack
  include Message

  def initialize(dealer, player)
    @dealer = dealer
    @player = player
  end

  def start
    start_msg
  end
end
