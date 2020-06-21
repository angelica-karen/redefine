tokenizer = nltk.data.load('tokenizers/punkt/english.pickle')
parag = "I love Jesus1. I love Jesus2. I love Jesus3. You are awesome."
tokenizer.tokenize(parag)
arrayT = tokenizer.tokenize(parag)
tokenoutput = arrayT[2]

print (tokenoutput)