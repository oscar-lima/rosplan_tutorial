(define (problem example_problem)

  (:domain gpsr) ; General Purpose Service Robot (in a home environment)

  (:objects
    pedro person - person
  	entrance bedroom kitchen exit - location ; room locations
    dinner_table side_table - location       ; manipulation locations
  	crackers coke package - object           ; the world has this many objects
  )

  (:init

    ; cost is 0 at the beginning
  	(= (total-cost) 0)

    ; the robot at start is in the entrance of the house
  	(at_r entrance)

    ; the robot gripper is empty
    (gripper_empty)

    ; a person is at the kitchen
    (at_p person kitchen)

    ; pedro is located at the entrance
    (at_p pedro entrance)

    ; pedro is puzzled because he has a question
    (puzzled pedro)

    ; the crackers are located at the dinner table
  	(on crackers dinner_table)

  )

  (:goal
  	(and

      ; the crackers need to be put on the side table
  		(on crackers side_table)

      ; the gripper of the robot needs to be empty at the end
	  	;(gripper_empty)

      ; robot needs to be at the entrance at the end
		  (at_r entrance)

      ; robot needs to introduce itself to pedro
      ;(known_p pedro)

      ; robot needs to tell to pedro what was asked
      ;(told pedro kitchen)

      ; pedro needs to be guided to the exit
      ;(at_p pedro exit)

      ; a person needs to be guided to the exit
      ;(at_p person exit)

      ; robot needs to find a person
      ;(found_p person)

      ; pedro is puzzled and needs his question to be answered
      ;(iluminated pedro)

      ; robot needs to follow pedro
      ; (following pedro)
	  )
  )

  ; the goal for the planner is to minimize the total cost
  (:metric minimize (total-cost))
)