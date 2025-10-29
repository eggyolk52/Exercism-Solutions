import re

def count_words(sentence):
    words = re.split(r'[ ,.;:!?_&@$%^]|\n|\t', sentence.lower())
    word_counts = {}

    for word in words:
        word = word.strip("'")

        if word in ['', '"', "'"]:
            continue

        if word in word_counts:
            word_counts[word] = word_counts[word] + 1
        else:
            word_counts[word] = 1

    return word_counts
