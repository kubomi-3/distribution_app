class CreateAns3s < ActiveRecord::Migration[6.0]
  def change
    create_table :ans3s do |t|
      t.references :user,    null: false, foreign_key: true
      t.references :subject, null: false, foreign_key: true
      t.timestamps
    end
  end
end
