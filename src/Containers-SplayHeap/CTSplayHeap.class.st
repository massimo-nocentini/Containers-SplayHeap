Class {
	#name : #CTSplayHeap,
	#superclass : #Object,
	#instVars : [
		'representation'
	],
	#category : #'Containers-SplayHeap'
}

{ #category : #requirements }
CTSplayHeap class >> empty [
	^ self basicNew
		  representation: CTBinaryTreeEmptySplay new;
		  initialize;
		  yourself
]

{ #category : #testing }
CTSplayHeap >> is: anObject lessThan: anotherObject [
	^ anObject < anotherObject
]

{ #category : #accessing }
CTSplayHeap >> pop [
	^ representation root ignoreBlock: [ 
		  representation := representation pop ]
]

{ #category : #adding }
CTSplayHeap >> push: anObject [
	representation := representation
		                  partition: anObject
		                  inSplayHeap: self
		                  do: [ :l :r | 
		                  CTBinaryTreeNodeSplay
			                  left: l
			                  value: anObject
			                  right: r ]
]

{ #category : #accessing }
CTSplayHeap >> representation [
	^ representation
]

{ #category : #accessing }
CTSplayHeap >> representation: anObject [
	^ representation := anObject
]

{ #category : #accessing }
CTSplayHeap >> root [
	^ representation root
]
