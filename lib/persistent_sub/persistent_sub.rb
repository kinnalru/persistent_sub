# frozen_string_literal: true
module PersistentSub #:nodoc:
  def self.subscribe channel, target, method = nil
  	if target.is_a? ActiveRecord::Base
	elsif target.is_a? Class
	end
  end

  class Event

  end

  def self.dispatch channel, event
  	subscriptions = Subscription.all.where(channel: channel)
	subscriptions.each do |sub|
	  self.deliver(sub, event)
	end
  end

  def self.deliver subscription, event
  	klass = subscription.target_type.constantize

  	if subscription.target_id.present?
  	  target = klass.find(subscription.target_id)
  	else
  	  target = klass
  	end

  	target.send(subscription.method, event)
  rescue => e
  	if autoclean
  	  subscription.destroy
  	end
  end


end
