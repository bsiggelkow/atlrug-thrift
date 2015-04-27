$:.push('.')
$:.push('gen-rb')

#$:.unshift '../../lib/rb/lib'

require 'thrift'

require 'obfuscator'
require 'my_obfuscator'

class ObfuscatorHandler
  def initialize
    @log = {}
  end

  def ping
    puts "Pinged"
  end

  def obfuscate(str)
    MyObfuscator.translate_sentence(str)
  end
end

handler = ObfuscatorHandler.new
processor = Secret::Obfuscator::Processor.new(handler)
transport = Thrift::ServerSocket.new(9090)
transportFactory = Thrift::BufferedTransportFactory.new()
server = Thrift::SimpleServer.new(processor, transport, transportFactory)

puts "Starting the server..."
server.serve
puts "done."
