require './test/test_helper'
# require 'admin/author_controller'
# fixtures :authors

class Admin::AuthorControllerTest < ActionDispatch::IntegrationTest
  # def setup
  #   @controller = Admin::AuthorController.new
  #   @request = ActionController::TestRequest.new
  #   @response = ActionController::TestResponse.new
  # end

  def test_new
    get new_admin_author_url
    assert_response :success
    assert_select 'h1', content: 'Create new author'
    assert_select 'form', attributes: { action: '/admin/author/create' }
  end

  def test_create
    get new_admin_author_url
    assert_response :success

    assert_difference(Author, :count) do
      # assert_equal 0, Author.find(:all).size
      post admin_author_index_url, params: { author: { first_name: 'Joel', last_name: 'Spolsky' } }
      assert_response :redirect
      assert_redirected_to action: 'index'
      # assert_equal 1, Author.find(:all).size
    end

    assert_equal 'Author Joel Spolsky was successfully created.', flash[:notice]
  end

  def test_failing_create
    assert_no_difference(Author, :count) do
      post admin_author_index_url, params: { author: { first_name: 'Joel' } }
      assert_response :success
      assert_select 'div', attributes: { class: 'fieldWithErrors' }
    end
  end

  def test_index
    get admin_author_index_url
    assert_response :success
    assert_select 'table', children: { count: Author.count + 1, only: { tag: 'tr ' } }
    Author.all.each do |a|
      assert_select 'td', content: a.last_name
    end
  end

  def test_fixture
    authors.each do |q|
      assert q.valid?, q.errors.full_messages.inspect
    end
  end

  def test_show
    author = authors(:joel_spolsky)
    get '/admin/author', params: { id: author.id }

    assert_response :success
    assert_equal 'Joel', author.first_name
    assert_equal 'Spolsky', author.last_name
  end

  def test_edit
    author = authors(:joel_spolsky)
    get edit_admin_author_path(author.id, @author)

    assert_select 'input', attributes: { name: 'author[first_name]', value: 'Joels' }
    assert_select 'input', attributes: { name: 'author[last_name]', value: 'Spolsky' }
  end

  def test_update
    put '/admin/author/1', params: { author: { first_name: 'Joseph', last_name: 'Spolsky' } }

    assert_response :redirect
    assert_redirected_to action: 'show', id: 1
    assert_equal 'Joseph', Author.find(1).first_name
  end
end
