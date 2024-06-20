require "test_helper"

class VouchersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @voucher = vouchers(:one)
  end

  test "should get index" do
    get vouchers_url
    assert_response :success
  end

  test "should get new" do
    get new_voucher_url
    assert_response :success
  end

  test "should create voucher" do
    assert_difference("Voucher.count") do
      post vouchers_url, params: { voucher: { activity_id: @voucher.activity_id, contact_email: @voucher.contact_email, contact_name: @voucher.contact_name, payment_type: @voucher.payment_type, status: @voucher.status, total: @voucher.total } }
    end

    assert_redirected_to voucher_url(Voucher.last)
  end

  test "should show voucher" do
    get voucher_url(@voucher)
    assert_response :success
  end

  test "should get edit" do
    get edit_voucher_url(@voucher)
    assert_response :success
  end

  test "should update voucher" do
    patch voucher_url(@voucher), params: { voucher: { activity_id: @voucher.activity_id, contact_email: @voucher.contact_email, contact_name: @voucher.contact_name, payment_type: @voucher.payment_type, status: @voucher.status, total: @voucher.total } }
    assert_redirected_to voucher_url(@voucher)
  end

  test "should destroy voucher" do
    assert_difference("Voucher.count", -1) do
      delete voucher_url(@voucher)
    end

    assert_redirected_to vouchers_url
  end
end
