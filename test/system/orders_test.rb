require "application_system_test_case"

class OrdersTest < ApplicationSystemTestCase
  setup do
    @order = orders(:one)
  end

  test "visiting the index" do
    visit orders_url
    assert_selector "h1", text: "Orders"
  end

  test "should create order" do
    visit orders_url
    click_on "New order"

    fill_in "Email", with: @order.email
    fill_in "Extra sauce", with: @order.extra_sauce
    fill_in "Guest code", with: @order.guest_code
    fill_in "Note", with: @order.note
    fill_in "Plates", with: @order.plates
    fill_in "Spice level", with: @order.spice_level
    click_on "Create Order"

    assert_text "Order was successfully created"
    click_on "Back"
  end

  test "should update Order" do
    visit order_url(@order)
    click_on "Edit this order", match: :first

    fill_in "Email", with: @order.email
    fill_in "Extra sauce", with: @order.extra_sauce
    fill_in "Guest code", with: @order.guest_code
    fill_in "Note", with: @order.note
    fill_in "Plates", with: @order.plates
    fill_in "Spice level", with: @order.spice_level
    click_on "Update Order"

    assert_text "Order was successfully updated"
    click_on "Back"
  end

  test "should destroy Order" do
    visit order_url(@order)
    click_on "Destroy this order", match: :first

    assert_text "Order was successfully destroyed"
  end
end
