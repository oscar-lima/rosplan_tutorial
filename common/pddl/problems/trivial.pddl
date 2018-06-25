(define (problem minimum_required_facts)
	(:domain gpsr) ; General Purpose Service Robot (in a home environment)
	(:objects

		; locations
		 kitchen bedroom living_room dinning_room bathroom - location

		; people
		 oscar rodrigo - person

		; objects
		 coke beer remote - object

		; sentences
		 enjoy_tutorial - sentence

)
	(:init
		; the robot at start is in the entrance of the house

		; fact missing here !!!

		(on coke kitchen)
		(on beer kitchen)
		(on remote living_room)
		; the robot gripper is empty at the start
		(gripper_empty)
	)
	(:goal (holding beer))
)
