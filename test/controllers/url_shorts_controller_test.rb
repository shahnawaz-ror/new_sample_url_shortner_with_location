require 'test_helper'

class UrlShortsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @url_short = url_shorts(:one)
  end

  test "should get index" do
    get url_shorts_url
    assert_response :success
  end

  test "should get new" do
    get new_url_short_url
    assert_response :success
  end

  test "should create url_short" do
    assert_difference('UrlShort.count') do
      post url_shorts_url, params: { url_short: { link: @url_short.link } }
    end

    assert_redirected_to url_short_url(UrlShort.last)
  end

  test "should show url_short" do
    get url_short_url(@url_short)
    assert_response :success
  end

  test "should get edit" do
    get edit_url_short_url(@url_short)
    assert_response :success
  end

  test "should update url_short" do
    patch url_short_url(@url_short), params: { url_short: { link: @url_short.link } }
    assert_redirected_to url_short_url(@url_short)
  end

  test "should destroy url_short" do
    assert_difference('UrlShort.count', -1) do
      delete url_short_url(@url_short)
    end

    assert_redirected_to url_shorts_url
  end
end
