json.array!(@sms_texts) do |sms_text|
  json.extract! sms_text, :id, :recipient, :sms_message
  json.url sms_text_url(sms_text, format: :json)
end
