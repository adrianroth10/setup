#!/usr/bin/env ruby

require 'premailer'

premailer = Premailer.new(ARGV[0], :warn_level => Premailer::Warnings::SAFE)

# Write the HTML output
File.open(ARGV[1], "w") do |fout|
  fout.puts premailer.to_inline_css
end
