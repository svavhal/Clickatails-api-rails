class ChangeColumnToSmsTexts < ActiveRecord::Migration
  def change
    change_column :sms_texts, :recipient, :string
  end
end
