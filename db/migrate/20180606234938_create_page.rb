class CreatePage < ActiveRecord::Migration[5.2]
  def change
    create_table :pages do |t|
      t.string :page_url

      t.timestamps
    end
  end
end
