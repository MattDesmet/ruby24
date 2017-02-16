class PagesController < ApplicationController
  def home
    @posts = Blog.all
    @blogs = Blog.all
    @skills = Skill.all
  end

  def about
    @skills = Skill.all
    @blogs = Blog.all

    # @skills
  end

  def contact
  end
end
