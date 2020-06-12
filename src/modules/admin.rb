module Bot::DiscordCommands
	module Admincommands
		extend Discordrb::Commands::CommandContainer

		command(:shutdown, help_available: false) do |event|
			puts event.user.id
			puts Bot::CONFIG.owner_id
			break unless event.user.id == Bot::CONFIG.owner_id
			event.respond 'Shutting Down'
			puts "Shutting Down (Source: Discord Command from #{event.user.username} / #{event.user.id})"
			Bot::BOT.stop
		end

	end
end
