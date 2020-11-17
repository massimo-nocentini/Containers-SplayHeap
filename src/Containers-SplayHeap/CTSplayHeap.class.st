Class {
	#name : #CTSplayHeap,
	#superclass : #CTBinaryTreeAbstract,
	#category : #'Containers-SplayHeap'
}

{ #category : #creating }
CTSplayHeap >> binaryTreeElementEmpty [
	^ CTBinaryTreeEmptySplay new
]

{ #category : #testing }
CTSplayHeap >> is: anObject lessThan: anotherObject [
	^ anObject < anotherObject
]

{ #category : #creating }
CTSplayHeap >> leftBinaryTreeElement: l value: v rightBinaryTreeElement: r [
	^ CTBinaryTreeNodeSplay new
		  previousLink: l;
		  value: v;
		  nextLink: r;
		  yourself
]

{ #category : #accessing }
CTSplayHeap >> pop [
	^ self root ignoreBlock: [ 
		  representation := representation popInSplayHeap: self ]
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
