module Bot::DiscordCommands
        module Admincommands
                extend Discordrb::EventContainer

		message(contains: /(asmon)/i) do |event|
			event.respond 'MALD'
		end
		message(contains: /(efexx)/i) do |event|
			event.respond 'Go F$#@ yourself Efexx!'
		end

	end
end
