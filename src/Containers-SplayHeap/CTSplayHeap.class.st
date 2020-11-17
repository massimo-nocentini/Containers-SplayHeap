Class {
	#name : #CTSplayHeap,
	#superclass : #CTBinaryTreeAbstract,
	#category : #'Containers-SplayHeap'
}

{ #category : #creating }
CTSplayHeap >> binaryTreeElementEmpty [
	^ CTBinaryTreeEmptySplayHeap new
]

{ #category : #creating }
CTSplayHeap >> binaryTreeElementNode [
	^ CTBinaryTreeNodeSplayHeap new
]

{ #category : #adding }
CTSplayHeap >> push: anObject [
	representation := representation
		                  partition: anObject
		                  inSplayHeap: self
		                  do: [ :l :r | 
			                  self
				                  leftBinaryTreeElement: l
				                  value: anObject
				                  rightBinaryTreeElement: r ]
]
