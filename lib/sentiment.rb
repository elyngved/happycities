module Sentiment
  def self.client
    @@client ||= SentimentAnalysis::Client.new(:api_key => "t8JQg9d2uVdSIKhj33Ap")
  end

  def self.word_list
    @@word_list ||= begin
      sentihash = {}
      # load the word file
      file = File.new(Rails.root.join('lib', 'sentiwords.txt'))
      while (line = file.gets)
        parsedline = line.chomp.split("\t")
        sentiscore = parsedline[0]
        text = parsedline[1]
        sentihash[text] = sentiscore.to_f
      end
      file.close
      sentihash
    end
  end

  def self.score(text)
    text.split.map{|token| word_list[token] || 0}.inject(:+)
  end
end