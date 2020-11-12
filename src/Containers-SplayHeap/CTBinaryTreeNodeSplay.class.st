Class {
	#name : #CTBinaryTreeNodeSplay,
	#superclass : #CTBinaryTreeNode,
	#category : #'Containers-SplayHeap'
}

{ #category : #actions }
CTBinaryTreeNodeSplay >> mergeBinaryTree: aTree [
	^ aTree partition: value inSplayHeap: nil do: [ :l :r | 
		  self class
			  left: (l mergeBinaryTree: previousLink)
			  value: value
			  right: (r mergeBinaryTree: nextLink) ]
]

{ #category : #'as yet unclassified' }
CTBinaryTreeNodeSplay >> partition: pivot inSplayHeap: aHeap do: aBlock [
	^ (aHeap is: value lessThan: pivot)
		  ifTrue: [ 
		  self partitionLessThan: pivot inSplayHeap: aHeap do: aBlock ]
		  ifFalse: [ 
			  self
				  partitionGreaterThanOrEqualTo: pivot
				  inSplayHeap: aHeap
				  do: aBlock ]
]

{ #category : #'as yet unclassified' }
CTBinaryTreeNodeSplay >> partitionGreaterThanOrEqualTo: pivot inSplayHeap: aHeap do: aBlock [
	^ previousLink
		  ifEmpty: [ aBlock value: CTBinaryTreeEmptySplay new value: self ]
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
							  l := self class
								       left: previousLink previousLink
								       value: y
								       right: s.
							  r := self class left: b value: value right: nextLink.
							  aBlock value: l value: r ] ]
				  ifFalse: [ 
					  previousLink previousLink
						  partition: pivot
						  inSplayHeap: aHeap
						  do: [ :s :b | 
							  | r rr |
							  rr := self class
								        left: previousLink nextLink
								        value: value
								        right: nextLink.
							  r := self class left: b value: y right: rr.
							  aBlock value: s value: r ] ] ]
]

{ #category : #'as yet unclassified' }
CTBinaryTreeNodeSplay >> partitionLessThan: pivot inSplayHeap: aHeap do: aBlock [
	^ nextLink
		  ifEmpty: [ aBlock value: self value: CTBinaryTreeEmptySplay new ]
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
							  ll := self class
								        left: previousLink
								        value: value
								        right: nextLink previousLink.
							  l := self class left: ll value: y right: s.
							  aBlock value: l value: b ] ]
				  ifFalse: [ 
					  nextLink previousLink
						  partition: pivot
						  inSplayHeap: aHeap
						  do: [ :s :b | 
							  | r l |
							  l := self class left: previousLink value: value right: s.
							  r := self class left: b value: y right: nextLink nextLink.
							  aBlock value: l value: r ] ] ]
]

{ #category : #removing }
CTBinaryTreeNodeSplay >> pop [
	previousLink ifEmpty: [ nextLink ] ifNotEmpty: [ 
		previousLink previousLink
			ifEmpty: [ 
			self class left: previousLink nextLink value: value right: nextLink ]
			ifNotEmpty: [ :ppl | 
				| r |
				r := self class
					     left: previousLink nextLink
					     value: value
					     right: nextLink.
				self class left: ppl pop value: previousLink value right: r ] ]
]

{ #category : #evaluating }
CTBinaryTreeNodeSplay >> root [
	^ previousLink ifEmpty: [ value ] ifNotEmpty: [ previousLink root ]
]
