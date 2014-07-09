class Author < ActiveRecord::Base
	def create
    @author = Author.new(author_params)
  end

  private
  def author_params
    params.require(:author).permit(:Name)
  end
	has_many :books
	validates :name, :presence =>true
end
