class Book < ActiveRecord::Base
	def create
    @book = Book.new(book_params)
  end

  private
  def book_params
    params.require(:book).permit(:Name)
  end
	belongs_to :author
	belongs_to :library
	validates :name, :presence =>true
end

