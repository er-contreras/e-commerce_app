require './test/test_helper'
# require 'admin/author_controller'

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
end
