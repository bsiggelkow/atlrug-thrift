$:.push('.')
$:.push('gen-rb')

require 'thrift'
require 'obfuscator'

class ObfuscatorClient < Secret::Obfuscator::Client
  def initialize(host='127.0.0.1', port=9090)
    @transport = Thrift::BufferedTransport.new(Thrift::Socket.new(host, port))
    protocol = Thrift::BinaryProtocol.new(@transport)
    super(protocol)
  end

  def open
    begin
      open_transport
      yield self
    ensure
      close_transport
    end
  end

  def open_transport
    @transport.open
  end

  def close_transport
    @transport.close
  end
end
