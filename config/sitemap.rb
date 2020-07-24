# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "https://coderdojo.jp"

SitemapGenerator::Sitemap.create do
  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host

  add events_path,      priority: 0.8
  add '/kata',          priority: 0.8
  add partnership_path, priority: 0.7
  add stats_path,       priority: 0.7
  add charter_path,     priority: 0.6
  add podcasts_path,    priority: 0.6
  add docs_path,        priority: 0.5
  add teikan_path,      priority: 0.5
  add privacy_path,     priority: 0.5


  # Examples:
  #
  # Add '/articles'
  #
  #   add articles_path, :priority => 0.7, :changefreq => 'daily'
  #
  # Add all articles:
  #
  #   Article.find_each do |article|
  #     add article_path(article), :lastmod => article.updated_at
  #   end
end
