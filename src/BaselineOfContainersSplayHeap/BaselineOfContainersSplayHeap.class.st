"
I am the baseline of the splay heaps. I depend on `ContainersEssentials` and `ContainersBinaryTreeAbstract`, and load the packages `Containers-SplayHeap` and `Containers-SplayHeap-Tests`.
"
Class {
	#name : #BaselineOfContainersSplayHeap,
	#superclass : #BaselineOf,
	#category : #BaselineOfContainersSplayHeap
}

{ #category : #baselines }
BaselineOfContainersSplayHeap >> baseline: spec [

	<baseline>
	spec for: #common do: [ "Externals."
		spec
			baseline: 'ContainersEssentials'
			with: [ spec repository: 'github://massimo-nocentini/Containers-Essentials:master' ].

		spec
			baseline: 'ContainersBinaryTreeAbstract'
			with: [ spec repository: 'github://massimo-nocentini/Containers-BinaryTreeAbstract:master/src' ].

		"Packages"
		spec
			package: 'Containers-SplayHeap'
			with: [ spec requires: #( 'ContainersEssentials' 'ContainersBinaryTreeAbstract' ) ];
			package: 'Containers-SplayHeap-Tests'
			with: [ spec requires: #( 'Containers-SplayHeap' ) ] ]
]
