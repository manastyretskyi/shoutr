class TextShout < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  validates :body, presence: true, length: { in: 1..144 }

  settings index: { number_of_shards: 1 } do
    mapping dynamic: false do
      indexes :body, analyzer: 'english'
    end
  end
end
