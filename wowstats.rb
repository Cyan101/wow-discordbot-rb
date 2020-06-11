require 'discordrb'
require_relative 'config.rb'

module Bot
	CONFIG = Config.new('config.yaml')

#	bot = Discordrb::Commands::CommandBot.new token: CONFIG.bot_key, client_id: CONFIG.bot_id, prefix: CONFIG.prefix
	bot = Discordrb::Commands::CommandBot.new token: CONFIG.bot_key, prefix: CONFIG.prefix

	puts 'Loading WoW-Stats Modules'	

	module DiscordCommands; end
	Dir['modules/*.rb'].each { |x| load x }
	DiscordCommands.constants.each do |x|
		bot.include! DiscordCommands.const_get x
	end

	puts 'WoW-Stats Modules Loaded'


	bot.ready do
		puts "WoW-Stats is fully loaded\n Invite link '#{bot.invite_url}'"
	end
	
	bot.run
end
