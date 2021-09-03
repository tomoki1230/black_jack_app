require_relative "rule"
class Character
  attr_reader :hand_cards, :point, :point_list
  include Rule

  def reset
    @hand_cards = []
    @status = nil # ここを追記（手札の状態が「ブラックジャック」か「バースト」かを管理する）
  end

  def receive(drawn_card)
    @hand_cards << drawn_card # カードを手札に加える
    calc_point # ③ 手札の合計ポイントを計算するメソッドの呼び出し
  end

  def blackjack?
    @status == STATUS_BLACKJACK
  end

  def bust?
    @status == STATUS_BUST
  end

  private

  # ③ 手札の合計ポイントを計算する
  def calc_point
    @point_list = [] # 手札の合計ポイントを入れる空の配列
    @point_list << @point = @hand_cards.sum(&:point)
    # Aを「1」ではなく「11」とカウント可能な場合，ポイントの候補を追加
    if ace? && adjustable?(@point)
      @point += ADJUST_NUM
      @point_list.unshift(@point)
    end
    change_status # ④ ステータスを変更するメソッドの呼び出し
  end

  def ace?
    @hand_cards.map(&:ace?).any?
  end

  # ④ 手札が「ブラックジャック」or「バースト」の場合，ステータスを変更する
  def change_status
    if blackjack_conditions?(@point, @hand_cards)
      @status = STATUS_BLACKJACK
    elsif bust_conditions?(point)
      @status = STATUS_BUST
    end
  end
end
