class StringMatcher
  def match(args)
    test_string = args[:test_string]
    possibilities = args[:possibilities]
    match_scores = {}
    possibilities.each do |poss|
      short = test_string.length <= poss.length ? test_string : poss
      long = test_string.length <= poss.length ? poss : test_string
      short_pairs = pairs_for(short)
      long_pairs = pairs_for(long)
      this_score = 0
      short_pairs.each do |pair|
        this_score += 1 if long_pairs.include?(pair)
      end
      match_scores[poss] = this_score / long_pairs.length.to_f
    end

    high_score = 0
    winner = nil
    match_scores.each do |k, v|
      if v > high_score
        high_score = v
        winner = k
      end
    end
    {match: winner, score: high_score}
  end

  def match_from_test_array_against_reference_array(args)
    test_array, reference_array = args[:test_array], args[:reference_array]

    matches = {}
    test_array.map(&:downcase).each do |possible_make_from_test_array|
      matches[possible_make_from_test_array] = match(test_string: possible_make_from_test_array, possibilities: reference_array)  
    end

    chosen_match = ""
    high_score = 0

    matches.each do |piece_of_test_array, match_and_score|
      if match_and_score[:score] > high_score
        chosen_match = match_and_score[:match]
        high_score = match_and_score[:score]
      end
    end

    chosen_match
  end

  def pairs_for(input_string)
    input_string.split("")[0..-2].each_with_index.map do |letter, index|
      letter + input_string[index + 1]
    end
  end
end
