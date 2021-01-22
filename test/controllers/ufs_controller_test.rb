require 'test_helper'

class UfsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @uf = ufs(:one)
  end

  test "should get index" do
    get ufs_url, as: :json
    assert_response :success
  end

  test "should create uf" do
    assert_difference('Uf.count') do
      post ufs_url, params: { uf: { date: @uf.date, price: @uf.price } }, as: :json
    end

    assert_response 201
  end

  test "should show uf" do
    get uf_url(@uf), as: :json
    assert_response :success
  end

  test "should update uf" do
    patch uf_url(@uf), params: { uf: { date: @uf.date, price: @uf.price } }, as: :json
    assert_response 200
  end

  test "should destroy uf" do
    assert_difference('Uf.count', -1) do
      delete uf_url(@uf), as: :json
    end

    assert_response 204
  end
end
