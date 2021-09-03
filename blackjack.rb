require_relative "message"
require_relative "deck"

class Blackjack
  include Message

  def initialize(dealer, player)
    @dealer = dealer
    @player = player
  end

  def start
    start_msg
    @deck = Deck.new

    @dealer.reset
    @player.reset

    @bet = request_bet
    deal_first
  end

  private

  def request_bet
    request_bet_msg(@player)
    bet = 0
    loop do
      bet = @player.decide_bet
      if bet.between?(1, @player.money)
        @player.bet_money(bet)
        info_bet_money_msg(bet, @player)
        break
      end
      error_msg_for_bet_money
    end
    bet
  end

  def deal_first
    first_deal_msg(@dealer) # ① カードを配ることを知らせるメッセージのメソッドの呼び出し
    # 配り方はプレイヤー1枚目→ディーラー1枚目（見せる）→プレイヤー2枚目→ディーラー2枚目（伏せる）
    2.times do
      deal_card_to(@player) # ② 1枚カードを配るメソッドの呼び出し
      deal_card_to(@dealer) # ② 1枚カードを配るメソッドの呼び出し
    end
    # ⑤ 手札を表示するメッセージの呼び出し
    show_hand_msg(@dealer, first_time: true)
    show_hand_msg(@player)

    info_status_or_points(@player) # ⑥ ③の合計ポイント，④のステータスを表示するメッセージのメソッドの呼び出し
  end

  # ② 1枚カードを配る
  def deal_card_to(character)
    drawn_card = @dealer.draw_card(@deck)
    character.receive(drawn_card)
  end

  # ⑥ ③の合計ポイント，④のステータスを表示するメッセージのメソッド
  def info_status_or_points(character)
    if character.blackjack?
      blackjack_msg(character)
    elsif character.bust?
      point_msg(character)
      bust_msg(character)
    else
      point_msg(character)
    end
  end
end
