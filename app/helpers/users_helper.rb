module UsersHelper

  def show_last_six_rewards(user, number)
    if @my_badges[-number]
      "#{@my_badges[-number].name.titleize} on #{@my_badges[-number].created_at.strftime("%d %B %Y")}"
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

end