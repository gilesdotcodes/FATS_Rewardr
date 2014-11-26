module BadgesHelper

  def show_recent_badge(array_index)
    @badge_recipient = User.find(@all_badges[array_index].user_id)
    "#{@badge_recipient.name} awarded the #{@all_badges[array_index].name.titleize} reward on #{@all_badges[array_index].created_at.strftime("%d %B %Y")}"
  end

end
