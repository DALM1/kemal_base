require "kemal"
require "ecr"

# Serve static files from the "public" folder
Kemal.config.public_folder = "public"

get "/" do |env|
  html = ECR.render("src/views/index.ecr")
  env.response.content_type = "text/html"
  html
end

get "/about" do |env|
  html = <<-HTML
  <html>
    <head>
      <title>About</title>
      <link rel="stylesheet" href="/styles.css">
    </head>
    <body>
      <h1>About Us</h1>
      <p>This is the about page.</p>
    </body>
  </html>
  HTML

  env.response.content_type = "text/html"
  html
end

Kemal.run
