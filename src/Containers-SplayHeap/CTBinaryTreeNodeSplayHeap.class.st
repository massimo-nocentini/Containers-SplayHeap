Class {
	#name : #CTBinaryTreeNodeSplayHeap,
	#superclass : #CTBinaryTreeNode,
	#category : #'Containers-SplayHeap'
}

{ #category : #actions }
CTBinaryTreeNodeSplayHeap >> mergeBinaryTreeElement: aBTElement inBinaryTree: aBinaryTree [
	^ aBTElement
		  partition: value
		  inSplayHeap: aBinaryTree
		  do: [ :l :r | 
			  | lMerged rMerged |
			  lMerged := l
				             mergeBinaryTreeElement: previousLink
				             inBinaryTree: aBinaryTree.
			  rMerged := r
				             mergeBinaryTreeElement: nextLink
				             inBinaryTree: aBinaryTree.
			  aBinaryTree
				  leftBinaryTreeElement: lMerged
				  value: value
				  rightBinaryTreeElement: rMerged ]
]

{ #category : #partitioning }
CTBinaryTreeNodeSplayHeap >> partition: pivot inSplayHeap: aHeap do: aBlock [
	^ (aHeap is: value lessThan: pivot)
		  ifTrue: [ 
		  self partitionLessThan: pivot inSplayHeap: aHeap do: aBlock ]
		  ifFalse: [ 
			  self
				  partitionGreaterThanOrEqualTo: pivot
				  inSplayHeap: aHeap
				  do: aBlock ]
]

{ #category : #partitioning }
CTBinaryTreeNodeSplayHeap >> partitionGreaterThanOrEqualTo: pivot inSplayHeap: aHeap do: aBlock [
	^ previousLink
		  ifEmpty: [ aBlock value: aHeap binaryTreeElementEmpty value: self ]
		  ifNotEmpty: [ 
			  | y |
			  y := previousLink value.
			  (aHeap is: y lessThan: pivot)
				  ifTrue: [ 
					  previousLink nextLink
						  partition: pivot
						  inSplayHeap: aHeap
						  do: [ :s :b | 
							  | r l |
							  l := aHeap
								       leftBinaryTreeElement: previousLink previousLink
								       value: y
								       rightBinaryTreeElement: s.
							  r := aHeap
								       leftBinaryTreeElement: b
								       value: value
								       rightBinaryTreeElement: nextLink.
							  aBlock value: l value: r ] ]
				  ifFalse: [ 
					  previousLink previousLink
						  partition: pivot
						  inSplayHeap: aHeap
						  do: [ :s :b | 
							  | r rr |
							  rr := aHeap
								        leftBinaryTreeElement: previousLink nextLink
								        value: value
								        rightBinaryTreeElement: nextLink.
							  r := aHeap
								       leftBinaryTreeElement: b
								       value: y
								       rightBinaryTreeElement: rr.
							  aBlock value: s value: r ] ] ]
]

{ #category : #partitioning }
CTBinaryTreeNodeSplayHeap >> partitionLessThan: pivot inSplayHeap: aHeap do: aBlock [
	^ nextLink
		  ifEmpty: [ aBlock value: self value: aHeap binaryTreeElementEmpty ]
		  ifNotEmpty: [ 
			  | y |
			  y := nextLink value.
			  (aHeap is: y lessThan: pivot)
				  ifTrue: [ 
					  nextLink nextLink
						  partition: pivot
						  inSplayHeap: aHeap
						  do: [ :s :b | 
							  | ll l |
							  ll := aHeap
								        leftBinaryTreeElement: previousLink
								        value: value
								        rightBinaryTreeElement: nextLink previousLink.
							  l := aHeap
								       leftBinaryTreeElement: ll
								       value: y
								       rightBinaryTreeElement: s.
							  aBlock value: l value: b ] ]
				  ifFalse: [ 
					  nextLink previousLink
						  partition: pivot
						  inSplayHeap: aHeap
						  do: [ :s :b | 
							  | r l |
							  l := aHeap
								       leftBinaryTreeElement: previousLink
								       value: value
								       rightBinaryTreeElement: s.
							  r := aHeap
								       leftBinaryTreeElement: b
								       value: y
								       rightBinaryTreeElement: nextLink nextLink.
							  aBlock value: l value: r ] ] ]
]

{ #category : #removing }
CTBinaryTreeNodeSplayHeap >> popInBinaryTree: aBinaryTree [
	^ previousLink ifEmpty: [ nextLink ] ifNotEmpty: [ 
		  previousLink previousLink
			  ifEmpty: [ 
				  aBinaryTree
					  leftBinaryTreeElement: previousLink nextLink
					  value: value
					  rightBinaryTreeElement: nextLink ]
			  ifNotEmpty: [ :ppl | 
				  | r |
				  r := aBinaryTree
					       leftBinaryTreeElement: previousLink nextLink
					       value: value
					       rightBinaryTreeElement: nextLink.
				  aBinaryTree
					  leftBinaryTreeElement: ppl pop
					  value: previousLink value
					  rightBinaryTreeElement: r ] ]
]

{ #category : #evaluating }
CTBinaryTreeNodeSplayHeap >> root [
	^ previousLink ifEmpty: [ value ] ifNotEmpty: [ previousLink root ]
]
