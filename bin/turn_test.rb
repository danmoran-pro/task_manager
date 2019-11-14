require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'

class TurnTest < Minitest::Test

  def setup
    @card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card2 = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    @turn = Turn.new("Juneau", @card)
    @turn2 = Turn.new("Saturn", @card2)
  end

  def test_turn_exists
    assert_instance_of Turn, @turn
  end

  def test_turn_has_card
    assert_equal @card, @turn.card
  end

  def test_turn_has_guess
    assert_equal "Juneau", @turn.guess
    assert_equal "Saturn", @turn2.guess
  end

  def test_if_correct?
    assert_equal true, @turn.correct?
    assert_equal false, @turn2.correct?

  end

  def test_feedback
    assert_equal "Correct!", @turn.feedback
    assert_equal "Incorrect", @turn2.feedback
  end
end
