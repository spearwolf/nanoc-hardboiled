include Nanoc3::Helpers::Rendering

def meta_tag(name, content)
  tag "meta", name: name, content: content
end

# the follwoing is shameless copied from ..
#   https://github.com/camerond/nanoc-skeleton/blob/master/lib/helpers.rb
#   .. but slighty modified

def stylesheet_link_tag(string_or_array, *args)
  files = string_or_array.is_a?(Array) ? string_or_array : [string_or_array]
  options = {
    :media => "screen",
    :rel => "stylesheet"
  }.merge(args.last.is_a?(::Hash) ? pop : {})

  files.map do |file|
    path = "/css/#{file}.css"
    options[:href] = path
    tag(:link, options)
  end.join("\n")
end

def javascript_include_tag(string_or_array, *args)
  files = string_or_array.is_a?(Array) ? string_or_array : [string_or_array]
  options = {
    # :charset => "utf-8"
  }.merge(args.last.is_a?(::Hash) ? pop : {})

  files.map do |file|
    path = "/js/#{file}.js"
    options[:src] = path
    content_tag(:script, "", options)
  end.join("\n")
end

def tag(name, options={})
  return "<#{name} " + options.map {|k,v| "#{k}='#{v}'"}.join(' ') + "/>"
end

def content_tag(name,content,options={})
  "<#{name} " + options.map {|k,v| "#{k}='#{v}'"}.join(' ') + ">#{content}</#{name}>"
end