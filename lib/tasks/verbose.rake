desc 'Write logging to stdout'
task verbose: :environment do
  Rails.logger = Logger.new(STDOUT)
end

desc 'Set log level to debug and write logging to stdout'
task debug: [:environment, :verbose] do
  Rails.logger.level = Logger::DEBUG
end