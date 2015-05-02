class Todo < ActiveRecord::Base
  before_save do
    if name_changed? || description_changed?
      client = ObfuscatorClient.new
      begin
        client.open do |obfuscator|
          self.name = obfuscator.obfuscate(name) if name_changed?
          self.description = obfuscator.obfuscate(description) if description_changed?
        end
      rescue Thrift::TransportException
        logger.error("Unable to contact obfuscator")
      end
    end
  end
end
