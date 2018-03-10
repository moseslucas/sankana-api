class NasanaChannel < ApplicationCable::Channel
  def subscribed
    stream_from "nasana_#{current_user}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def broadcast_position_to_tracker(data)
    ActionCable.server.broadcast "nasana_#{current_user}",  {position: data}
  end
end
