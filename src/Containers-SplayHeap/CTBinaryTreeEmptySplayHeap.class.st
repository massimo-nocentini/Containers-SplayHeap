Class {
	#name : #CTBinaryTreeEmptySplayHeap,
	#superclass : #CTBinaryTreeEmpty,
	#category : #'Containers-SplayHeap'
}

{ #category : #partitioning }
CTBinaryTreeEmptySplayHeap >> partition: pivot inSplayHeap: aHeap do: aBlock [
	^ aBlock
		  value: aHeap binaryTreeElementEmpty
		  value: aHeap binaryTreeElementEmpty
]
