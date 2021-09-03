module Message
  def start_msg
    puts <<~TEXT
      ----------------------------------
      |                                |
      |           BLACK JACK           |
      |                                |
      ----------------------------------

    TEXT
  end

  def request_bet_msg(player)
    puts <<~TEXT

      現在の所持金は#{player.money}円です。
      掛け金を入力して下さい。

    TEXT
  end

  def info_bet_money_msg(bet, player)
    puts <<~TEXT

      -------- money_information -------

      掛け金： #{bet}円

      現在の所持金 ： #{player.money}円

      ----------------------------------

    TEXT
  end

  def error_msg_for_bet_money
    puts <<~TEXT

      ---------------------------------------------------------
      error ： 1以上，かつ所持金以下の数値を入力してください。
      ---------------------------------------------------------

    TEXT
  end

  # ① カードを配ることを知らせるメッセージ
  def first_deal_msg(dealer)
    puts <<~TEXT

      #{dealer.class}がカードを2枚ずつ配ります。

    TEXT
  end

  # ⑤ 手札を表示するメッセージ
  def show_hand_msg(character, first_time: false)
    if first_time
      puts <<~TEXT

        ----------- #{character.class} 手札 -----------
         1枚目 ： #{character.hand_cards[0].card_info}
         2枚目 ： 伏せられている
        -----------------------------------
      TEXT
    else
      puts <<~TEXT

        ----------- #{character.class} 手札 -----------
      TEXT
      character.hand_cards.each.with_index(1) do |card, i|
        puts " #{i}枚目 ： #{card.card_info}"
      end
      puts "-----------------------------------"
    end
  end

  # ⑥ ③の合計ポイントを表示するメッセージ
  def point_msg(character)
    point_msg_1 = "#{character.class}の手札の合計ポイントは #{character.point_list[0]}"
    point_msg_2 = "、もしくは #{character.point_list[1]} "

    print point_msg_1

    print point_msg_2 if character.point_list[1]

    puts "です。"
  end

  # ⑥ ④のステータスを表示するメッセージ
  def blackjack_msg(character)
    puts <<~TEXT

      #{character.class}の手札はブラックジャックです！

    TEXT
  end

  # ⑥ ④のステータスを表示するメッセージ
  def bust_msg(character)
    puts <<~TEXT

      #{character.class}はバーストしました。

    TEXT
  end
end
