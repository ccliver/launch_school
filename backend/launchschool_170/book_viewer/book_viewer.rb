require "sinatra"
require "sinatra/reloader" if development?
require 'tilt/erubis'

helpers do
  def in_paragraphs(text)
    text.split("\n\n").each_with_index.map do |line, index|
      "<p id=paragraph#{index}>#{line}</p>"
    end.join
  end

  def highlight_query(text, query)
    text.gsub(/#{query}/, "<strong>#{query}</strong>")
  end
end

before do
  @contents = File.readlines('data/toc.txt')
end

not_found do
  redirect '/'
end

get "/" do
  @title = 'The Adventures of Sherlock Holmes'
  erb :home
end

get "/chapters/:number" do
  number = params[:number]
  @title = "Chapter #{number} - #{@contents[number.to_i - 1]}"
  @chapter = File.read("data/chp#{number}.txt")

  erb :chapter
end

# Calls the block for each chapter, passing that chapter's number, name, and
# contents.
def each_chapter(&block)
  @contents.each_with_index do |name, index|
    number = index + 1
    contents = File.read("data/chp#{number}.txt")
    yield number, name, contents
  end
end

# This method returns an Array of Hashes representing chapters that match the
# specified query. Each Hash contain values for its :name, :number, and
# :paragraphs keys. The value for :paragraphs will be a hash of paragraph indexes
# and that paragraph's text.
def chapters_matching(query)
  results = []

  return results unless query

  each_chapter do |number, name, contents|
    matches = {}
    contents.split("\n\n").each_with_index do |paragraph, index|
      matches[index] = paragraph if paragraph.include?(query)
    end
    results << {number: number, name: name, paragraphs: matches} if matches.any?
  end

  results
end

get "/search" do
  @results = chapters_matching(params[:query])
  erb :search
end