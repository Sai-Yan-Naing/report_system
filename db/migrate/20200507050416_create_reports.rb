class CreateReports < ActiveRecord::Migration[6.0]
  def change
    create_table :reports do |t|
      t.integer :user_id
      t.date :rp_date
      t.text :morning
      t.text :evening
      t.text :remark

      t.timestamps
    end
  end
end
