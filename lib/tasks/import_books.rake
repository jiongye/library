require 'csv'

desc "Import temple books"
task :import_books => :environment do
  puts "Starting ..."
  file_path = Rails.root.join("db/data/temple_books.csv")
  CSV.foreach(file_path) do |row|
    category_name = row[0].strip
    temple_name = row[2].strip
    title = row[6].strip[0..-6]
    book_number = row[7].strip
    shelve_location = row[10].strip
    shelve_quantity = row[11].strip
    quantity = row[12].strip
    label = row[15].strip

    category = Category.find_or_create_by_name(category_name)
    temple = Temple.find_or_create_by_name(temple_name)
    book = Book.create!(:title => title, :temple_id => temple.id, :category_id => category.id, :shelve_location => shelve_location, :book_number => book_number, :label => label)
    Inventory.create!(:book_id => book.id, :shelve_quantity => shelve_quantity, :quantity => quantity)
  end

  puts "Done."
end