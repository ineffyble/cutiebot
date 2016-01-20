require 'slack-ruby-bot'

class CutieBot < SlackRubyBot::Bot
  command 'ping' do |client, data, match|
    client.say(text: 'pong', channel: data.channel)
  end

  command 'exit' do |client, data, match|
    abort
  end

#  match /(?<name>[a-zA-Z]*[e][n][a-zA-Z]*)/ do |client, data, match|
#    name = []
#    match[:name].split("en").each do |c|
#     name.push(c)
#    end
#    client.say(channel:data.channel, text: name.join(""))
#  end

match /(?<word>\w*[e][n]\w*)/ do |client, data, match|
    word = []
    match[:word].split("en").each do |c|
        word.push(c)
    end	
    client.say(channel:data.channel, text: word.join("erin"))
end
  match /\ in\w+/i do |client, data, match|
    client.say(text: data.text.gsub(' in', ' erin'), channel: data.channel)
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
    client.say(channel: data.channel, text: "Th" + name.join(""))
  end
end

CutieBot.run
