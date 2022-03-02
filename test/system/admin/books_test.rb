require "application_system_test_case"

class Admin::BooksTest < ApplicationSystemTestCase
  setup do
    @admin_book = admin_books(:one)
  end

  test "visiting the index" do
    visit admin_books_url
    assert_selector "h1", text: "Admin/Books"
  end

  test "creating a Book" do
    visit admin_books_url
    click_on "New Admin/Book"

    click_on "Create Book"

    assert_text "Book was successfully created"
    click_on "Back"
  end

  test "updating a Book" do
    visit admin_books_url
    click_on "Edit", match: :first

    click_on "Update Book"

    assert_text "Book was successfully updated"
    click_on "Back"
  end

  test "destroying a Book" do
    visit admin_books_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Book was successfully destroyed"
  end
end
