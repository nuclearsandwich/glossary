task :compile do
  require "mustache"
  require_relative "lib/glossary"
  include Glossary


  Dir["entries/*.rb"].each do |entry|
    require_relative entry
  end

  layout = Mustache.new
  layout.template = File.read "layout.mustache"
  def layout.entries
    Entry.entries.map{|e| HTMLEntry.new e }
  end

  File.write "index.html", layout.render
end

task :default => :compile
