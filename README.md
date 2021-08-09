# enigma


##Weston's self assessment

**Functionality:** strong meets expectation

**Object Oriented Programming:** strong meets expectations

**Ruby Conventions and Mechanics:** judgment call about whether above expectations or meets expectations

**Test Driven Development:** strong meets expectations

**Overall:** Pass

###Reasoning/evidence

**Functionality:**
Not much to say here, both enigma methods work, and the commandline interface works.


**Object Oriented Programming:**
I believe that the structure of my project is strong. The enigma class is the
'face' of the project. It deals with data organization/presentation and argument
generation (if applicable). The shift class only deals with generating the final shift for
the actual encrypting process. The character class is the class that mechanically
encrypts any given character (along with the accompanying shift number). The crypt
class is not only the best named class (imo), but is also the gearbox class. It
takes the relevant data from enigma and meshes it with the shift class. It then
processes the message data into the form that character needs. File interactor
is exactly what it is named. It deals with getting info from files and writing
encryption outputs.

The only reason why I did not assign myself above expectations here is because
I did not use either a module or inheritance. I didn't include one of those because
it just did not make sense with the way I structured the rest of the project and
did not want to force one. Maybe I would've implemented either inheritance or
modules if I went on to include the crack method.

**Ruby Conventions and Mechanics:**

I believe that everything is reasonably well named (except character), I have
(largely) used the most appropriate enumerators, and all of my syntax is consistent
while adhering to convention. I would put myself solidly into above expectations
except I have a single method that is ~16 lines long. So that's why it's a judgment
call (imo).

**Test Driven Development:**

My coverage is 100%, every method has at least one expect statement, I have used
mock/stubs a few times, mainly to deal with randomness.The original dummy tests i
had for enigma contained stubs that were such that they did not rely on other
classes, but I got rid of them because they were dumb and my planned structure
changed.
