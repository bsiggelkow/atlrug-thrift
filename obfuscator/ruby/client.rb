$:.push('gen-rb')

require 'thrift'
require 'obfuscator'

begin

  port = ARGV[0] || 9090

  transport = Thrift::BufferedTransport.new(Thrift::Socket.new('127.0.0.1', port))
  protocol = Thrift::BinaryProtocol.new(transport)
  client = Secret::Obfuscator::Client.new(protocol)

  transport.open

  client.ping
  puts "Ping success!"

  result = client.obfuscate 'Your mother was a hamster, and your father smelt of elderberries'
  puts result

  transport.close

rescue Thrift::Exception => tx

  puts "Thrift::Exception: #{tx.message}"

end
