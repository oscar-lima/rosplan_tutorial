(define (domain gpsr)

  (:requirements :typing :negative-preconditions)

  (:types
    location  ; service areas, points of interest, navigation goals
    object    ; objects to be manipulated by the robot
    person    ; a human being who needs to be conquered
    sentence  ; a sentence to express world domination joy
  )

  (:predicates
    ; the robot is at location ?l
    (at_r ?l - location)

    ; person ?p is at location ?l
    (at_p ?p - person ?l - location)

    ; object ?obj is on location ?l
    (on ?obj - object ?l - location)

    ; the robot is holding object ?obj
    (holding ?obj - object)

    ; the gripper of the robot is free (does not contain any object)
    (gripper_empty)

    ; perception face recognition to find any person
    (found_p ?p - person)

    ; perception object recognition to find any object
    (found_obj ?obj - object)

    ; the robot told to person ?p, at the location ?l, the sentence ?s that it was asked to tell
    (told ?s - sentence ?p - person ?l - location ?obj - object)

    ; the robot is following the person ?p
    (following ?p - person)

    ; the robot answered a question to person ?p at the location ?l
    (answered_question ?p - person ?l - location)
  )

  ; navigation action
  ; i.e. move to the hallway table
  (:action move_base
    :parameters (?source ?destination - location)
    :precondition  (at_r ?source)
    :effect   (and (at_r ?destination) (not (at_r ?source)))
  )

  ; manipulation action
  ; i.e. grasp the energy drink
  (:action grasp
    :parameters (?obj - object ?l - location)
    :precondition (and (at_r ?l) (on ?obj ?l) (found_obj ?obj) (gripper_empty))
    :effect (and (holding ?obj) (not (on ?obj ?l)) (not (gripper_empty)) (not (found_obj ?obj)))
  )

  ; manipulation action
  ; having an object already in the gripper place it on a surface in front of the robot
  ; i.e. place the pringles on the table
  (:action place
    :parameters (?obj - object ?l - location)
    :precondition (and (at_r ?l) (holding ?obj) (not (gripper_empty)))
    :effect (and (not (holding ?obj)) (on ?obj ?l) (gripper_empty))
  )

  ; perception action
  ; i.e. find a coke in the kitchen
  (:action find_object
    :parameters (?obj - object ?l - location)
    :precondition (and (at_r ?l) (on ?obj ?l))
    :effect (and (found_obj ?obj))
  )

  ; perception action
  ; i.e. find John in the kitchen
  (:action find_person
    :parameters (?p - person ?l - location)
    :precondition (and (at_r ?l) (at_p ?p ?l))
    :effect (and (found_p ?p))
  )

  ; HRI - Navigation action
  ; i.e. find a person and guide it to the exit
  (:action guide
    :parameters (?p - person ?source ?destination - location)
    :precondition (and (at_p ?p ?source) (at_r ?source) (found_p ?p))
    :effect (and (at_p ?p ?destination) (at_r ?destination)
                 (not (at_p ?p ?source)) (not (at_r ?source)))
  )

  ; HRI action
  ; i.e. ask his name; tell John to wait a moment / tell a joke to Jackie at the dining table
  (:action tell
    :parameters (?s - sentence ?p - person ?l - location ?obj - object)
    :precondition (at_r ?l)
    :effect (and (told ?s ?p ?l ?obj))
  )

  ; HRI action
  ; i.e. follow a person
  (:action follow
    :parameters (?p - person ?l - location)
    :precondition (and (at_p ?p ?l) (at_r ?l) (found_p ?p))
    :effect (and (following ?p))
  )

  ; HRI action
  ; i.e. answer a question to John at the kitchen
  (:action answer
    :parameters (?p - person ?l - location)
    :precondition (and (at_r ?l) (found_p ?p))
    :effect (and (answered_question ?p ?l))
  )
)
