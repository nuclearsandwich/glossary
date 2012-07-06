require "mustache"

module Glossary
  class Entry < Struct.new(:term, :definition)
    def initialize(*args)
      super
      self.class.entries << self
    end

    def self.entries
      @entries ||= []
    end
  end

  class HTMLEntry < Mustache
    attr_reader :entry
    self.template = <<-HTML
{{#entry}}<dt>{{term}}</dt><dd>{{definition}}</dd>{{/entry}}
    HTML

    def initialize(entry)
      @entry = entry
    end
  end

  def Entry *args
    Entry.new *args
  end
end
