require 'open-uri'

module Bot::DiscordCommands
	module Admincommands
		extend Discordrb::Commands::CommandContainer

		command(:shutdown, help_available: false) do |event|
			break unless event.user.id == Bot::CONFIG.owner_id
			event.respond 'Shutting Down'
			puts "Shutting Down (Source: Discord Command from #{event.user.username} / #{event.user.id})"
			Bot::BOT.stop
		end
    command(:setname, help_available: false) do |event, name|
      break unless event.user.id == Bot::CONFIG.owner_id
      bot.profile.username = name
    end
    command(:setavatar, help_available: false) do |event, url|
      break unless event.user.id == Bot::CONFIG.owner_id
      URI.open(url) { |pic| Bot::BOT.profile.avatar = pic }
    end

	end
end
