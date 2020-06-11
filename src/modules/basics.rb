module Bot::DiscordCommands
  module Basics
    extend Discordrb::Commands::CommandContainer

    command(:ping, help_available: false) do |event|
	event.respond "pong"
    end

  end
end
