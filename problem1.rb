require "httparty"

github_user = "memphis-cs-courses"

response = HTTParty.get("https://api.github.com/users/#{github_user}/repos")
body = JSON.parse(response.body)

highest_stars_index = 0
highest_stars = 0
body.each_with_index do |repo, index|
  if repo["stargazers_count"] > highest_stars
    highest_stars = repo["stargazers_count"]
    highest_stars_index = index
  end
end

repo = body[highest_stars_index]
puts "Name: #{repo["name"]}\nDescription: #{repo["description"]}\nNumber of stars: #{repo["stargazers_count"]}\nURL: #{repo["html_url"]}"
