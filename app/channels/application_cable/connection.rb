module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user
 
    def connect
      self.current_user = find_verified_user
    end 
 
    private
      def find_verified_user
        begin
          token = request.headers[:HTTP_SEC_WEBSOCKET_PROTOCOL].split(' ').last
          if (!token.nil?)
            token
          else
            reject_unauthorized_connection
          end 
        rescue
          reject_unauthorized_connection
        end 
      end 
  end
end
