Extension { #name : #SequenceableCollection }

{ #category : #'*Ngram' }
SequenceableCollection >> asNgram [
	^ Ngram withElements: self
]
