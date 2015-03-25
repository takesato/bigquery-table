require 'thor'
require 'yaml'

module BigqueryTable
  class CLI < Thor
    include Thor::Actions

    def self.source_root
      File.dirname(__FILE__)
    end

    desc 'init [DEST]', 'initialize bigquery-table config'
    def init(dest = '.')
      copy_file 'templates/config.yml', "#{dest}/config.yml"
      empty_directory 'schema'
    end

    def update
    end
  end
end
