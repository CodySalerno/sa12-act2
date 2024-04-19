require 'httparty'
require 'json'
print "username: "
username = gets.chomp

response = HTTParty.get("https://api.github.com/users/#{username}/repos")

if response.success?
  repositories = JSON.parse(response.body)
  most_starred_repo = repositories.max_by { |repo| repo['stargazers_count'] }

  puts "Most Starred Repo:"
  puts "Name: #{most_starred_repo['name']}"
  puts "Description: #{most_starred_repo['description']}"
  puts "Stars: #{most_starred_repo['stargazers_count']}"
  puts "URL: #{most_starred_repo['html_url']}"
else
  puts "Couldn't find repos for user #{username}."
end
