require 'slack-ruby-bot'

class CutieBot < SlackRubyBot::Bot
  command 'ping' do |client, data, match|
    client.say(text: 'pong', channel: data.channel)
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
