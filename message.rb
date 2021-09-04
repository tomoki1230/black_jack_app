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

  def select_action_msg(player, hit_num, stand_num)
    puts <<~TEXT

      #{player.class}の行動を選択してください。

      #{hit_num}. Hit #{stand_num}. Stand

    TEXT
  end

  def error_msg_about_action(hit_num, stand_num)
    puts <<~TEXT
      --------------------------------------
      error ： #{hit_num} か #{stand_num} を入力してください。
      --------------------------------------
    TEXT
  end

  def players_turn_end_msg(player)
    puts <<~TEXT

      #{player.class}はカードを引き終わりました。

    TEXT
  end

  def dealers_hand_msg(dealer)
    puts <<~TEXT

      #{dealer.class}の手札を確認します。

    TEXT
  end

  def dealer_draw_msg(dealer, stop_drawing_num)
    puts <<~TEXT

      #{stop_drawing_num}点未満なので
      #{dealer.class}はもう1枚カードを引きます。

    TEXT
  end

  def type_enter_msg
    puts <<~TEXT

      （ キーボードでEnterキーを押してください。）

    TEXT
  end

  def compare_point_msg
    puts <<~TEXT

      勝敗判定に参りましょう。

    TEXT
  end

  def win_msg(player)
    puts <<~TEXT

      おめでとうございます。#{player.class}の勝ちです!

    TEXT
  end

  def lose_msg(player)
    puts <<~TEXT

      ディーラーの勝利。#{player.class}の負けです。

    TEXT
  end

  def end_in_tie_msg
    puts <<~TEXT

      合計ポイントが同点となりました。引き分けです。

    TEXT
  end

  def dividend_msg(dividend, player)
    puts <<~TEXT

      -------- money_information -------------

      配当金： #{dividend}円

      現在の所持金 ： #{player.money}円

      ----------------------------------------

    TEXT
  end

  def info_gameover_msg
    puts <<~TEXT

      所持金が0円になりました。

      ゲームオーバー

    TEXT
  end
end
