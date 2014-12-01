module BadgesHelper

  def badge_recipient_name(badge)
    User.find(badge.user_id).name
  end

  def badge_name(badge)
    badge.name.titleize
  end

  def badge_award_date(badge)
    badge.created_at.strftime("%B %d, %Y")
  end
end
