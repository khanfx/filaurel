require "sinatra"
require "sinatra/activerecord"
require "./models"

# Add this code to create a breakpoint anywhere
# require 'pry'; binding.pry

set :bind, '0.0.0.0'
set :port, 4567

before do
  content_type :json
end

get "/" do
  "Welcome to eBill toy, a test (but real!) Ruby service."
end

get "/ebills" do
  x=Ebill.all.includes(:EbillUpdate, :Payment)
  x.as_json(include: :Payment).to_json

  # Note that what's used here is not the JSON module, but rather part of Active Record
  # https://api.rubyonrails.org/classes/ActiveModel/Serializers/JSON.html
end

post "/ebills" do
  data = JSON.parse request.body.read
  @ebill = Ebill.new(data)
  @ebill.save
  @ebill.to_json
end

get "/ebills2" do
  db = SQLite3::Database.new "ebilltoy-main.sqlite3"
  results = db.execute("select * from ebills")
  results.to_json
end

post "/payments" do
  data = JSON.parse request.body.read

  @payment = Payment.new(data)

  @ebill = Ebill.find_by(ebillRef: @payment.ebillRef);
  @payment.ebill_id = @ebill.id

  @payment.save
  # TODO check against the ebill, add status update if total matches or exceeds due
  @payment.to_json
end



