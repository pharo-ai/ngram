# Ngram

[![Build Status](https://travis-ci.org/olekscode/Ngram.svg?branch=master)](https://travis-ci.org/olekscode/Ngram)
[![Build status](https://ci.appveyor.com/api/projects/status/nxwn8odf3q2fafo2?svg=true)](https://ci.appveyor.com/project/olekscode/ngram)
[![Coverage Status](https://coveralls.io/repos/github/olekscode/Ngram/badge.svg?branch=master)](https://coveralls.io/github/olekscode/Ngram?branch=master)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/olekscode/Ngram/master/LICENSE)
[![Pharo version](https://img.shields.io/badge/Pharo-6.1-%23aac9ff.svg)](https://pharo.org/download)
[![Pharo version](https://img.shields.io/badge/Pharo-7.0-%23aac9ff.svg)](https://pharo.org/download)
[![Pharo version](https://img.shields.io/badge/Pharo-8.0-%23aac9ff.svg)](https://pharo.org/download)

`Ngram` package provides basic [n-gram](https://en.wikipedia.org/wiki/N-gram) functionality for Pharo. This includes `Ngram` class as well as `String` and `SequenceableCollection` extension that allow you to split text into unigrams, bigrams, trigrams, etc.

## Installation
To install Ngram packages, go to the Playground (Ctrl+OW) in your Pharo image and execute the following Metacello script (select it and press Do-it button or Ctrl+D):
```Smalltalk
Metacello new
  baseline: 'Ngram';
  repository: 'github://olekscode/Ngram/src';
  load.
```

## What are n-grams?

[N-gram](https://en.wikipedia.org/wiki/N-gram) is a sequence of `n` elements, usually words. The concept of n-grams is widely used in [natural language processing (NLP)](https://en.wikipedia.org/wiki/Natural_language_processing). A text can be split into n-grams - sequences of `n` words. Consider the following text:
```
I do not like green eggs and ham
```
We can split it into unigrams (n-grams with `n=1`):
```
(I), (do), (not), (like), (green), (eggs), (and), (ham)
```
Or bigrams (n-grams with `n=2`):
```
(I do), (do not), (not like), (like green), (green eggs), (eggs and), (and ham)
```
Or trigrams (n-grams with `n=3`):
```
(I do not), (do not like), (not like green), (like green eggs), (green eggs and), (eggs and ham)
```
And so on.
