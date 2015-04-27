class MyObfuscator
  class << self

    def translate_sentence str
      str.gsub(/\w+/) do |word| 
        translate_word word
      end
    end

    def translate_word str
      lowercase = ('a'..'z').to_a
      uppercase = ('A'..'Z').to_a
      alpha = lowercase + uppercase
      vowels = %w[a e i o u A E I O U]
      consonants = alpha - vowels

      capitalized = uppercase.include?(str[0])

      result = if vowels.include?(str[0])
        str + 'ay'
      elsif consonants.include?(str[0]) && consonants.include?(str[1])
        str[2..-1] + str[0..1] + 'ay'
      elsif consonants.include?(str[0])
        str[1..-1] + str[0] + 'ay'
      else
        str # return unchanged
      end
      capitalized ? result.capitalize : result 
    end

  end
end
