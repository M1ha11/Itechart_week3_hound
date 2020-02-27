class HistogramGenerator
  def initialize; end

  def self.process_string(string:)
    if !string.empty?
      string.gsub(/[ ,.\r\n]/, ' ').split(' ').each_with_object(Hash.new(0)) { |word, result| result[word] += 1 }
    else
      {}
    end
  end

  def self.sort_histogram(histogram)
    sort = ->(_, occurencies) { occurencies }
    histogram.sort_by { |word, occurencies| sort.call(word, occurencies) }.to_h
  end
end

module App
  TEXT = 'When Mr. and Mrs. Dursley woke up on the dull, gray Tuesday our story
starts, there was nothing about the cloudy sky outside to suggest that
strange and mysterious things would soon be happening all over the
country. Mr. Dursley hummed as he picked out his most boring tie for
work, and Mrs. Dursley gossiped away happily as she wrestled a screaming
Dudley into his high chair.'.freeze
  def perform
    text = ''
    puts('reading file')
    puts("extracted string: #{text}")
    histogram = Histogram_Generator.processString({ string: TEXT })
    puts('generated histogram:')
    puts(histogram)
    puts('sorted histogram:')
    puts(Histogram_Generator.sort_histogram(histogram))
  end

  def number_to_word(number)
    hash = { '1': 'one', '2': 'two', '3': 'three', '4': 'four', '5': 'five', '6': 'six', '7': 'seven',
             '8': 'eigth', '9': 'nine' }
    hash.each do |key, value|
      if number == hash[key]
        value
      else
        'oops'
      end
    end
  end
end

puts App.perform
[1, 2, 3, 4, 5, 6, 7, 8, 9, 13_666].each do |number|
  puts App.number_to_word(number)
end
