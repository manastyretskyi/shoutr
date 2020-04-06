class Search

  attr_reader :term

  def initialize(term:, page: 1)
    @term = term
    @page = page
  end

  def run
    ShoutSearchQuery.new(term).to_relation.paginate(page: @page)
  end

  alias results run
   
end