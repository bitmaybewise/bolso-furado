require 'optparse'
require './lib/version'

class CliOptions
  def self.parse!
    options = {}
    OptionParser.new do |opts|
      opts.banner = 'Usage options:'
      opts.on('-k', '--key CONSUMER-KEY', 'Consumer key') { |key| options[:key] = key }
      opts.on('-t', '--token CONSUMER-TOKEN', 'Consumer token') { |token| options[:token] = token }
      opts.on('-d', '--days 30', Integer, 'How many days (default to 30)') { |days| options[:days] = days }
      opts.on('-v', '--version', "Current version") { puts VERSION }
    end.parse!
    errors = check_required_params(options)
    errors.each { |msg| puts msg }
    yield(options) if errors.empty?
  end

  private

    def self.check_required_params(opts)
      errors = []
      errors << "Consumer key required!" if opts[:key].nil? || opts[:key].empty?
      errors << "Consumer token required!" if opts[:token].nil? || opts[:token].empty?
      errors
    end
end
