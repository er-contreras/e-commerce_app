require './test/test_helper'
# require 'admin/author_controller'

class Admin::AuthorControllerTest < ActionDispatch::IntegrationTest
  def setup
    @controller = Admin::AuthorController.new
    @request = ActionController::TestRequest.new
    @response = ActionController::TestResponse.new
  end

  def test_new
    get :new
    assert_template 'admin/author/new'
    assert_tag 'h1', content: 'Create new author'
    assert_tag 'form', attributes: { action: '/admin/author/create' }
  end

  # test "should get new" do
  #   get admin_author_new_url
  #   assert_response :success
  # end

  # test "should get create" do
  #   get admin_author_create_url
  #   assert_response :success
  # end

  # test "should get edit" do
  #   get admin_author_edit_url
  #   assert_response :success
  # end

  # test "should get update" do
  #   get admin_author_update_url
  #   assert_response :success
  # end

  # test "should get destroy" do
  #   get admin_author_destroy_url
  #   assert_response :success
  # end

  # test "should get show" do
  #   get admin_author_show_url
  #   assert_response :success
  # end

  # test "should get index" do
  #   get admin_author_index_url
  #   assert_response :success
  # end
end
