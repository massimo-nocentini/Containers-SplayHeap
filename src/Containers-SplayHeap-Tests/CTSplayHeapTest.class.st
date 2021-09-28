"
A CTSplayHeapTest is a test class for testing the behavior of CTSplayHeap
"
Class {
	#name : #CTSplayHeapTest,
	#superclass : #CTBinaryTreeAbstractTest,
	#category : #'Containers-SplayHeap-Tests'
}

{ #category : #tests }
CTSplayHeapTest >> tree: aCollection [

	^ aCollection asSplayHeap
]
