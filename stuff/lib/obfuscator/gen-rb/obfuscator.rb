#
# Autogenerated by Thrift Compiler (0.9.2)
#
# DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
#

require 'thrift'
require 'obfuscator_types'

module Secret
  module Obfuscator
    class Client
      include ::Thrift::Client

      def ping()
        send_ping()
        recv_ping()
      end

      def send_ping()
        send_message('ping', Ping_args)
      end

      def recv_ping()
        result = receive_message(Ping_result)
        return
      end

      def obfuscate(sentence)
        send_obfuscate(sentence)
        return recv_obfuscate()
      end

      def send_obfuscate(sentence)
        send_message('obfuscate', Obfuscate_args, :sentence => sentence)
      end

      def recv_obfuscate()
        result = receive_message(Obfuscate_result)
        return result.success unless result.success.nil?
        raise ::Thrift::ApplicationException.new(::Thrift::ApplicationException::MISSING_RESULT, 'obfuscate failed: unknown result')
      end

    end

    class Processor
      include ::Thrift::Processor

      def process_ping(seqid, iprot, oprot)
        args = read_args(iprot, Ping_args)
        result = Ping_result.new()
        @handler.ping()
        write_result(result, oprot, 'ping', seqid)
      end

      def process_obfuscate(seqid, iprot, oprot)
        args = read_args(iprot, Obfuscate_args)
        result = Obfuscate_result.new()
        result.success = @handler.obfuscate(args.sentence)
        write_result(result, oprot, 'obfuscate', seqid)
      end

    end

    # HELPER FUNCTIONS AND STRUCTURES

    class Ping_args
      include ::Thrift::Struct, ::Thrift::Struct_Union

      FIELDS = {

      }

      def struct_fields; FIELDS; end

      def validate
      end

      ::Thrift::Struct.generate_accessors self
    end

    class Ping_result
      include ::Thrift::Struct, ::Thrift::Struct_Union

      FIELDS = {

      }

      def struct_fields; FIELDS; end

      def validate
      end

      ::Thrift::Struct.generate_accessors self
    end

    class Obfuscate_args
      include ::Thrift::Struct, ::Thrift::Struct_Union
      SENTENCE = 1

      FIELDS = {
        SENTENCE => {:type => ::Thrift::Types::STRING, :name => 'sentence'}
      }

      def struct_fields; FIELDS; end

      def validate
      end

      ::Thrift::Struct.generate_accessors self
    end

    class Obfuscate_result
      include ::Thrift::Struct, ::Thrift::Struct_Union
      SUCCESS = 0

      FIELDS = {
        SUCCESS => {:type => ::Thrift::Types::STRING, :name => 'success'}
      }

      def struct_fields; FIELDS; end

      def validate
      end

      ::Thrift::Struct.generate_accessors self
    end

  end

end
