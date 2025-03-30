class CreateJobs < ActiveRecord::Migration[8.0]
  def change
    create_table :jobs do |t|
      t.string :title, null: false
      t.string :company, null: false
      t.string :country, null: false
      t.text :stack, null: false
      t.string :remote_policy, null: false
      t.contract_type :string, null: false
      t.date :published_at

      t.timestamps
    end
  end
end
