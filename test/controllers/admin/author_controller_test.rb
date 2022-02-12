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
    get admin_author_new_url
    assert_response :success
    assert_select 'h1', content: 'Create new author'
    assert_select 'form', attributes: { action: '/admin/author/create' }
  end

  def test_create
    get admin_author_new_url
    assert_response :success

    assert_difference(Author, :count) do
      # assert_equal 0, Author.find(:all).size
      post '/admin/author/create', params: { author: { first_name: 'Joel', last_name: 'Spolsky' } }
      assert_response :redirect
      assert_redirected_to action: 'index'
      # assert_equal 1, Author.find(:all).size
    end

    assert_equal 'Author Joel Spolsky was successfully created.', flash[:notice]
  end

  def test_failing_create
    assert_no_difference(Author, :count) do
      post '/admin/author/create', params: { author: { first_name: 'Joel' } }
      assert_response :success
      # assert_template 'admin/author/new'
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

  # def test_show
  #   get admin_author_show_url
  #   assert_response :success
  #   assert_equal 'Joel', assigns(:author).first_name
  #   assert_equal 'Spolsky', assigns(:author).last_name
  # end
end
