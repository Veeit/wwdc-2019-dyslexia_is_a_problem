# wwdc-2019 
# About this PlaygroundBook

I wanted to show people the power of ML and explain that dyslexia is a real problem in the modern world. 


![VisuelPicture of ML](ml.png)
# The handwritting Machine learning (ML)
 
 In this playground, I used my ML model for handwritten letter recognizing.
 
 ## Maybe you don't know ML?
 
 "Machine learning (ML) is the scientific study of algorithms [...] to effectively perform a specific task without using explicit instructions, relying on patterns and inference instead." - [Wikipedia](https://en.wikipedia.org/wiki/Machine_learning)
 
 Basically, ML is a simple AI program that learns itself with a specific pattern. The big difference between ML and real AI is that ML learns once in training, than never again.
 
 about this Model:
 - 20 epoches
 - 32 filters
 - 2 Dropouts
 - input: 28x28px images
 
 ## How I trained:
 
 Create ML needs a lot of time, because it shows each image while it is trained. This makes it very slow. Not good.
 On the otherside Keras is console based, so it is really fast. The problem is that it is not easy to use.
 
 ## About the dataset:
 
 The emnist dataset is an extended version of the mnist dataset. The letter version of emnist provides 103k images in total, 88k for training and 14.8k for testing.


 # About dyslexia:
 
 Dyslexia is a problem which have 20% of all people, I´m one of them. the biggest problems are in school. The most common problem is that the people with dyslexia spell like they hear the words, but you know that it is often not the case. People with this problem can get in a lot of trouble in jobs or in school. I want to show you how hard it can be to bead dylexia.
 
 I am focusing on 2 problem:
 - the problem of similar letters (d - b,q - p,n - m, e - i, k - g)
 - ignoreing letters
