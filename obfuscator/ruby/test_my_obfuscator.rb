sample = <<-text
  Four score and seven years ago our fathers brought forth on this 
  continent a new nation, conceived in liberty and dedicated to the 
  proposition that all men are created equal. Now we are engaged in 
  a great civil war, testing whether that nation or any nation so 
  conceived and so dedicated can long endure. We are met on a great 
  battlefield of that war. We have come to dedicate a portion of 
  that field as a final resting-place for those who here gave their 
  lives that that nation might live. It is altogether fitting and 
  proper that we should do this. But in a larger sense, we cannot 
  dedicate, we cannot consecrate, we cannot hallow this ground. 
  The brave men, living and dead who struggled here have consecrated 
  it far above our poor power to add or detract. The world will 
  little note nor long remember what we say here, but it can never 
  forget what they did here. It is for us the living rather to be 
  dedicated here to the unfinished work which they who fought here 
  have thus far so nobly advanced. It is rather for us to be here 
  dedicated to the great task remaining before us--that from these 
  honored dead we take increased devotion to that cause for which 
  they gave the last full measure of devotion--that we here highly 
  resolve that these dead shall not have died in vain, that this 
  nation under God shall have a new birth of freedom, and that 
  government of the people, by the people, for the people shall 
  not perish from the earth.
text

$:.push('.')

require 'benchmark'
require 'my_obfuscator'

count = 100

puts "\n\n===== MyObfuscator test ====="
t1 = Benchmark.realtime do
  count.times do 
    MyObfuscator.translate_sentence sample
  end
end

printf "\nResponse time => %0.2f milliseconds per request", (t1/count)*1000
printf "\n   Throughput => %d requests per second\n", count/t1 

require 'obfuscator_client'

client = ObfuscatorClient.new
client.open_transport

puts "\n\n===== Obfuscator Service test ====="
t2 = Benchmark.realtime do
  count.times do 
    client.obfuscate sample
  end
end

printf "\nResponse time => %0.2f milliseconds per request", (t2/count)*1000
printf "\n   Throughput => %d requests per second\n", count/t2 

printf "\nService performance cost => %0.2f percent\n", ((t2 - t1)/t1.to_f)*100

client.close_transport
