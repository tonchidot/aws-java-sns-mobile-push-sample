#!/usr/bin/env ruby
#
# upload device tokens with csv
# 
require 'csv'
require 'fileutils'

FileUtils::mkdir_p 'tmp'
unless ARGV.count == 2
  STDERR.puts <<-EOS
    usage:
    $ ruby (this script) arn csv_path

    example:
    $ ruby (this script) arn:aws:sns:ap-northeast-1:000000000:app/APNS/hogehoge tokens.csv

    input csv file should include "device_tokens" or "gcm_registration_id" column as tokens.
    input csv file should include "alias" column as endpoint name.
  EOS
  exit
end

arn = ARGV.shift
csv_path = ARGV.shift
tmp_csv_path = "tmp/tokens.csv"

CSV.open(tmp_csv_path, "wb") do |out_csv|
  CSV.table(csv_path).each do |row|
    token = row[:device_token] || row[:gcm_registration_id]
    name = row[:alias]
    out_csv << [token,name]
  end
end

prop_path = "BulkUpload.properties"
File.open(prop_path, "w") do |f|
  f.write <<-EOS
applicationarn:#{arn}
csvfilename:tmp/tokens.csv
goodfilename:tokens_good.csv
badfilename:tokens_bad.csv
delimiterchar:,
quotechar:"
numofthreads:10
  EOS
end

system 'mvn', 'clean', 'compile', 'exec:java'

