require 'open-uri'
require 'json'

class GamesController < ApplicationController

  def new
    @letters = Array.new(7) { ('A'..'Z').to_a.sample }
  end

  def score
    @word = params['writtenWord'].upcase()
    @letters = params['letters']
    @api_res = URI.open("https://wagon-dictionary.herokuapp.com/#{@word}").read()
    @api_res = JSON.parse(@api_res).transform_keys!(&:to_sym)
    
    
    @valid_word = validate_word(@word.split(''), @letters.split(' '))
    
    if (@api_res[:found] == false || @valid_word == false )
      session[:score] = 0
    else
      session[:score] += @api_res[:length].to_i
    end 
    @message = @valid_word
    @score = session[:score]
  end

  def validate_word(arr_word, arr_letters)
    arr_word.each do |char|
      return false unless (arr_letters.include?(char))
    end
    return true
  end

end
