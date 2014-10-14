###
# Compass
###

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", :locals => {
#  :which_fake_page => "Rendering a fake page with a local variable" }

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'

ready do
  sprockets.append_path "#{root}/vendor/bower"
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
#  ga.development = true # Tracking in development environment
#  ga.minify = true # Compress the JavaScript code
end

# Development-specific configuration
configure :development do
  # Reload the browser automatically whenever files change
  activate :livereload

  activate :google_analytics do |ga|
    ga.debug = true
  end
end

# Build-specific configuration
configure :build do
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

  activate :google_analytics do |ga|
    ga.development = false
    ga.minify = true
  end
end
