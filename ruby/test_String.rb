require 'test/unit'

# very basic test
class StringTest < Test::Unit::TestCase
  def test_length
    s = "Hello, World!"
    assert_equal(13, s.length)
  end

  def test_expression_substitution
    assert_equal("Hello! Hello! Hello! ", "#{'Hello! ' * 3}")
  end

end