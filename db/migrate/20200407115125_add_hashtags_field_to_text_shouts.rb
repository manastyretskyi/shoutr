class AddHashtagsFieldToTextShouts < ActiveRecord::Migration[5.2]
  def change
    add_column :text_shouts, :hashtags, :string
  end
end
