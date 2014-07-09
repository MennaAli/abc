class Library < ActiveRecord::Base
	def create
    @library = Library.new(library_params)
  end

  private
  def library_params
    params.require(:library).permit(:Name)
  end
	has_many :books
	validates :name, :presence =>true
	validates :url, :presence =>true
end

