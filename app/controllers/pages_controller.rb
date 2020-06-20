class PagesController < ApplicationController
  def home
    @random_number = rand(0...10_000)
    our_input_text = " heart"
    @heart = `python lib/assets/python/heart.py "#{our_input_text}"`
  end
end
