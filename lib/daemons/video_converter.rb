# -*- encoding : utf-8 -*-
#!/usr/bin/env ruby

# You might want to change this
ENV["RAILS_ENV"] ||= "development"

require File.dirname(__FILE__) + "/../../config/application"
Rails.application.require_environment!

$running = true
Signal.trap("TERM") do 
  $running = false
end
log = Rails.logger
while($running) do
  if video = Video.where(:state => :pending).first 
    video.transcode!
  end
  sleep 20
end
