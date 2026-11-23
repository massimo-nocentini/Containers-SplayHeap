"
I am a heap kept as a binary tree, whose `root` answers the least object. To `push:` an object I partition my tree around it, and the two parts become the left and the right elements of a new node.

My elements are `CTBinaryTreeNodeSplayHeap` and `CTBinaryTreeEmptySplayHeap` objects. Any collection makes me with `asSplayHeap`.

```smalltalk
| heap |
heap := CTSplayHeap empty.
heap push: 5; push: 2; push: 9.
heap root ""2""
```
"
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
