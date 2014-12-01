module UsersHelper

  def show_last_six_rewards_reward(user, number)
    if @my_badges[-number]
      "#{@my_badges[-number].name.titleize}"
    end
  end

  def show_last_six_rewards_date(user, number)
    if @my_badges[-number]
      "#{@my_badges[-number].created_at.strftime("%d %B %Y")}"
    end
  end

  def days_since_last_reward(user)
    if @my_badges.any?
      difference = Time.now - (@my_badges[-1].created_at)
    else
      difference = Time.now - user.created_at
    end
      (((difference/60)/60)/24).floor
  end

  def total_number_of_rewards(user)
    @my_badges.length
  end

  def most_popular_reward(user)
    @reward_names = []
    @my_badges.each do |badge|
      @reward_names << badge.name
    end
    @result = Hash.new(0)
    @reward_names.each {|reward| @result[reward] += 1}
    @result.max_by{|k,v| v}[0].titleize
  end

  def count_of_most_popular_reward(user)
    @reward = most_popular_reward(user)
    @counter = 0
    @my_badges.each do |badge|
      @counter += 1 if badge.name.titleize == @reward
    end
    @counter
  end

  def show_recent_reward_employee(array_index)
    @badge_recipient = User.find(@all_badges[array_index].user_id)
    "#{@badge_recipient.name}"
  end

  def show_recent_reward_name(array_index)
    @badge_recipient = User.find(@all_badges[array_index].user_id)
    "#{@all_badges[array_index].name.titleize}"
  end

  def show_recent_reward_date(array_index)
    @badge_recipient = User.find(@all_badges[array_index].user_id)
    "#{@all_badges[array_index].created_at.strftime("%d %B %Y")}"
  end

  def reward_image(reward)
    @images = ['/images/Angel.gif', '/images/sales.jpeg', '/images/service.png', '/images/Star.png', '/images/Positive.png', '/images/lean.png', '/images/team.png'];
    @reward = ['Angel', 'Sales', 'Service', 'Star', 'Positive', 'Lean', 'Team']
    @position = @reward.index(reward)
    @images[@position]
  end


end