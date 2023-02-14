require 'test_helper'

class FinancialTransactionsControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get financial_transactions_index_url
    assert_response :success
  end

  test 'should get show' do
    get financial_transactions_show_url
    assert_response :success
  end

  test 'should get create' do
    get financial_transactions_create_url
    assert_response :success
  end

  test 'should get update' do
    get financial_transactions_update_url
    assert_response :success
  end

  test 'should get destroy' do
    get financial_transactions_destroy_url
    assert_response :success
  end
end
