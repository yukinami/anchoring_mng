require 'spreadsheet'
require_relative 'ymlresolver'

module AnchoringResolver
  class ExcelResolver

    def initialize(yml_resolver)
      @yml_resolver = yml_resolver	      
    end

    def resolve(file, entity_name, field_name)
      book = Spreadsheet.open file
      sheet = book.worksheet(0)

      position = @yml_resolver.resolve(entity: entity_name, field: field_name)
      row = sheet.row(position[:row]-1)
      col = position[:col]

      get_content(row, col)	
    end

    def get_content(row, col)
      col = col.to_s
      if /\d\.\.\d/ =~ col 
	ends = col.split('..').map{|d| Integer(d)}
	contents = Array.new
	(ends[0]..ends[1]).each do |c|
	  contents << row[c-1].to_s.strip
	end

	contents.join
      else
	row[col.to_i-1]
      end

    end
  end
end

=begin
r = Anchoring::ExcelResolver.new(Anchoring::YmlResolver.new(Rails.root + 'app/resolver/resolver.yml'))
f = File.new(Rails.root + 'app/resolver/船舶锚泊动态报告单_Sample.xls')
puts r.resolve(f, 'anchoring', 'report_org')
puts r.resolve(f, 'anchoring', 'category')
puts r.resolve(f, 'anchoring', 'ship_name')
puts r.resolve(f, 'anchoring', 'ship_name_en')
puts r.resolve(f, 'anchoring', 'country')
puts r.resolve(f, 'anchoring', 'ship_type')
puts r.resolve(f, 'anchoring', 'ship_length')
puts r.resolve(f, 'anchoring', 'cargo')
puts r.resolve(f, 'anchoring', 'amount')
puts r.resolve(f, 'anchoring', 'gt')
puts r.resolve(f, 'anchoring', 'nt')
puts r.resolve(f, 'anchoring', 'max_draft')
puts r.resolve(f, 'anchoring', 'power')
puts r.resolve(f, 'anchoring', 'anchor_reason')
puts r.resolve(f, 'anchoring', 'anchor_date')
puts r.resolve(f, 'anchoring', 'sail_date')
puts r.resolve(f, 'anchoring', 'pier')
puts r.resolve(f, 'anchoring', 'ship_contact')
puts r.resolve(f, 'anchoring', 'contacter')
puts r.resolve(f, 'anchoring', 'cellphone')
puts r.resolve(f, 'anchoring', 'fax')
=end
