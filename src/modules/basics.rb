require 'time_diff'

module Bot::DiscordCommands
  module Basics
    extend Discordrb::Commands::CommandContainer

    desc_invite = 'Post an invite url for the bot to add it to another server'
    desc_roll = 'Rolls an `x` sided die, or between both numbers specified'
    desc_uptime = 'Uptime of the bot'
    usage_roll = 'roll <max>` or `roll <min> <max>'
    Bot::BOT.bucket :ping, limit: 1, time_span: 25
    Bot::BOT.bucket :invite, limit: 1, time_span: 240

    command(:ping, bucket: :ping, help_available: false) do |event|
	     event.respond "pong o/ #{event.user.name}"
    end
    command(:invite, bucket: :invite, description: desc_invite) do |event|
      event.respond "<#{Bot::BOT.invite_url}>"
    end
    command(:roll, usage: usage_roll, description: desc_roll, min_args: 1) do |event, min = 1, max|
      rand(min.to_i..max.to_i)
    end
    command(:tada, help_available: false) do |event|
      ':tada::tada::tada::tada::tada:'
    end
    command(:uptime, bucket: :ping, description: desc_uptime) do |event|
      uptime = Time.diff(Time.now, Bot::START_TIME)
      'Uptime: '\
      "`#{uptime[:day]} days,"\
      " #{uptime[:hour]} hours &"\
      " #{uptime[:minute]} min`"
    end

  end
end
