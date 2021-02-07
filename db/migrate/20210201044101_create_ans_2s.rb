class CreateAns2s < ActiveRecord::Migration[6.0]
  def change
    create_table :ans2s do |t|
      t.references :user,    null: false, foreign_key: true
      t.references :subject, null: false, foreign_key: true
      t.timestamps
    end
  end
end
