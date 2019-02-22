require 'http'


p "Hello, please enter a word to lookup:"
word = gets.chomp


definition_response = HTTP.get("https://api.wordnik.com/v4/word.json/#{word}/definitions?limit=200&includeRelated=false&useCanonical=false&includeTags=false&api_key=")
 
p dictionary = definition_response.parse[0]["text"]


top_example_response = HTTP.get("https://api.wordnik.com/v4/word.json/#{word}/topExample?useCanonical=false&api_key=")

p top_example = top_example_response.parse["text"]

pronunctiation_response = HTTP.get("https://api.wordnik.com/v4/word.json/#{word}/pronunciations?useCanonical=false&limit=50&api_key=")

p pronunciation = pronunctiation_response.parse[0]["raw"]