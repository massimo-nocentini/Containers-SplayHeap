Class {
	#name : #CTBinaryTreeEmptySplay,
	#superclass : #CTBinaryTreeEmpty,
	#category : #'Containers-SplayHeap'
}

{ #category : #partitioning }
CTBinaryTreeEmptySplay >> partition: pivot inSplayHeap: aHeap do: aBlock [
	^ aBlock
		  value: aHeap binaryTreeElementEmpty
		  value: aHeap binaryTreeElementEmpty
]

{ #category : #removing }
CTBinaryTreeEmptySplay >> popInSplayHeap: anHeap [
	CollectionIsEmpty signal
]
