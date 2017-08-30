# frozen_string_literal: true
module PersistentSub #:nodoc:
  def self.subscribe channel, target, method = nil
  	if target.is_a? ActiveRecord::Base
	elsif target.is_a? Class
	end
  end

  def self.publish channel, data
  	event = Event.new(data)
  	self.dispatch(channel, event)
  end

  class Event
  end

  class Subscription
  end

  def self.dispatch channel, event
  	subscriptions = Subscription.all.where(channel: channel)
	subscriptions.each do |sub|
	  self.deliver(sub, event)
	end
  end

  def self.deliver sub, event
  	target = self.find_target(sub)

  	target.send(sub.method, event)
  rescue => e
  	if autoclean
  	  sub.destroy
  	end
  end

  def find_target sub
    target = sub.target_type.safe_constantize
    raise "Class #{sub.target_type} not found" unless target

    if sub.target_id.present?
      target = target.find_by_id(sub.target_id)
      raise "Record #{sub.target_type} with [#{sub.target_id}] not found" unless target
    end

    raise "Method #{sub.method} not found on #{sub.target_type} with [#{sub.target_id}]" unless target.respond_to? sub.method
    target
  end


end
