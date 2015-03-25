require 'bigquery-client'
require 'json'

module BigqueryTable
  class Utility
    def initialize(config, path)
      @bq = BigQuery::Client.new(config)
      @path = path
    end

    def update
      json_schemas.each do |table_name,json_schema|
        if bq_schemas.key?(table_name)
          bq_schema = bq_schemas[table_name]
          jnames = json_schema.map { |n| n['name'] }
          bqnames = bq_schema.map { |n| n['name'] }
          diff = jnames - bqnames
          unless diff.empty?
            update_table(table_name,json_schema)
          end
        else
          create_table(table_name,json_schema)
        end
      end
    end

    private

    def tables
      return @tables if defined? @tables
      result = @bq.list_tables
      return [] unless result.key? 'tables'
      @tables = result['tables'].map {|t| t['tableReference']['tableId']}
    end

    def describe_table(table_name)
      @bq.fetch_schema(table_name)
    end

    def create_table(tablename,json_data)
      @bq.create_table(tablename,json_data)
    end

    def update_table(tablename,json_data)
      request = { schema: { fields: json_data } }
      @bq.update_table(tablename,request)
    end

    def json_schemas
      return @json_schemas if defined? @json_schemas
      @json_schemas = {}
      Dir.glob(@path + "/*.json").each do |json_file|
        table_name = File.basename(json_file, '.json')
        json_data = JSON.load(File.read(json_file))
        @json_schemas[table_name] = json_data
      end
      @json_schemas
    end

    def bq_schemas
      return @bq_schemas if defined? @bq_schema
      @bq_schemas = {}
      tables.each do |table_name|
        @bq_schemas[table_name] = describe_table(table_name)
      end
      @bq_schemas
    end
  end
end
