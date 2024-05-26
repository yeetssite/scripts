#!/bin/python
import os
os.system("clear")
import time
import inquirer



questions = [
   inquirer.List(
      "size",
      message="Oh shit! Someone called your mom a dirty ho, say somthing back!",
      choices=["I fucked ur dad", "I fucked ur mom",],
   ),
]

answer = str(inquirer.prompt(questions))                                                                                                                                                                           
time.sleep(0.2)
if "mom" in answer:
   gender = "mom" 
   b = "she's hot"
   otherdude = "Damn *cries about it*"
   time.sleep(0.2)
elif "dad" in answer:
   gender = "dad"
   b = "IM GAYY"
   otherdude = "bruh (you failed)"
   time.sleep(0.2)
print(str("You:"),str("I fucked ur"),gender,str("cuz"),b)
print(str("Other guy:"),otherdude)
time.sleep(0.2)
exit(0)

