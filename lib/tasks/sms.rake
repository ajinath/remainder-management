namespace :Schedule do
  desc "This task is for sending an scheduled sms"
  task :sms => :environment do
    require "rubygems"
    require "net/https"
    require "uri"
    require "json"
    uname = "amardeep129@gmail.com"
    hash = "2071f10086cc9d76cf8f19a632c9964744e11b0f"
    numbers = "9762342328"
    message = "Hi Sandip bhava BARA GAON DUSRI TAVA AK GAON BHOSARI"
    sender = "TXTLCL"
    schedule_time = "1459518892"
    requested_url = 'http://api.textlocal.in/send/?' + "username=" + uname + "&hash=" + hash + "&numbers=" + numbers + "&message=" + URI.escape(message) + "&sender=" + sender + "&schedule_time=" + schedule_time 

    uri = URI.parse(requested_url)
    http = Net::HTTP.start(uri.host, uri.port)
    request = Net::HTTP::Get.new(uri.request_uri)
    res = http.request(request)
    response = JSON.parse(res.body)
    puts (response)
  end
end

 