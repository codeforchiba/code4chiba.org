# Activate and configure extensions
# https://middlemanapp.com/advanced/configuration/#configuring-extensions

activate :external_pipeline,
  name: :webpack,
  command: build? ? './node_modules/webpack/bin/webpack.js -p --bail' : './node_modules/webpack/bin/webpack.js --watch -d',
  source: ".tmp/dist",
  latency: 1

activate :autoprefixer do |prefix|
  prefix.browsers = "last 2 versions"
end

# Activate s3_sync extension
activate :s3_sync do |s3_sync|
  s3_sync.bucket                     = 'code4chiba.org'
  s3_sync.region                     = 'ap-northeast-1'
  s3_sync.aws_access_key_id          = ENV['AWS_ACCESS_KEY_ID']
  s3_sync.aws_secret_access_key      = ENV['AWS_SECRET_ACCESS_KEY']
  s3_sync.delete                     = false
  s3_sync.after_build                = false
  s3_sync.prefer_gzip                = true
  s3_sync.path_style                 = true
  s3_sync.reduced_redundancy_storage = false
  s3_sync.acl                        = 'public-read'
  s3_sync.encryption                 = false
end

# Activate google-analytics extension
activate :google_analytics do |ga|
  ga.tracking_id = 'UA-37188783-4'
#  ga.anonymize_ip = false # removing the last octet of the IP address
#  ga.domain_name = 'code4chiba.org' # Track for (cross-domain tracking)
#  ga.allow_linker = false # Multiple top-level domains (needs domain_name to be set)
#  ga.debug = false # Manually set debug flag (if true, links to /u/ga_debug.js)
 ga.minify = true # Compress the JavaScript code
end

# Layouts
# https://middlemanapp.com/basics/layouts/

# Per-page layout changes
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# With alternative layout
# page '/path/to/file.html', layout: 'other_layout'

# Proxy pages
# https://middlemanapp.com/advanced/dynamic-pages/

# proxy(
#   '/this-page-has-no-template.html',
#   '/template-file.html',
#   locals: {
#     which_fake_page: 'Rendering a fake page with a local variable'
#   },
# )

# Helpers
# Methods defined in the helpers block are available in templates
# https://middlemanapp.com/basics/helper-methods/

# helpers do
#   def some_helper
#     'Helping'
#   end
# end

# Mode-specific configuration
# https://middlemanapp.com/advanced/configuration/#environment-specific-settings

# configure :build do
#   activate :minify_css
#   activate :minify_javascript
# end

# Environment-specific configuration
configure :development do
  set :css_dir, 'stylesheets'
  set :js_dir, 'javascripts'
  set :images_dir, 'images'
  set :fonts_dir, 'fonts'

  activate :livereload
end

# Production-specific configuration
configure :production do
  set :css_dir, 'stylesheets'
  set :js_dir, 'javascripts'
  set :images_dir, 'images'
  set :fonts_dir, 'fonts'

  # For example, change the Compass output style for deployment
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript

  # Enable cache buster
  # activate :asset_hash

  # Use relative URLs
  # activate :relative_assets

  # Or use a different image path
  # set :http_prefix, "/Content/images/"
end
