require 'discordrb'
require 'yaml'

module Bot

	CONFIG = OpenStruct.new YAML.load_file 'settings/config.yaml'

	BOT = Discordrb::Commands::CommandBot.new(client_id: CONFIG.client_id, token: CONFIG.token, prefix: CONFIG.prefix)

	module DiscordCommands; end
	Dir['src/modules/*.rb'].each { |mod| load mod }
	DiscordCommands.constants.each do |mod|
	  BOT.include! DiscordCommands.const_get mod
	end

	BOT.ready do
    START_TIME = Time.now
		puts "WoW-Stats is fully loaded\n Invite link '#{BOT.invite_url}'"
	end

	BOT.run
end
