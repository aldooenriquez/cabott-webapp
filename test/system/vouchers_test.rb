require "application_system_test_case"

class VouchersTest < ApplicationSystemTestCase
  setup do
    @voucher = vouchers(:one)
  end

  test "visiting the index" do
    visit vouchers_url
    assert_selector "h1", text: "Vouchers"
  end

  test "should create voucher" do
    visit vouchers_url
    click_on "New voucher"

    fill_in "Activity", with: @voucher.activity_id
    fill_in "Contact email", with: @voucher.contact_email
    fill_in "Contact name", with: @voucher.contact_name
    fill_in "Payment type", with: @voucher.payment_type
    fill_in "Status", with: @voucher.status
    fill_in "Total", with: @voucher.total
    click_on "Create Voucher"

    assert_text "Voucher was successfully created"
    click_on "Back"
  end

  test "should update Voucher" do
    visit voucher_url(@voucher)
    click_on "Edit this voucher", match: :first

    fill_in "Activity", with: @voucher.activity_id
    fill_in "Contact email", with: @voucher.contact_email
    fill_in "Contact name", with: @voucher.contact_name
    fill_in "Payment type", with: @voucher.payment_type
    fill_in "Status", with: @voucher.status
    fill_in "Total", with: @voucher.total
    click_on "Update Voucher"

    assert_text "Voucher was successfully updated"
    click_on "Back"
  end

  test "should destroy Voucher" do
    visit voucher_url(@voucher)
    click_on "Destroy this voucher", match: :first

    assert_text "Voucher was successfully destroyed"
  end
end
