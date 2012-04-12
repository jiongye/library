module ApplicationHelper

  def return_button_label(book)
    book.returned? ? 'Modify Return' : 'Return'
  end

end
