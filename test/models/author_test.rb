require './test/test_helper'

class AuthorTest < ActiveSupport::TestCase
  def test_name
    author = Author.create(
      first_name: 'Joel',
      last_name: 'Spolsky'
    )

    assert_equal 'Joel Spolsky', author.name
  end
end
