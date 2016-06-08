class CreateSmsTexts < ActiveRecord::Migration
  def change
    create_table :sms_texts do |t|
      t.integer :recipient
      t.text :sms_message

      t.timestamps null: false
    end
  end
end
