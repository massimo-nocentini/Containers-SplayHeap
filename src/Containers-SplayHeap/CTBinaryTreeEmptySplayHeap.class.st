"
I am the empty element of a `CTSplayHeap`, and any pivot partitions me into two empty elements.
"
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
