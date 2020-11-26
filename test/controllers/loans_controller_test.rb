require 'test_helper'

class LoansControllerTest < ActionDispatch::IntegrationTest
  setup do
    @loan = loans(:one)
  end

  test "should get index" do
    get loans_url, as: :json
    assert_response :success
  end

  test "should create loan" do
    assert_difference('Loan.count') do
      post loans_url, params: { loan: { book_id: @loan.book_id, is_active: @loan.is_active, user_id: @loan.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show loan" do
    get loan_url(@loan), as: :json
    assert_response :success
  end

  test "should update loan" do
    patch loan_url(@loan), params: { loan: { book_id: @loan.book_id, is_active: @loan.is_active, user_id: @loan.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy loan" do
    assert_difference('Loan.count', -1) do
      delete loan_url(@loan), as: :json
    end

    assert_response 204
  end
end
