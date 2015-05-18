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
    $ #{$0} arn csv_path

    example:
    $ #{$0} arn:aws:sns:ap-northeast-1:000000000:app/APNS/hogehoge hoge_tokens.csv

    result > tokens_good.csv, tokens_bad.csv
    these csv's will be cleared when starting this script.

    input csv file should include below columns:
    - "device_token" or "gcm_registration_id" as tokens.
    - "alias" as user data of the endpoint.
  EOS
  exit
end

arn = ARGV.shift
csv_path = ARGV.shift
tmp_csv_path = "tmp/tokens.csv"
result_good_path = "tokens_good.csv"
result_bad_path = "tokens_bad.csv"

FileUtils.rm tmp_csv_path if File.exist? tmp_csv_path

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

FileUtils.rm result_good_path if File.exist? result_good_path
FileUtils.rm result_bad_path if File.exist? result_bad_path

system 'mvn', 'clean', 'compile', 'exec:java'

