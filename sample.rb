require "slack-notify"
require 'clockwork'
require 'dotenv/load'

require 'active_support/time'


module Clockwork

	client = SlackNotify::Client.new(
		webhook_url: ENV['URL'],
		channel: "#dev",
		username: "chalBot",
		icon_emoji: ":shipit:",
		link_names: 1
	)

	handler do |job|
		puts "Running #{job}"
	end

	every(10.seconds, 'message_sent') do
		client.notify("Hello There! I am the Bot")
	end
  
end
