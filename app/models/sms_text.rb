class SmsText < ActiveRecord::Base
  validates :recipient,  :sms_message, presence: true
end
