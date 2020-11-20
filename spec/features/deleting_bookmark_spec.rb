feature 'deleting a new bookmark' do
  scenario 'A user can delete a bookmark to Bookmark Manager' do 
    visit('/bookmarks/new')
    fill_in('url', with: 'http://www.testbookmark.com')
    fill_in('title', with: 'Test Bookmark')
    click_button('Submit')
    click_button('Delete')

    expect(page).to_not have_link('Test Bookmark', href: 'http://www.testbookmark.com')
  
  end
end