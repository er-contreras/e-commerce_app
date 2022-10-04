require './test/test_helper'

class PublishersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @publisher = publishers(:apress)
  end

  test 'should get index' do
    get admin_publishers_url
    assert_response :success
  end

  test 'should get new' do
    get new_admin_publisher_url
    assert_response :success
  end

  test 'should create publisher' do
    num_publishers = Publisher.count

    post admin_publishers_url, params: { publisher: { name: 'The Monopoly Publishing Company' } }
    assert_response :redirect
    assert_redirected_to admin_publisher_url(Publisher.last)

    assert_equal num_publishers + 1, Publisher.count

    # assert_difference('Publisher.count') do
    #   post admin_publishers_url, params: { publisher: { name: 'The Monopoly Publishing Company' } }
    # end

    # assert_redirected_to admin_publisher_url(Publisher.last)
  end

  test 'should show publisher' do
    get admin_publisher_url(@publisher)
    assert_response :success

    assert_select 'h1', content: Publisher.find(1).name
  end

  test 'should get edit' do
    get edit_admin_publisher_url(@publisher)
    assert_response :success
  end

  test 'should update publisher' do
    patch admin_publisher_url(@publisher), params: { publisher: { name: 'The Monopoly Publishing Companies' } }
    assert_redirected_to admin_publisher_url(@publisher)
    assert_equal 'The Monopoly Publishing Companies', Publisher.find(1).name
  end

  test 'should destroy publisher' do
    assert_difference('Publisher.count', -1) do
      delete admin_publisher_path(@publisher)
      assert_response :redirect
      assert_redirected_to action: 'index'
      follow_redirect!
      assert_select 'div', attributes: { id: 'notice' }, content: 'Publisher was successfully destroyed.'
    end
  end
end
