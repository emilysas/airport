
##Airport
_____________________

This was my personal weekend challenge for Week 1 of Makers Academy. The task was to create an air traffic control system; whereby a planes would take off and land at an airport. Occassionally the airport would experience stormy weather, and this should prevent any planes from taking off or landing. The learning objectives where to become more comfortable with the idea of composition, inheritance and TDD (and specifically mocks and stubs).

##Tools Used
* Ruby
* Rspec

##Lessons Learned
This personal challenge allowed me to consolidate what I'd learned during the week about object oriented design, encapsulation, inheritence, testing, and mocking.


## Domain Model / CRC

Imagine you're writing software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.



Collaborations
--------------

Airport                 | Collaborators
------------------------|-------------------
Can recieve planes      | Plane, Airport
Can release planes      | Plane, Airport
Can count planes        |


Plane                   | Collaborators
------------------------|-------------------
Can take off            | Airport
Can land                | Airport
Knows status            |

Weather                 | Collaborators
------------------------|--------------------
Can be sunny            | Airport
Can be stormy           | Airport



Ultimately I ended up creating the following classes and modules:

Classes
-------

* Airport
* Plane

Modules
-------

* Weather
___________________________

##How to use Airport

To use in irb:
```shell
require 'lib/weather.rb'
require 'lib/airport.rb'
require 'lib/plane.rb'
```
To create an airport:
```shell
airport = Airport.new(:capacity => 10)
```
To create planes:
```shell
plane1 = Plane.new
plane2 = Plane.new
etc
```
To land planes at the airport:
```shell
plane1.land!(airport)

'nb. Should the airport be stormy or full an error message will be received'
```

To fly planes:
```shell
plane1.take_off!(airport)

'nb. Should the airport be stormy then an error message will be received'
```

_______________________________

##Issues faced

Whilst I found doubles fairly straightforward to work with, I found it quite difficult finding a way to stub the random generator - particularly in the integrated test when it needed to be stubbed for all 6 planes

##Future intentions

I will probably come back and improve the code as my ability with ruby improves. I suspect that some of the methods could be simpler.

