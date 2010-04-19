# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application'

class MaileeSpreeExtension < Spree::Extension
  version "0.0.1"
  description "MaileeSpree: Spree e-mail marketig with Mailee.me"
  #url "git://github.com/jaymendoza/spree-blogging-spree.git"

  def activate
    require 'mailee'
    ActiveRecord::Base.send(:include, Mailee::Sync)
    User.class_eval do 
      sync_with_mailee
    end 
  
  end

  def self.require_gems(config)
    #    config.gem 'is_taggable'
  end

  def deactivate
  end
end
