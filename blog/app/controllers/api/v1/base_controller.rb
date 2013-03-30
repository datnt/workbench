module Api
  module V1
    class BaseController < ApplicationController
    private
      def current_user
        puts "=="
        puts "=="
        puts "=="
        puts "=="
        puts "=="
        puts "=="
        puts "=="
        puts "=="
        puts "=="
        puts "v ="
        puts "v =#{doorkeeper_token}"
        if doorkeeper_token
          puts "++"
          puts "++"
          puts "++"
          puts "++"
          puts "++"
          puts "++"
          puts "++"
          puts "++"
          puts "++"
          puts "++"
          puts "++"
          @current_user ||= User.find(doorkeeper_token.resource_owner_id)
        end
      end
    end
  end
end
