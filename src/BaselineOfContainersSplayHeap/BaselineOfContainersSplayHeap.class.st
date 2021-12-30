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
			with: [ 
			spec repository: 'github://massimo-nocentini/Containers-Essentials' ].

		"Packages"
		spec
			package: 'Containers-SplayHeap';
			package: 'Containers-SplayHeap-Tests' ]
]
