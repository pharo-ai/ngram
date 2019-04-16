Class {
	#name : #BaselineOfNgram,
	#superclass : #BaselineOf,
	#category : #BaselineOfNgram
}

{ #category : #baselines }
BaselineOfNgram >> baseline: spec [
	<baseline>
	spec for: #common do: [			
		"Packages"
		spec 
			package: 'Ngram';
			package: 'Ngram-Tests' with: [ spec requires: #('Ngram') ] ].
		
	spec for: #'pharo6.x' do: [
		spec package: 'Ngram-Pharo6' ]
]
