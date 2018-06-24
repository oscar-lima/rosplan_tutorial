(define (problem minimum_required_facts)
	(:domain gpsr) ; General Purpose Service Robot (in a home environment)
	(:objects

		; locations
		 l--operator l--start - location

		; people
		 p--person - person

		; objects
		 obj--coke - object

		; sentences
		 s--how_many - sentence

)
	(:init
		; the robot at start is in the entrance of the house
		(at_r l--operator)
		; the robot gripper is empty at the start
		(gripper_empty)
	)
	(:goal )
)
