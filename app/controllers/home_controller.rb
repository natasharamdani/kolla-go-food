class HomeController < ApplicationController
  def hello
    @today = Date.today
    @users = User.all
  end

  def goodbye
    @tomorrow = Date.today + 1.days
  end
end
