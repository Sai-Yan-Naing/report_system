class CreateReports < ActiveRecord::Migration[6.0]
  def change
    create_table :reports do |t|
      t.references :user, null: false, foreign_key: true
      t.date :date
      t.string :morning
      t.string :evening
      t.string :remark

      t.timestamps
    end
  end
end
