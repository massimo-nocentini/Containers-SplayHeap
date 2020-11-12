Class {
	#name : #CTBinaryTreeEmptySplay,
	#superclass : #CTBinaryTreeEmpty,
	#category : #'Containers-SplayHeap'
}

{ #category : #'as yet unclassified' }
CTBinaryTreeEmptySplay >> partition: pivot inSplayHeap: aHeap do: aBlock [
	^ aBlock value: self class new value: self class new
]

{ #category : #removing }
CTBinaryTreeEmptySplay >> pop [
	CollectionIsEmpty signal
]
