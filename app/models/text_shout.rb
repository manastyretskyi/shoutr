class TextShout < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  before_save :find_hashtags

  validates :body, presence: true, length: { in: 1..144 }

  settings index: { number_of_shards: 1 } do
    mapping dynamic: false do
      indexes :body, analyzer: 'english'
      indexes :hashtags, analyzer: 'english'
    end
  end

  private

  def find_hashtags
    self.hashtags = body.scan(/#\w+/).join(", ")
  end
end
