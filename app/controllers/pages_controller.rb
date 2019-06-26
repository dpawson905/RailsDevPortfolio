class PagesController < ApplicationController
  def home
    @posts = Blog.all
    @skills = Skill.all
    @users = User.all
  end

  def about
  end

  def contact
  end
end
