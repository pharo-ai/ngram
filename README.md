# Ngram

[![Build Status](https://travis-ci.org/olekscode/Ngram.svg?branch=master)](https://travis-ci.org/olekscode/Ngram)
[![Build status](https://ci.appveyor.com/api/projects/status/nxwn8odf3q2fafo2?svg=true)](https://ci.appveyor.com/project/olekscode/ngram)
[![Coverage Status](https://coveralls.io/repos/github/olekscode/Ngram/badge.svg?branch=master)](https://coveralls.io/github/olekscode/Ngram?branch=master)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/olekscode/Ngram/master/LICENSE)
[![Pharo version](https://img.shields.io/badge/Pharo-6.1-%23aac9ff.svg)](https://pharo.org/download)
[![Pharo version](https://img.shields.io/badge/Pharo-7.0-%23aac9ff.svg)](https://pharo.org/download)
[![Pharo version](https://img.shields.io/badge/Pharo-8.0-%23aac9ff.svg)](https://pharo.org/download)

`Ngram` package provides basic [n-gram](https://en.wikipedia.org/wiki/N-gram) functionality for Pharo. This includes `Ngram` class as well as `String` and `SequenceableCollection` extension that allow you to split text into unigrams, bigrams, trigrams, etc. Basically, this is just a simple utility for splitting texts into sequences of words.

## Installation
To install Ngram packages, go to the Playground (Ctrl+OW) in your Pharo image and execute the following Metacello script (select it and press Do-it button or Ctrl+D):
```Smalltalk
Metacello new
  baseline: 'Ngram';
  repository: 'github://olekscode/Ngram/src';
  load.
```

## What are n-grams?

[N-gram](https://en.wikipedia.org/wiki/N-gram) is a sequence of n elements, usually words. Number n is called the order of n-gram The concept of n-grams is widely used in [natural language processing (NLP)](https://en.wikipedia.org/wiki/Natural_language_processing). A text can be split into n-grams - sequences of n words. Consider the following text:
```
I do not like green eggs and ham
```
We can split it into **unigrams** (n-grams with n=1):
```
(I), (do), (not), (like), (green), (eggs), (and), (ham)
```
Or **bigrams** (n-grams with n=2):
```
(I do), (do not), (not like), (like green), (green eggs), (eggs and), (and ham)
```
Or **trigrams** (n-grams with n=3):
```
(I do not), (do not like), (not like green), (like green eggs), (green eggs and), (eggs and ham)
```
And so on (tetragrams, pentagrams, etc.).

### Applications

N-grams are widely applied in [language modeling](https://en.wikipedia.org/wiki/Language_model). For example, take a look at the implementation of [n-gram language model](https://github.com/olekscode/NgramModel) in Pharo.

### Structure of n-gram

Each n-gram can be separated into:

* **last word** - the last element in a sequence;
* **history** (context) - n-gram of order n-1 with all words except the last one.

Such separation is useful in probabilistic modeling when we want to estimate the probability of word given n-1 previous words (see [n-gram language model](https://github.com/olekscode/NgramModel)).

## Ngram class

This package provides only one class - `Ngram`. It models the n-gram.

### Instance creation

You can create n-gram from any `SequenceableCollection`:

```Smalltalk
trigram := Ngram withElements: #(do not like).
tetragram := #(green eggs and ham) asNgram.
```

Or by explicitly providing the history (n-gram of lower order) and last element:

```Smalltalk
hist := #(green eggs and) asNgram.
w := 'ham'.

ngram := Ngram withHistory: hist last: w.
```

You can also create a zerogram - n-gram of order 0. It is an empty sequence with no history and no last word:

```Smalltalk
Ngram zerogram.
```

### Accessing

You can access the order of n-gram, its history and last element:

```Smalltalk
tetragram. "n-gram(green eggs and ham)"
tetragram order. "4"
tetragram history. "n-gram(green eggs and)"
tetragram last. "ham"
```

## String extensions
