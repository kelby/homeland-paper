class CreatePapers < ActiveRecord::Migration[5.0]
  def change
    return if ActiveRecord::Base.connection.table_exists? :papers

    create_table :papers do |t|
      t.string :title
      t.text :body
    end
  end
end
