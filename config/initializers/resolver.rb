require File.expand_path(Rails.root + 'app/resolver/excelresolver')

ANCHORING_RESOLVER = AnchoringResolver::ExcelResolver.new(AnchoringResolver::YmlResolver.new(Rails.root + 'app/resolver/resolver.yml'))
