# Test of Izhikevich Spiking model in Python
# Proof of concept

# Eric Yeats and Brady Taylor

import numpy.random as rand

class Izhikevich:
	"""
	Modular Izhikevich spiking neuron model
	packages internal state with spiking interface
	"""

	"""Constructor for spiking model with default values from paper"""
	def __init__(self, a=0.02, b=0.2, c=-65.0, d=2.0):
		self.a = a
		self.b = b
		self.c = c
		self.d = d
		self.v = c
		self.u = d

	def nextState(self, I):
		self.v += (0.04*self.v*self.v) + (5*self.v) \
			+ 140.0 - self.u + I
		self.u += self.a * (self.b*self.v - self.u)
		if (self.v >= 30):
			self.v = self.c
			self.u = self.u + self.d

	def getState(self):
		return self.v, self.u
