class NasanaChannel < ApplicationCable::Channel
  def subscribed
    stream_from "nasana"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def broadcast_position_to_tracker(data)
    ActionCable.server.broadcast "nasana",  {position: data}
  end
end
