require 'slack-ruby-bot'

class CutieBot < SlackRubyBot::Bot
  command 'ping' do |client, data, match|
    client.say(text: 'pong', channel: data.channel)
  end

  command 'exit' do |client, data, match|
    abort
  end

  match /exec (?<command>.*)/ do |client, data, match|
    client.say(channel:data.channel, text: eval(match[:command]))
  end


match /(?<word>\w*[e][n]\w*)/ do |client, data, match|
  if Random.rand(1..42) == 37
    word = []
    match[:word].split("en").each do |c|
        word.push(c)
    end	
    client.say(channel:data.channel, text: word.join("erin"))
 end
end
  match /\ in\w+/i do |client, data, match|
    if Random.rand(1..42) == 42
    client.say(text: data.text.gsub(' in', ' erin'), channel: data.channel)
    end
  end

  match /tran/ do |client, data, match|
    client.say(text: data.text.gsub('tran' , 'tram'), channel: data.channel)
  end


  match /tram/ do |client, data, match|
    client.say(text: data.text.gsub('tram' , 'tran'), channel: data.channel)
  end

  match /thanks (?<name>\w*)/i do |client, data, match|
    name = []
    done = 0
    match[:name].split("").each do |c|
      if "aeiouAEIOU".include? c
        name.push(c)
        done = 1
      elsif done == 1
        name.push(c)
      end
    end
    client.say(channel: data.channel, text: "th" + name.join("").downcase)
  end

  match /e/ do |client, data, match|
    if data.channel == "C0JTC29LG"
    model = Ebooks::Model.load("model/model.model")
    client.say(text: model.make_response(data.text, 180), channel: data.channel)
    elsif Random.rand(1..42) == 1
    model = Ebooks::Model.load("model/model.model")
    client.say(text: model.make_response(data.text, 180), channel: data.channel)
    end
  end
end

CutieBot.run
