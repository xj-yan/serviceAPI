require 'sinatra/activerecord'

class User < ActiveRecord::Base
    def as_json(options = {})
        super(options.merge({ except: [:password] }))
  end
end