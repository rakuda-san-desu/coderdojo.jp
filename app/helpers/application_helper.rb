# -*- coding: utf-8 -*-
module ApplicationHelper
  def full_title(page_title)
    page_title = @obj.display_title if page_title.empty? && @obj && !@obj.permalink.nil?
    if page_title.empty?
      "CoderDojo Japan - 子どものためのプログラミング道場" # Default title
    else
      "#{page_title} - CoderDojo Japan"
    end
  end

  def full_url(page_url)
    # When URL is composed by Scrivito
    return "https://coderdojo.jp/#{@obj.permalink}" if @obj && !@obj.permalink.nil?

    # When URL is composed by Rails
    if page_url.empty?
      # Set og:url with request param
      request.url
    else
      # Set og:url with given param
      page_url
    end
  end

  def full_description(description)
    description = kata_description if @obj && @obj.permalink == "kata"
    if description.empty?
      "CoderDojo は子どものためのプログラミング道場です。2011年にアイルランドで始まり、日本では#{Dojo.active_dojos_count}ヶ所以上、世界では#{Dojo::NUM_OF_COUNTRIES}ヶ国・#{Dojo::NUM_OF_WORLD_DOJOS}ヶ所で開催されています。" # Default description
    else
      description
    end
  end

  def meta_image(filepath)
    base_url = Rails.env.development? ? 'http://localhost:3000/' : 'https://coderdojo.jp/'
    filepath = '/img/ogp-default.jpg' if filepath.blank?
    filepath = filepath[1..]          if filepath.starts_with? '/'
    base_url + filepath
  end

  def kata_description
    "道場で役立つ資料やコンテスト情報、立ち上げ方や各種支援をまとめています。"
  end

  def using_scrivito?
    !@obj.nil?
  end

  def is_kata?
    request.path.starts_with? "/kata"
  end

  # 画像を aFarkas/lazysizes 経由で遅延読み込みする
  # cf. https://github.com/aFarkas/lazysizes
  def lazy_image_tag(source, options={})
    options['data-src'] = asset_path(source)
    options['loading']  = 'lazy' # Optimize if available
    options[:class].blank? ?
      options[:class] = "lazyload" :
      options[:class] = "lazyload #{options[:class]}"

    if options[:min] == true
      # Use minified image path: foo.png -> foo.min.png
      image_tag(asset_path(source).split('.').join('.min.'),  options)
    elsif !options[:min].blank?
      # The minified path above can be overridden if path is given.
      image_tag(asset_path(options[:min]), options)
    else
      # Default minified image is spinner.
      image_tag(asset_path('/spinner.svg'), options)
    end
  end

  # NOTE: Delete this helper to avoid overriding when /dojos routing is added.
  def dojos_path(options={anchor: 'dojos'})
    root_path(options)
  end

  def welcome_path(options={anchor: 'welcome'})
    root_path(options)
  end

  def news_path(options={anchor: 'news'})
    root_path(options)
  end

  def news_url(path='/')
    'https://news.coderdojo.jp' + path
  end

  def dojoletter_url()
    'https://news.coderdojo.jp/category/dojoletter%E3%83%90%E3%83%83%E3%82%AF%E3%83%8A%E3%83%B3%E3%83%90%E3%83%BC/'
  end

  def foundation_url(path='/foundation/')
    'https://coderdojo.com' + path
  end

  def zen_url(path='/find')
    'https://zen.coderdojo.com' + path
  end
end
