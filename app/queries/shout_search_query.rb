class ShoutSearchQuery

  def initialize(term)
    @term = term
  end

  def to_relation
    matching_shouts_for_text_shouts.
      or(matching_shouts_for_photo_shouts).
      order(created_at: :desc)
  end
  
  
  private
  
  attr_reader :term
  
  def matching_shouts_for_text_shouts
    Shout.where(
      content_type: 'TextShout', 
      content_id: matching_text_shouts.map { |match| match.id })
  end
      
  def matching_text_shouts
    if term.include?("#")
      TextShout.search query: { match: { hashtags: term } }
    else
      TextShout.search(term)
    end
  end
  
  def matching_shouts_for_photo_shouts
    Shout.where(
      content_type: 'PhotoShout', 
      content_id: matching_photo_shouts.select(:id))
  end

  def matching_photo_shouts
    PhotoShout.where("image_file_name LIKE ?", "%#{term}%")
  end
end