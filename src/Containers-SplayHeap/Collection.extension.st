Extension { #name : #Collection }

{ #category : #'*Containers-SplayHeap' }
Collection >> asSplayHeap [
	^ self asBinaryTree: CTSplayHeap
]
