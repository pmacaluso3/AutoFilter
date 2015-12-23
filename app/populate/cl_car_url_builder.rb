class ClCarUrlBuilder
  def build_from_array(array)
    array.each do |url_data|
      ClCarUrl.find_or_create_by(text: url_data['text'], href: url_data['href'])
    end
  end
end